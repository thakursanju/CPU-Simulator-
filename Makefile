# CPU Scheduler Simulator v2.0 Makefile
# Enhanced with multiple algorithms and professional features

CC = gcc
CFLAGS = -Iinclude -Wall -Wextra -std=c99 -O2
DEBUGFLAGS = -g -DDEBUG
SRCDIR = src
INCDIR = include
TESTDIR = test_cases
BUILDDIR = build

# Source files for all algorithms and utilities
SOURCES = $(SRCDIR)/main.c \
          $(SRCDIR)/fcfs.c \
          $(SRCDIR)/sjf.c \
          $(SRCDIR)/priority.c \
          $(SRCDIR)/rr.c \
          $(SRCDIR)/srtf.c \
          $(SRCDIR)/metrics.c \
          $(SRCDIR)/file_io.c \
          $(SRCDIR)/utils.c

# Object files
OBJECTS = $(SOURCES:$(SRCDIR)/%.c=$(BUILDDIR)/%.o)

# Main executable
TARGET = scheduler

# Default target
all: $(BUILDDIR) $(TARGET)

# Create build directory
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Build main executable
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)
	@echo "✓ CPU Scheduler Simulator built successfully!"

# Compile object files
$(BUILDDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Debug build
debug: CFLAGS += $(DEBUGFLAGS)
debug: clean $(TARGET)
	@echo "✓ Debug build completed!"

# Create test directory and sample files
setup-tests: $(TESTDIR)
	@echo "Creating sample test cases..."
	@echo "# Sample Test Case 1 - Basic processes" > $(TESTDIR)/test1.txt
	@echo "# PID ArrivalTime BurstTime Priority" >> $(TESTDIR)/test1.txt
	@echo "0 0 5 2" >> $(TESTDIR)/test1.txt
	@echo "1 1 3 1" >> $(TESTDIR)/test1.txt
	@echo "2 2 8 3" >> $(TESTDIR)/test1.txt
	@echo "3 3 6 1" >> $(TESTDIR)/test1.txt
	@echo ""
	@echo "# Sample Test Case 2 - Varied arrival times" > $(TESTDIR)/test2.txt
	@echo "# PID ArrivalTime BurstTime Priority" >> $(TESTDIR)/test2.txt
	@echo "0 0 4 3" >> $(TESTDIR)/test2.txt
	@echo "1 2 2 1" >> $(TESTDIR)/test2.txt
	@echo "2 4 1 2" >> $(TESTDIR)/test2.txt
	@echo "3 5 3 1" >> $(TESTDIR)/test2.txt
	@echo "4 6 2 4" >> $(TESTDIR)/test2.txt
	@echo ""
	@echo "# Sample Configuration File" > $(TESTDIR)/config.txt
	@echo "# Configuration for CPU Scheduler" >> $(TESTDIR)/config.txt
	@echo "time_quantum=3" >> $(TESTDIR)/config.txt
	@echo "# Time quantum for Round Robin algorithm" >> $(TESTDIR)/config.txt
	@echo ""
	@echo "✓ Test cases and configuration files created in $(TESTDIR)/"

# Create test directory
$(TESTDIR):
	mkdir -p $(TESTDIR)

# Run tests with different algorithms
test: $(TARGET) setup-tests
	@echo "Running test cases..."
	@echo "\n=== Testing with Sample Data ==="
	./$(TARGET)

# Run specific algorithm tests
test-fcfs: $(TARGET) setup-tests
	@echo "Testing FCFS algorithm..."
	@echo "1\n$(TESTDIR)/test1.txt\n" | ./$(TARGET)

test-sjf: $(TARGET) setup-tests
	@echo "Testing SJF algorithm..."
	@echo "2\n$(TESTDIR)/test1.txt\n" | ./$(TARGET)

test-priority: $(TARGET) setup-tests
	@echo "Testing Priority algorithm..."
	@echo "3\n$(TESTDIR)/test1.txt\n" | ./$(TARGET)

test-rr: $(TARGET) setup-tests
	@echo "Testing Round Robin algorithm..."
	@echo "4\n$(TESTDIR)/test1.txt\n" | ./$(TARGET)

test-srtf: $(TARGET) setup-tests
	@echo "Testing SRTF algorithm..."
	@echo "5\n$(TESTDIR)/test1.txt\n" | ./$(TARGET)

# Performance benchmarking
benchmark: $(TARGET) setup-tests
	@echo "Running performance benchmarks..."
	@time ./$(TARGET) < $(TESTDIR)/benchmark_input.txt

# Install (copy to /usr/local/bin)
install: $(TARGET)
	@echo "Installing CPU Scheduler Simulator..."
	sudo cp $(TARGET) /usr/local/bin/
	@echo "✓ Installed to /usr/local/bin/$(TARGET)"

# Uninstall
uninstall:
	@echo "Uninstalling CPU Scheduler Simulator..."
	sudo rm -f /usr/local/bin/$(TARGET)
	@echo "✓ Uninstalled from /usr/local/bin/"

# Code formatting (requires clang-format)
format:
	@echo "Formatting source code..."
	@if command -v clang-format >/dev/null 2>&1; then \
		clang-format -i $(SOURCES) $(INCDIR)/*.h; \
		echo "✓ Code formatted successfully!"; \
	else \
		echo "⚠ clang-format not found. Skipping formatting."; \
	fi

# Static analysis (requires cppcheck)
analyze:
	@echo "Running static analysis..."
	@if command -v cppcheck >/dev/null 2>&1; then \
		cppcheck --enable=all --std=c99 --inconclusive $(SRCDIR)/ $(INCDIR)/; \
	else \
		echo "⚠ cppcheck not found. Skipping analysis."; \
	fi

# Memory leak check (requires valgrind)
memcheck: $(TARGET)
	@echo "Running memory leak check..."
	@if command -v valgrind >/dev/null 2>&1; then \
		valgrind --leak-check=full --show-leak-kinds=all ./$(TARGET); \
	else \
		echo "⚠ valgrind not found. Skipping memory check."; \
	fi

# Documentation generation
docs:
	@echo "Generating documentation..."
	@echo "CPU Scheduler Simulator v2.0" > USAGE.md
	@echo "============================" >> USAGE.md
	@echo "" >> USAGE.md
	@echo "## Building" >> USAGE.md
	@echo "make all" >> USAGE.md
	@echo "" >> USAGE.md
	@echo "## Running Tests" >> USAGE.md
	@echo "make test" >> USAGE.md
	@echo "" >> USAGE.md
	@echo "## Available Algorithms" >> USAGE.md
	@echo "1. FCFS - First Come First Served" >> USAGE.md
	@echo "2. SJF - Shortest Job First" >> USAGE.md
	@echo "3. Priority - Priority Scheduling" >> USAGE.md
	@echo "4. Round Robin - Time-sliced execution" >> USAGE.md
	@echo "5. SRTF - Shortest Remaining Time First" >> USAGE.md
	@echo "✓ Documentation generated in USAGE.md"

# Package for distribution
package: clean
	@echo "Creating distribution package..."
	tar -czf cpu-scheduler-v2.tar.gz --exclude='*.o' --exclude='$(TARGET)' --exclude='$(BUILDDIR)' .
	@echo "✓ Package created: cpu-scheduler-v2.tar.gz"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(BUILDDIR)
	rm -f $(TARGET)
	rm -f *.o
	@echo "✓ Clean completed!"

# Deep clean (including test files and documentation)
distclean: clean
	@echo "Deep cleaning..."
	rm -rf $(TESTDIR)
	rm -f USAGE.md
	rm -f *.tar.gz
	rm -f results_*.txt
	@echo "✓ Deep clean completed!"

# Show help
help:
	@echo "CPU Scheduler Simulator v2.0 - Build System"
	@echo "============================================="
	@echo ""
	@echo "Available targets:"
	@echo "  all          - Build the main executable"
	@echo "  debug        - Build with debug symbols"
	@echo "  test         - Run all test cases"
	@echo "  test-<alg>   - Run specific algorithm test (fcfs, sjf, priority, rr, srtf)"
	@echo "  setup-tests  - Create sample test cases and configuration"
	@echo "  benchmark    - Run performance benchmarks"
	@echo "  install      - Install to system PATH"
	@echo "  uninstall    - Remove from system PATH"
	@echo "  format       - Format source code (requires clang-format)"
	@echo "  analyze      - Run static analysis (requires cppcheck)"
	@echo "  memcheck     - Check for memory leaks (requires valgrind)"
	@echo "  docs         - Generate documentation"
	@echo "  package      - Create distribution package"
	@echo "  clean        - Remove build artifacts"
	@echo "  distclean    - Remove all generated files"
	@echo "  help         - Show this help message"
	@echo ""
	@echo "Examples:"
	@echo "  make all && make test    # Build and test"
	@echo "  make debug              # Build with debugging"
	@echo "  make test-fcfs          # Test only FCFS algorithm"

# Declare phony targets
.PHONY: all debug test setup-tests test-fcfs test-sjf test-priority test-rr test-srtf \
        benchmark install uninstall format analyze memcheck docs package clean \
        distclean help
