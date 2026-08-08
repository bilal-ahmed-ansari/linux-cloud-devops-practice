Linux RAID – Hands-on Lab

1. Overview

This lab demonstrates hands-on practice with Linux software RAID using mdadm on Ubuntu.

The lab was performed in a VMware Ubuntu environment using virtual disk files as safe RAID test disks.

2. Technologies
Ubuntu Linux
VMware Workstation
Linux software RAID
mdadm
ext4
Loop devices
Linux storage commands

3. Lab Environment
Host RAM: 8 GB
Ubuntu VM RAM: 4 GB
Ubuntu VM CPU: 2 vCPU
Ubuntu VM Disk: 30 GB
RAID lab disks: 1 GB virtual disks

The RAID disks were created as virtual disk files and attached as loop devices to avoid modifying the main Ubuntu disk.

4. RAID Concept

RAID stands for Redundant Array of Independent Disks.

RAID combines multiple disks to provide performance, redundancy, or both.

RAID	  Minimum Disks	    Main Purpose	                  Fault Tolerance
RAID 0	 2	                Performance	                    None
RAID 1	 2	                Redundancy	                    1 disk
RAID 5	 3	                Performance + Redundancy	      1 disk
RAID 6	 4	                Higher Redundancy	              2 disks
RAID 10	 4	                Performance + Redundancy	      Depends on failed disk

a) RAID 0

RAID 0 uses striping.

Data is distributed across multiple disks.

Data
 ↓
Disk 1 + Disk 2
 ↓
Striped data
Advantages
Good read/write performance
Full disk capacity can be used

Disadvantage
No redundancy
Failure of one disk can cause data loss

==> Practical Lab:
Created RAID 0 using:

Step1: sudo mdadm --create --verbose /dev/md0 \
--level=0 \
--raid-devices=2 \
/dev/loop10 /dev/loop11

Step2: Verified:

cat /proc/mdstat
sudo mdadm --detail /dev/md0

Step3: Created filesystem:

sudo mkfs.ext4 /dev/md0

Step4: Mounted:

sudo mkdir /raid0
sudo mount /dev/md0 /raid0

b) RAID 1

RAID 1 uses mirroring.

The same data is written to two disks.

        Data
         |
    ┌────┴────┐
    ↓         ↓
 Disk 1     Disk 2
  DATA       DATA
Advantages
Provides redundancy
Data remains available after one disk failure

Disadvantage
50% usable capacity with two equal-sized disks

==> Practical Lab:
Created RAID 1:

Step1: sudo mdadm --create --verbose /dev/md0 \
--level=1 \
--raid-devices=2 \
/dev/loop10 /dev/loop11

Step2: Verified:

sudo mdadm --detail /dev/md0

Step3: Created filesystem:

sudo mkfs.ext4 /dev/md0

Step4: Mounted:

sudo mkdir /raid1
sudo mount /dev/md0 /raid1

Step5: RAID 1 Failure Simulation

Simulated a disk failure:

sudo mdadm /dev/md0 --fail /dev/loop10

Step6: Checked RAID status:

cat /proc/mdstat

Checked details:

sudo mdadm --detail /dev/md0

The RAID became degraded but remained available using the remaining disk.

Step7: Removed the failed disk:

sudo mdadm /dev/md0 --remove /dev/loop10

Step8: Added a replacement disk:

sudo mdadm /dev/md0 --add /dev/loop12

Step9: Monitored rebuild:

cat /proc/mdstat

Step10: Verified the RAID after rebuild:

sudo mdadm --detail /dev/md0

Step11: Verified that the test data was still available:

cat /raid1/data.txt

c) RAID 5

RAID 5 uses striping with distributed parity.

Minimum disks:

3

It can tolerate one disk failure.

Step1: Created RAID 5:

sudo mdadm --create --verbose /dev/md0 \
--level=5 \
--raid-devices=3 \
/dev/loop10 /dev/loop11 /dev/loop12

Step2: Checked status:

cat /proc/mdstat

Checked details:

sudo mdadm --detail /dev/md0

Step3: Created filesystem:

sudo mkfs.ext4 /dev/md0

Step4: Mounted:

sudo mkdir /raid5
sudo mount /dev/md0 /raid5

Step5: Tested:

echo "RAID 5 Lab" | sudo tee /raid5/test.txt

Step6: RAID 5 Failure Simulation

Simulated a disk failure:

sudo mdadm /dev/md0 --fail /dev/loop10

Step7: Checked RAID status:

cat /proc/mdstat

Step8: Verified that the RAID remained accessible:

cat /raid5/test.txt

Step9: Removed the failed disk:

sudo mdadm /dev/md0 --remove /dev/loop10

Step10: Added the replacement:

sudo mdadm /dev/md0 --add /dev/loop10

Step11: Monitored the rebuild:

cat /proc/mdstat

Step12: Verified the RAID after recovery:

sudo mdadm --detail /dev/md0

d) RAID 10 – Concept

RAID 10 combines mirroring and striping.

RAID 10
   |
   +--- RAID 1 → Disk 1 + Disk 2
   |
   +--- RAID 1 → Disk 3 + Disk 4

Minimum disks:

4

RAID 10 provides good performance and redundancy.

5. RAID Monitoring and Troubleshooting

Important commands:

cat /proc/mdstat
sudo mdadm --detail /dev/md0
lsblk
df -h

6. Troubleshooting approach:

RAID degraded
     ↓
Check /proc/mdstat
     ↓
Check mdadm --detail
     ↓
Identify failed disk
     ↓
Remove failed disk
     ↓
Add replacement disk
     ↓
Monitor rebuild
     ↓
Verify healthy RAID

7. RAID vs Backup

RAID is not a backup.

RAID protects against certain disk failures and helps maintain availability.

Backup provides a separate copy of data that can be restored after accidental deletion, corruption, ransomware, or other data-loss situations.

Note:- Key Learning
Learned the difference between RAID 0, RAID 1, RAID 5, and RAID 10.
Configured Linux software RAID using mdadm.
Practiced RAID creation and filesystem mounting.
Simulated disk failures in RAID 1 and RAID 5.
Removed failed disks and added replacement disks.
Monitored RAID rebuild/recovery using /proc/mdstat.
Practiced RAID troubleshooting using mdadm.
Understood the difference between RAID and backup.
