Samba File Server – Hands-on Lab
Objective

Configure Ubuntu Linux as a Samba/SMB file server and access a Linux shared directory from a Windows client.

1. Install Samba

Updated the package repository:

sudo apt update

Installed Samba:

sudo apt install samba

Checked the Samba service:

sudo systemctl status smbd

2. Create Shared Directory

Created the Samba shared directory:

sudo mkdir -p /data/samba-share

Created a test file:

echo "Hello from Samba Server" | sudo tee /data/samba-share/test.txt

Verified:

ls -l /data/samba-share

3. Create Samba User

Created a Linux user:

sudo useradd smbuser

Set the Linux user's password:

sudo passwd smbuser

Added the user to Samba:

sudo smbpasswd -a smbuser

The Samba password is used when authenticating to the Samba share.

4. Set Directory Ownership

Changed ownership of the shared directory:

sudo chown -R smbuser:smbuser /data/samba-share

Verified:

ls -ld /data/samba-share

5. Configure Samba Share

Backed up the original Samba configuration:

sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

Edited:

sudo nano /etc/samba/smb.conf

Added the following configuration at the end of the file:

[FileShare]
   path = /data/samba-share
   browseable = yes
   read only = no
   valid users = smbuser
   
Configuration Explanation

Setting	            Meaning
[FileShare]	        Name of the Samba share
path	              Linux directory being shared
browseable = yes	  Allows the share to be visible
read only = no	    Allows users to write to the share
valid users	        Specifies which user can access the share

6. Validate Samba Configuration

Before restarting Samba, checked the configuration:

testparm

This helps identify errors in smb.conf.

7. Restart and Enable Samba

Restarted the Samba service:

sudo systemctl restart smbd

Checked the service:

sudo systemctl status smbd

Enabled Samba to start automatically after reboot:

sudo systemctl enable smbd

Checked:

sudo systemctl is-enabled smbd
8. Test Samba Share

Listed available Samba shares:

smbclient -L localhost -U smbuser

Entered the Samba password when prompted.

The FileShare share should appear in the output.

9. Access Samba Share from Windows

Found the Ubuntu IP address:

ip addr

From Windows File Explorer, accessed the share using:

\\<Ubuntu-IP>\FileShare

Example:

\\192.168.1.100\FileShare

Authenticated using the Samba user:

Username: smbuser
Password: <Samba password>

10. Test Read/Write Access

Created a test file from the Windows client inside the Samba share.

Then verified it from Ubuntu:

ls -l /data/samba-share

This confirmed that the Windows client could access the Linux Samba share.

11. Troubleshooting

Useful commands practiced:

sudo systemctl status smbd
testparm
smbclient -L localhost -U smbuser
ls -ld /data/samba-share
journalctl -u smbd

Check Samba ports:

ss -tulpn | grep -E '139|445'

==> Troubleshooting Approach
Windows cannot access Samba share
          ↓
Check Ubuntu IP
          ↓
Check smbd service
          ↓
Run testparm
          ↓
Check smb.conf
          ↓
Check Samba user
          ↓
Check Linux permissions
          ↓
Check Samba logs
          ↓
Test share again

==> Result

Successfully configured Ubuntu as a Samba file server, created an authenticated SMB share, configured user-based access, and tested read/write access from a Windows client.

==> Key Learning

Samba provides SMB/CIFS file sharing between Linux and Windows.
/etc/samba/smb.conf is the main Samba configuration file.
smbpasswd is used to manage Samba user passwords.
testparm validates Samba configuration.
systemctl is used to manage the Samba service.
Both Samba configuration and Linux filesystem permissions can affect access to a shared directory.
