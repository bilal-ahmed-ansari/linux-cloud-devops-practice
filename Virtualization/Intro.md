1. First Understand Virtualization

Imagine your laptop has:

CPU
RAM
Hard Disk
Network Card

Normally, one operating system uses all these resources.

Example

Laptop
│
├── Windows

But suppose you want Windows, Ubuntu, and Red Hat on the same laptop.

Can you install three operating systems directly?

No.

2. That's why Virtualization was invented.

Virtualization allows one physical computer to run multiple virtual computers.

Example

Physical Server

CPU
RAM
Disk
Network

      │
      ▼

Hypervisor

      │
 ┌────┼─────┐
 │    │     │
 ▼    ▼     ▼

Ubuntu
Windows
RHEL

All run simultaneously
