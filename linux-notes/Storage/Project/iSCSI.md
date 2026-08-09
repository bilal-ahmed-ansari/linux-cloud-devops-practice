1. What is iSCSI?

iSCSI (Internet Small Computer Systems Interface) is a storage protocol that allows a server to access storage over an IP network.

In simple words:

iSCSI allows a server to use storage located on another server/storage system through a network.

Normally, a server may have a local disk:

Linux Server
     |
     ↓
Local Disk
     |
     ↓
/dev/sda

With iSCSI:

Linux Server
     |
     | IP Network
     ↓
iSCSI Storage Server
     |
     ↓
Storage

The remote storage appears to the Linux client as a block device such as /dev/sdb.

2. iSCSI Components

There are two main components:

iSCSI Target

The target is the system that provides storage.

iSCSI Target
     |
     ↓
Provides storage/LUN
iSCSI Initiator

The initiator is the client/server that connects to the target.

iSCSI Initiator
     |
     ↓
Connects to Target

3. What is a LUN?

LUN (Logical Unit Number) is a logical storage unit presented by a storage system to a server.

For example:

Storage
   |
   +--- LUN 0 → 20 GB
   |
   +--- LUN 1 → 50 GB

When an iSCSI initiator connects to the target, the LUN can appear in Linux as:

/dev/sdb

The administrator can then create a filesystem and mount it:

LUN
 ↓
/dev/sdb
 ↓
Filesystem
 ↓
/data

4. iSCSI Port

The standard TCP port used by iSCSI is:

TCP 3260

For example:

192.168.100.10:3260

This means the Linux client connects to the iSCSI service running on the storage server.

5. How iSCSI Works

The basic process is:

iSCSI Server
     |
     ↓
Create Storage
     |
     ↓
Create Target
     |
     ↓
Create LUN
     |
     ↓
Client discovers Target
     |
     ↓
Client logs in
     |
     ↓
LUN appears as /dev/sdb
     |
     ↓
Create Filesystem
     |
     ↓
Mount Storage

Example:

iSCSI Target
192.168.100.10
      |
      | TCP/IP Network
      |
      ↓
iSCSI Initiator
192.168.100.20
      |
      ↓
/dev/sdb
      |
      ↓
ext4
      |
      ↓
/iscsi-data

6. Advantages of iSCSI
Uses standard IP/Ethernet networking.
Relatively inexpensive compared with Fibre Channel.
Easy to implement in a lab environment.
Can provide block-level storage.
Works well with Linux, VMware, and other operating systems.
Can use multipathing for redundancy.
