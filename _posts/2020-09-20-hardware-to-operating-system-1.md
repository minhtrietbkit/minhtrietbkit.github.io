---
title: "From Hardware to Operating System"
date: 2020-09-20
layout: post
category: linux
---

Following summary is extracted from Chapter 2 and 3 of [Computer Architecture and Organization](https://www.amazon.com/Computer-Architecture-Organization-Core2duo-Beyond/dp/813176155X), briefly disccusing how CPU works.

**NOTE**: Most of this summary are full quotes from the book.

# Some Components in a Processor:

1. Processor Clock:
   - Starts almost the moment a computer is switched on
   - Simple digital signal producing on and off states alternately, at equal time intervals
   - This oscillating phenomenon generates two different edges of the clock signal, rising edge (positive edge) and falling edge (negative edge).
   - These edges or transitions increment/decrement any binary counter.
   - Which counter is affected by this process? The answer is–the Program Counter.
   * This clock signal
2. Program Counter (PC):
   - There's one inside every Processor.
   - The width (number of bits accommodated) of this counter varies from processor to processor.
   - Incremented by one at rising (or falling depeneding on the processor) edge of the clock signal.
   * This group of bits is known as `address signal` and targets one location on the main memory.
   * To obtain or read any data, its address along with a `memory-read command` is necessary.
   * It is the duty of the CPU to generate the read-memory command, which is designated as a `control signal`.

**NOTE** PC value can be alternate, which allows branching in programs.

# Bus Structure

1.  Internal Bus:

    Processor has 3 types of buses for external interfacing:

    - Address bus (uni-directional from Processor to other devices)
    - Data bus (bi-directional)
    - Control bus (uni-directional from Processor to other devices)

    This internal bus, composed of address bus, data bus and control bus communicates the signals in a synchronous fashion.

    It is the system clock, which is responsible for maintaining this synchronization.

    All devices attached with this internal bus must follow the processor clock

2.  External Bus:

    Similar to the processor of a computer, other devices also have their own processors inside.

    Each processor runs with its own clock frequency, therefore, data communication between processor and other external devices cannot be synchronized. The difference in their clock speeds must be respected.

    The only way to solve this communication problem is to adopt an asynchronous communication technique.

# Processor Workflow:

This loop runs until the machine is shutdown:

1.  Increment PC by one
2.  Send PC to memory through address bus and send read signal
3.  Get instruction from memory via data bus (If we assume content of memory at address designated by the group of bits sent from PC is an instruction)
4.  Decode instruction
5.  Execute instruction

# Hardware To Software

From electronic point of view, any software may be visualized as a set of sequential signals.

The entire data processing and control operations may be broken down into two smallest modules, namely:

- Data storage
- Data flow control.

The electronic mechanisms to implement these two functions, respectively, are known as:

- Flip-flop
- Gate

Gate (AKA Logic Gate) is building block for flip-flops. Therefore, digital logic may be taken as the starting point, consisting of the smallest building blocks of the computer.

# How Data is Stored in CPU?

1. Registers inside CPU stores data.
1. Registers can be made up of D flip-flops.
1. D flip-flops:
   - One input (D)+ clock signal (CLK)
   - When CLK is 0, Q doesn't change
   - When CLK is 1, D determines Q

Following is a reasonable explanation of how data is stored. More [here](https://electronics.stackexchange.com/questions/522410/i-understand-how-d-flip-flop-works-but-still-not-understand-how-it-store-a-bit/).

In the case of a register, the clock signal can be replaced by an `Enable Signal`, which is the result of `CLK AND CPU_CONTROL_SIGNAL`. This means that whenever CPU issues a command such as write or read, should the flip-flop be active.

Active flip-flop is one that is ready to accept input D and return output Q.

When data is to be written to flip flop,

- CPU sends `write signal` and `AND` with the `CLK` (for synchronization purpose). The resulted `Enable Signal` will be 1, rendering the flip flop active.
- Data to be written is sent to flip flop input D.

When data is to be read from flip flop,

- CPU sends `read signal` and `AND` with the `CLK` (again for synchronization purpose). The resulted `Enable Signal` will be 1, rendering the flip flop active.

At this point, the Q value depends on the immediate input D value. I can't explain how to nullify this with my model but I think this is the basic idea of how it works.
