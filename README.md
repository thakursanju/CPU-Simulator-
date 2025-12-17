# 🖥️ CPU Scheduler Simulator

A comprehensive CPU scheduling simulator implemented in C, featuring multiple scheduling algorithms with enhanced visualization and performance analysis.

## ✨ Features

-   **Multiple Algorithms**: FCFS, Round Robin
-   **Enhanced Gantt Chart**: Color-coded timeline with idle time tracking
-   **Comprehensive Metrics**: Turnaround time, waiting time, response time, CPU utilization
-   **Robust Input Validation**: Error handling and user-friendly prompts
-   **Real-time Visualization**: Context switches and CPU idle periods

---

## 🚀 Quick Start

### Build

```bash
make clean && make



Markdown

# 🖥️ CPU Scheduler Simulator v2.0

A professional, feature-rich CPU scheduling simulator implemented in C, featuring multiple scheduling algorithms with enhanced visualization, real-time display, and comprehensive performance analysis.

## ✨ Features

### 🔥 Core Algorithms
- **FCFS** - First Come First Served (Non-preemptive)
- **SJF** - Shortest Job First (Non-preemptive)
- **Priority** - Priority Scheduling (Non-preemptive)
- **Round Robin** - Time-sliced execution (Preemptive)
- **SRTF** - Shortest Remaining Time First (Preemptive)

### 🎨 Advanced Visualization
- **Enhanced Gantt Chart**: Color-coded timeline with idle time tracking
- **Real-time Progress Display**: Live process status and execution monitoring
- **Professional UI**: Colorized output with progress bars and status indicators
- **Context Switch Tracking**: Visual representation of process switches

### 📊 Comprehensive Analytics
- **Performance Metrics**: Turnaround time, waiting time, response time
- **CPU Utilization**: Detailed efficiency analysis
- **Throughput Calculation**: Process completion rates
- **Algorithm Comparison**: Performance benchmarking

### 💾 File I/O & Configuration
- **Batch Processing**: Load processes from files
- **Result Export**: Save simulation results and Gantt charts
- **Configuration Support**: Customizable time quantum and settings
- **Test Case Generation**: Sample data creation tools

### 🛡️ Professional Features
- **Robust Input Validation**: Comprehensive error handling
- **Memory Management**: Efficient allocation and cleanup
- **Cross-platform Support**: Works on Unix/Linux/macOS
- **Extensible Architecture**: Easy to add new algorithms

---

## 🚀 Quick Start

### Build
```bash
make clean && make all
```

### Run Interactive Mode
```bash
./scheduler
```

### Run with File Input
```bash
./scheduler test_cases/test1.txt
```

### Available Make Targets
```bash
make help          # Show all available targets
make test          # Run all test cases
make test-fcfs     # Test specific algorithm
make setup-tests   # Create sample test files
make docs          # Generate documentation
```
Enter number of processes (1-100): 3
Enter Arrival and Burst time for P0: 0 4
Enter Arrival and Burst time for P1: 1 3
Enter Arrival and Burst time for P2: 2 2
📊 Sample Output
Choose Scheduling Algorithm:
1. FCFS (First Come First Served)
2. Round Robin
Enter choice (1-2): 2
Enter Quantum Time (> 0): 2
=================== ENHANCED GANTT CHART ===================
Timeline: | P0 || P1 || P2 || P0 || P1 |
Time:     0   2   4   6   8   9

Legend:
P0/P1/P2... = Process execution
IDLE = CPU idle time
| = Context switch

Timeline Statistics:
Total execution time: 9 units
Total idle time: 0 units (0.0%)
CPU utilization: 100.0%
Context switches: 4
🛠️ Technical Details
Language: C (C99 standard)

Platform: Unix/Linux/macOS

Build System: GNU Make

Dependencies: POSIX-compliant system calls

📈 Algorithms Implemented
FCFS (First Come First Served)

Non-preemptive scheduling

Processes executed in arrival order

Simple but may cause convoy effect

Round Robin

Preemptive scheduling with time quantum

Fair CPU sharing among processes

Good response time for interactive processes

🔧 Error Handling
Input validation for all user inputs

System call error checking

Graceful error recovery

User-friendly error messages

📝 Metrics Explained
AT: Arrival Time - When process arrives

BT: Burst Time - CPU time needed

ST: Start Time - When first executed

CT: Completion Time - When finished

TAT: Turnaround Time - CT - AT

WT: Waiting Time - TAT - BT

RT: Response Time - ST - AT

🎯 Project Structure
CPU Simulator/
├── include/
│   ├── process.h      # Process structure definitions
│   └── scheduler.h    # Function declarations
├── src/
│   ├── main.c         # Main program with input validation
│   ├── fcfs.c         # FCFS algorithm implementation
│   ├── rr.c           # Round Robin implementation
│   ├── metrics.c      # Gantt chart and metrics
│   └── utils.c        # Utility functions
├── Makefile           # Build configuration
└── README.md          # Project documentation
🏆 Key Features
✅ Professional Input Validation
✅ Enhanced Error Handling
✅ Color-coded Gantt Charts
✅ CPU Idle Time Tracking
✅ Context Switch Counting
✅ Comprehensive Performance Metrics
✅ Real-time Execution Display

Built with ❤️ for Operating Systems learning