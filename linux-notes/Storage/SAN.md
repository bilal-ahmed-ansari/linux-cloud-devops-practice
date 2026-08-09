1. What is SAN?

Now SAN is different.

SAN = Storage Area Network

The easiest way to remember:

NAS gives you a FILE/FOLDER. SAN gives you a DISK.

2. NAS
NAS
 ↓
Shared folder
 ↓
/mnt/shared


SAN
SAN
 ↓
Block storage
 ↓
/dev/sdb

3. Why does SAN give a disk?

Imagine you have a central storage server:

             SAN Storage
                  |
             ┌────┴────┐
             ↓         ↓
          Server 1   Server 2

The storage system gives Server 1 a block device.

Linux may see:

lsblk

and show:

sda    30G
sdb     1T

Here:

/dev/sda → Local disk
/dev/sdb → SAN disk

The Linux administrator can now treat /dev/sdb like a normal disk.

For example:

sudo mkfs.ext4 /dev/sdb

Then:

sudo mkdir /data
sudo mount /dev/sdb /data

Now:

SAN
 ↓
/dev/sdb
 ↓
ext4
 ↓
/data
 ↓
files

This is block storage.

4. What is block storage?

Think about a new hard disk.

When you buy a new disk and connect it to Linux:

lsblk

you might see:

sdb   100G

Linux doesn't initially say:

/home
/data
/documents

It just sees a block device.

You decide what to do with it:

/dev/sdb
    ↓
partition
    ↓
filesystem
    ↓
mount
    ↓
/data

SAN works similarly.

The SAN gives the server the storage as a block device.
