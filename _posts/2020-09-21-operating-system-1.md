---
title: "Operating System 1"
date: 2020-09-21
layout: post
category: linux
---

Following summary is extracted from Chapter 3 of [Operating System Concepts. 9th Edition](https://www.amazon.com/Operating-System-Concepts-Binder-Version/dp/1118129385), briefly disccusing how Progress is represented and works in an Operating System.

**NOTE**: Most of this summary are full quotes from the book; all diagrams are copied from the book.

# How Process is Represented in OS:

A process is represented by a `Process Control Block` in the OS, which contains following information:

| Information                   | Meaning                                                                                                                                                                                                                                                                                                                                     |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Process state                 | new, ready, running, waiting, halted, and so on.                                                                                                                                                                                                                                                                                            |
| Program counter               | indicates the address of the next instruction to be executed for this process                                                                                                                                                                                                                                                               |
| CPU registers                 | vary in number and type, depending on the computer architecture: accumulators, index registers, stack pointers, and general-purpose registers, plus any condition-code information. Along with the program counter, this state information must be saved when an interrupt occurs, to allow the process to be continued correctly afterward |
| CPU-scheduling information    | process priority, pointers to scheduling queues, and any other scheduling parameters.                                                                                                                                                                                                                                                       |
| Memory-management information | include base and limit registers and the page tables, or the segment tables, depending on the memory system used by the operating system                                                                                                                                                                                                    |
| Accounting information        | includes the amount of CPU and real time used, time limits, account numbers, job or process numbers, and so on.                                                                                                                                                                                                                             |
| I/O status information        | includes the list of I/O devices allocated to the process, a list of open files, and so on.                                                                                                                                                                                                                                                 |

PCB simply serves as the repository for any information that may vary from process to process.

On a system that supports threads, the PCB is expanded to include information for each thread.

# Process in Memory

A process in memory typically consists of:

- text section (code),
- program counter
- processors' registers
- stack (temporary data such as local variable return address)
- data section (global variable)
- heap (dynamically allocated memory at run time)

![Process In Memory](/assets/operating-system-1/process-in-memory.png)

# Process State

![Process State Transition](/assets/operating-system-1/process-states.png)

# Process Scheduling

A new process is initially put in the ready queue. It waits there until it is selected for execution (dispatched). Once the process is allocated the CPU and is executing, one of several events could occur:

- The process could issue an I/O request and then be placed in an I/O queue.
- The process could create a new child process and wait for the child's termination.
- The process could be removed forcibly from the CPU, as a result of an interrupt, and be put back in the ready queue.

![Queueing Digram](/assets/operating-system-1/queueing-diagram.png)

Most processes are either:

- `I/O bound`: spends more of its time doing I/O than it spends doing computations
- `CPU bound`: generates I/O requests infrequently, using more of its time doing computations.
