1. What is Nutanix?

Nutanix

Nutanix is not just a hypervisor.

It is a complete Hyper-Converged Infrastructure (HCI) platform.

This is the most confusing interview topic.

Let's simplify it.

2. Why was Nutanix created?

Imagine a company has 500 employees.

They need:

Email server
Database server
File server
Application server
Backup server

All these servers need three things:

Compute (CPU & RAM)
Storage (Hard disks/SSD)
Network

In the old days, companies bought these separately.

3. Example:

Server 1 (CPU & RAM)

↓

Storage Box (SAN)

↓

Network Switch

↓

Users

This works, but it has problems:

Expensive
Difficult to manage
Too many cables
Separate teams for server, storage, and network.

If storage fails, many servers stop working

Companies wanted something simpler.

That's why Nutanix was created.

4. What is Nutanix?

Nutanix

Nutanix is a platform that combines:

Servers
Storage
Virtualization
Management

into one solution.

Think of it as an all-in-one data center.

5. Real-life example

Imagine you're buying kitchen appliances.

Old method:

Buy a gas stove
Buy an oven
Buy a microwave
Buy a toaster

Many devices.

Now imagine one appliance that does everything.

That's Nutanix.

6. What is Hyper-Converged Infrastructure (HCI)?

This is the most important interview question.

"HCI" means Hyper-Converged Infrastructure.

Let's understand each word.

a) Infrastructure

Infrastructure means everything needed to run IT systems.

Example:

Servers
Storage
Networking

b) Converged

Converged means combining things together.

Instead of separate devices,

put them together.

c) Hyper-Converged

Hyper-Converged means everything is tightly integrated and managed as one system.

Instead of:

Server

+

Storage

+

Virtualization

+

Management

You get:

One Nutanix Platform

7. What is a Nutanix Node?

A node is simply one physical server.

Example:

Node 1

CPU
RAM
SSD
Hard Disk

That's one node.

8. What is a Cluster?

One server is good.

But companies need many servers.

Suppose we connect four Nutanix nodes.

Node1

Node2

Node3

Node4

Together they become a cluster.

Think of four friends lifting one heavy table.

One person can lift a little.

Four people can lift much more.

Similarly,

four servers work together.

9. Why use a Cluster?

Imagine:

Node1 has

32 CPU
128GB RAM

Now add another node.

Now you have

64 CPU
256GB RAM

Add more nodes.

Resources keep increasing.

This is called scalability.

10. Compute

Compute simply means:

CPU
RAM

Example:

Suppose your VM needs

4 CPU
8GB RAM

Nutanix gives those resources from the cluster.

Think of compute as the "brain and memory" of the VM.

11. Storage is simply the place where data is stored.

For example:

Windows files
Ubuntu operating system
Photos
Videos
Databases

All of these are stored on hard disks (HDD) or SSDs.

Think of storage like a cupboard in your house.

CPU = Brain
RAM = Working table
Storage = Cupboard where everything is kept.

a) Traditional Storage (Before Nutanix)

Imagine a company has 3 servers.

Server 1
Server 2
Server 3

These servers don't have enough storage, so they connect to a separate storage box called a SAN (Storage Area Network).

Server 1 ----\
              \
Server 2 -------> SAN Storage
              /
Server 3 ----/
What is a SAN?

A SAN is a dedicated storage device that contains many hard disks or SSDs.

b) Problem with Traditional Storage

Imagine the SAN suddenly fails.

Server 1 → No storage

Server 2 → No storage

Server 3 → No storage

Even though the servers are healthy, they cannot access their data.

Also:

SAN is expensive.
Requires separate management.
Needs special networking.
Becomes a single point of failure if not designed with redundancy.

c) How Nutanix Solves This

Nutanix says:

"Why buy a separate storage box? Every server already has disks."

So each Nutanix node contains its own storage.

Example:

Node 1
CPU
RAM
500 GB SSD
2 TB HDD

Node 2
CPU
RAM
500 GB SSD
2 TB HDD

Node 3

CPU
RAM
500 GB SSD
2 TB HDD

Each server has its own disks.

d) But here's the magic...

