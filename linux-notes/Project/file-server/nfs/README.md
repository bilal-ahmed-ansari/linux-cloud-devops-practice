NFS File Server – Hands-on Lab
Objective

Configure Ubuntu Linux as an NFS file server, create a shared directory, export it, mount it, and test file access.

1. Install NFS Server

Updated the package repository:

sudo apt update

Installed the NFS server:

sudo apt install nfs-kernel-server

Checked the service:

sudo systemctl status nfs-server

2. Create NFS Shared Directory

Created the directory:

sudo mkdir -p /data/nfs-share

Created a test file:

echo "Hello from NFS Server" | sudo tee /data/nfs-share/test.txt

Verified:

ls -l /data/nfs-share

Configure NFS Export

Edited the NFS configuration file:

sudo nano /etc/exports

Added the NFS share:

/data/nfs-share 127.0.0.1(rw,sync)

Meaning
/data/nfs-share → directory being shared
127.0.0.1 → client allowed to access the share in this lab
rw → read and write access
sync → write changes synchronously

4. Apply Export Configuration

Applied the configuration:

sudo exportfs -ra

Verified the export:

sudo exportfs -v

5. Create Mount Point

Created a directory for mounting the NFS share:

sudo mkdir -p /mnt/nfs

6. Mount NFS Share

Mounted the exported directory:

sudo mount -t nfs 127.0.0.1:/data/nfs-share /mnt/nfs

Verified the mount:

df -h

and:

mount | grep nfs

Checked the files:

ls -l /mnt/nfs
7. Test File Access

Created a file through the mounted NFS directory:

echo "NFS test file" | sudo tee /mnt/nfs/client-test.txt

Verified:

ls -l /data/nfs-share

This confirmed that the mounted NFS share was connected to the exported directory.

8. Persistent NFS Mount

Configured /etc/fstab so the NFS share can be mounted automatically.

Example:

127.0.0.1:/data/nfs-share /mnt/nfs nfs defaults,_netdev 0 0

Tested the configuration:

sudo umount /mnt/nfs
sudo mount -a

Verified:

df -h /mnt/nfs
9. Troubleshooting

Useful commands practiced:

sudo systemctl status nfs-server
sudo exportfs -v
df -h
mount | grep nfs
journalctl -u nfs-server
Troubleshooting Approach
NFS share not working
        ↓
Check NFS service
        ↓
Check /etc/exports
        ↓
Run exportfs -ra
        ↓
Check exportfs -v
        ↓
Check mount
        ↓
Check filesystem permissions
 ↓
Check journalctl
Result

Successfully configured and tested an NFS file share on Ubuntu, including exporting, mounting, persistent mounting, file access, and basic troubleshooting.
