1. Ubuntu ISO Installation in VMware Workstation

While creating a new Ubuntu VM in VMware Workstation, I learned how to use an Ubuntu ISO image for the installation.

2. What is an ISO Image?

An ISO is a file that contains the installation files of an operating system.

For eg:

Ubuntu ISO
   ↓ 
Ubuntu Installation 
   ↓ 
Ubuntu Virtual Machine

3. How to Use Ubuntu ISO in VMware Workstation
Step 1: Download Ubuntu ISO

Download the Ubuntu ISO file from the official Ubuntu website.

The file will look something like:

ubuntu-24.04.x-desktop-amd64.iso

Step 2. Create a New VM

Open VMware Workstation and select:

Create a New Virtual Machine
→ Typical

Step 3: Select the ISO

Select:

Installer disc image file (ISO)

Click Browse and select the downloaded Ubuntu .iso file.

Step 4: Configure the VM

For my Linux practice VM, I used:

RAM      : 4 GB
CPU      : 2 Cores
Disk     : 30 GB
Network  : NAT

These settings are enough for my basic Linux, Shell Scripting, Git & GitHub, and Ansible practice.

Step 5: Start the VM

Start the VM.

VMware will boot from the ISO and start the Ubuntu installation.

Follow the Ubuntu installation steps such as:

Language selection
Keyboard layout
Disk/File System setup
User account creation
Installation

For this practice VM, I created a normal local Ubuntu user account because this VM is mainly being used for Linux administration and DevOps practice.

4. Issue I Faced During Installation

During the installation, I saw a warning related to:

SMB host controller not enabled

The warning did not stop the installation, so I continued with the Ubuntu setup.

Ubuntu then continued normally and displayed the installation screens.

5. After Ubuntu Installation

After the installation is completed, Ubuntu should boot from the virtual hard disk instead of the ISO.

Sometimes you may see a message like:

Please remove the installation medium, then press ENTER

In VMware, disconnect the ISO:

VM Settings
→ CD/DVD
→ Disconnect

Then press Enter.

The VM should now boot from the virtual hard disk where Ubuntu was installed.

=> Final Setup

Now the Ubuntu VM is ready for Linux practice.