Instead of using only its own disks, Nutanix combines all disks into one storage pool.

Example:

Node 1 = 2 TB
Node 2 = 2 TB
Node 3 = 2 TB

Instead of seeing:

2 TB
2 TB
2 TB

Nutanix combines them into:

6 TB Shared Storage

Every VM can use this shared storage.

This is called Distributed Storage.

12. Where is the VM Stored?

Suppose you create one Ubuntu VM.

You give it

2 CPUs
4 GB RAM
100 GB Disk

Question:

Where is that 100 GB stored?

Answer:

Inside the Nutanix cluster.

Example:

Ubuntu VM

↓

Virtual Disk (100 GB)

↓

Stored across the Nutanix storage pool

a) What if Node 1 Fails?

Suppose your Ubuntu VM's data was stored only on Node 1.

Node 1

Ubuntu Data

Node 1 crashes.

Everything is lost.

This is bad.

b) Nutanix Replication

To prevent this, Nutanix automatically keeps another copy of the data.

Example:

Ubuntu Data

↓

Node 1

↓

Copy

↓

Node 2

If Node 1 fails,

Node 2 still has the data.

This is called Replication.

13. Why Use SSD and HDD Together?

Many Nutanix nodes have both:

SSD (very fast)
HDD (larger and cheaper)

Frequently accessed ("hot") data is often kept on SSD for speed, while less frequently accessed ("cold") data is stored on HDD to save cost.

Example

Think of your study material.

The book you're reading every day stays on your study table (SSD).
Old books stay in the cupboard (HDD).

This makes the system both fast and economical.

14. Self-Healing

Suppose:

Node2 suddenly crashes.

Nutanix automatically:

Detects the failure
Uses the copied data
Starts the VM on another healthy node

No manual work.

This is called self-healing.

15. AHV

AHV means Acropolis Hypervisor.

Remember:

A hypervisor creates and runs virtual machines.

Examples:

VMware → ESXi
Microsoft → Hyper-V
Nutanix → AHV

AHV is Nutanix's built-in hypervisor.

It runs VMs.

16. Prism

Imagine you have 100 servers.

Will you log in to each server?

Very difficult.

Nutanix provides Prism.

Prism is a web-based management console.

Using Prism, you can:

Create VMs
Delete VMs
Monitor CPU
Monitor RAM
Check storage
View alerts
Manage the cluster

Think of Prism as the control room for the entire Nutanix environment.

17. Snapshots

Suppose today your VM is working perfectly.

Before installing updates,

you take a snapshot.

Tomorrow,

the update breaks the server.

Restore the snapshot.

Everything returns to the previous state.

Think of it like saving a game before a difficult mission.

18. Cloning

Suppose you installed Ubuntu.

Then configured:

Apache
MySQL
PHP

Now another team needs the same setup.

Instead of installing everything again,

clone the VM.

Within minutes,

you have another identical VM.

19. Scalability

Need more resources?

Simply add another node.

Example:

Today:

Node1

Node2

Node3

Tomorrow:

Node1

Node2

Node3

Node4

The cluster grows without replacing the entire infrastructure.

20.Compression

Suppose you have a 100 MB text file.

After compression,

it becomes 40 MB.

Less storage is needed.

Nutanix performs compression automatically where appropriate.

21. Deduplication

Suppose:

100 Windows VMs.

All contain the same Windows system files.

Without deduplication:

100 copies stored

With deduplication:

1 copy stored

Used by all VMs

This saves storage space.

22. High Availability (HA)

Suppose:

Node1 crashes.

Your VM was running there.

HA automatically restarts that VM on another healthy node.

Users experience minimal interruption.

Note:-

Memory Trick

Think of Nutanix as a modern apartment building:

Node = One apartment
Cluster = The whole apartment building
AHV = The building manager who assigns rooms (runs VMs)
Prism = The CCTV/control room that monitors the entire building
Distributed Storage = All apartments share a common water and power system
High Availability = If one apartment becomes unusable, people are moved to another apartment
Replication = Important documents are kept in another apartment as a backup
Scalability = Build another apartment block when more families move in
