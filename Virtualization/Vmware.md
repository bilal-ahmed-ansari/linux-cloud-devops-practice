1. What is VMware?

VMware

VMware is a company that develops virtualization software.

It allows one physical server to run many virtual machines.

Think of VMware as software that divides one powerful computer into many smaller computers

2. Example

Suppose a company has

64 CPU
256GB RAM
4TB Disk

Instead of buying 20 servers,

VMware creates

VM1
VM2
VM3
VM4
...
VM20

Each VM gets its own CPU, RAM and Disk.

3. VMware Products
a) VMware Workstation

Used on Windows/Linux laptops.

Best for learning.

Example

Windows Laptop

↓

VMware Workstation

↓

Ubuntu VM
RHEL VM
Windows Server VM

You are already using this.

b) VMware ESXi

Most important for interviews.

Installed directly on server hardware.

Server

↓

ESXi

↓

VM1
VM2
VM3

No Windows required.

c) vCenter Server

Suppose company has

100 ESXi servers

Managing each separately is difficult.

vCenter manages all ESXi hosts from one console.

vCenter

│
├── ESXi1
├── ESXi2
├── ESXi3
├── ESXi4

One dashboard.

4. VMware Features
a) Live Migration (vMotion)

Suppose

Server A

has Ubuntu VM.

Without shutting down,

move VM to

Server B.

Users never notice.

Amazing feature.

b) High Availability (HA)

Suppose

Server crashes.

VMware automatically starts VMs on another server.

No manual work.

c) DRS (Distributed Resource Scheduler)

Suppose

Server A

CPU = 100%

Server B

CPU = 20%

VMware automatically shifts VMs to balance the load..

d) Snapshots

Like taking a photo.

Before making changes,

take snapshot.

If something breaks,

restore.

e) Cloning

Copy an entire VM.

Example

Ubuntu VM

↓

Clone

↓

Ubuntu VM Copy

Ready in minutes.

f) Templates

Instead of installing Ubuntu repeatedly,

create one master VM.

Convert it into template.

Deploy unlimited VMs.

g) VMware Storage

VMs store data in virtual disks.

Example

Ubuntu VM

↓

Ubuntu.vmdk

VMDK means Virtual Machine Disk.

f) VMware Networking

VMware creates virtual switches.

Example

VM1

↓

Virtual Switch

↓

Physical Network

Just like a real switch.
