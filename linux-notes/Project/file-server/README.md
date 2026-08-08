1. Linux File Server – NFS & Samba
a) Overview

This project contains my hands-on lab practice with NFS and Samba file sharing on Ubuntu Linux.

I configured Ubuntu as a file server and practiced sharing files between Linux systems and Windows clients.

b)Technologies

Ubuntu Linux
NFS
Samba / SMB
Linux file permissions
systemd
/etc/exports
/etc/samba/smb.conf
/etc/fstab

c) Lab Architecture
                    Ubuntu Linux
                    File Server
                         |
              ┌──────────┴──────────┐
              |                     |
             NFS                  Samba
              |                     |
        Linux Client          Windows Client

d) NFS

NFS (Network File System) is commonly used to share directories between Linux/Unix systems.

In this lab I practiced:

Installing NFS server
Creating an NFS shared directory
Configuring /etc/exports
Exporting the directory using exportfs
Mounting the NFS share
Testing file access
Configuring persistent mounting using /etc/fstab
Basic NFS troubleshooting

e) Samba

Samba provides SMB/CIFS file sharing and allows Linux directories to be accessed from Windows clients.

In this lab I practiced:

Installing Samba
Creating a shared directory
Creating a Samba user
Configuring /etc/samba/smb.conf
Setting share permissions
Validating configuration using testparm
Managing the smbd service
Accessing the share from Windows
Basic Samba troubleshooting

f) Key Learning

NFS is commonly used for Linux-to-Linux file sharing.
Samba/SMB is commonly used for Linux-to-Windows file sharing.
/etc/exports is used to configure NFS exports.
/etc/samba/smb.conf is used to configure Samba shares.
Linux filesystem permissions are important for controlling file access.
systemctl, exportfs, testparm, df, and journalctl are useful for troubleshooting file-sharing services
