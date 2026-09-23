This guide explains how to connect to an Ubuntu EC2 instance on AWS using SSH.

1. Create Ubuntu EC2 Instance

Go to:

AWS Console → EC2 → Launch Instance

Select an Ubuntu Server AMI.

During the setup, create a Key Pair.

For example:

ubuntu-ec2-key.pem

Download the key pair and keep it safe.

The .pem file is required to connect to the EC2 instance using SSH.

2. Check EC2 Instance

After launching the instance, go to:

EC2 → Instances

Make sure:

Instance state: Running
Status checks: 2/2 passed

3. Configure Security Group

Ubuntu EC2 uses SSH for remote connection.

SSH uses:

Protocol: TCP
Port: 22

In the Security Group, allow:

Type: SSH
Port: 22
Source: My IP

For a lab, My IP is safer than allowing 0.0.0.0/0.

4. Get the Public IP

Select the Ubuntu EC2 instance.

Find:

Public IPv4 address

For example:

13.xx.xx.xx

I will use this IP to connect to the instance.

5. Connect from Windows Using SSH

If I am using Windows with PowerShell, Windows Terminal, or WSL, I can use SSH.

First, go to the folder where the .pem file is stored.

For example:

cd ~/Downloads

Then run:

ssh -i ubuntu-ec2-key.pem ubuntu@<PUBLIC-IP>

Example:

ssh -i ubuntu-ec2-key.pem ubuntu@13.xx.xx.xx

6. First-Time Connection

The first time I connect, I may see:

Are you sure you want to continue connecting (yes/no/[fingerprint])?

Type:

yes

Then press Enter.

7. Successful Connection

If the connection is successful, I will see an Ubuntu prompt similar to:

ubuntu@ip-172-31-5-245:~$

Now I am connected to my Ubuntu EC2 instance.

I can run commands such as:

whoami
hostname
uname -a
df -h

8. Disconnect from Ubuntu EC2

When I finish my work, I can disconnect using:

exit

Example:

ubuntu@ip-172-31-5-245:~$ exit
logout

This only disconnects my SSH session.

The EC2 instance will continue running.

9. Stop EC2 After Finishing the Lab

To stop the instance and avoid unnecessary instance charges:

AWS Console → EC2 → Instances → Select Instance → Instance state → Stop instance

The instance will change to:

Stopped

10. Connect Again After Starting

When I want to use the Ubuntu server again:

EC2 → Instances → Select Instance → Start instance

Wait for:

Instance state: Running
Status checks: 2/2 passed

Check the new Public IPv4 address.

If I am not using an Elastic IP, the Public IPv4 address can change after stopping and starting.

Then connect again:

ssh -i ubuntu-ec2-key.pem ubuntu@<NEW-PUBLIC-IP>

The same .pem key can be used.

=> Simple Flow
Create Ubuntu EC2
       ↓
Create Key Pair (.pem)
       ↓
Security Group → SSH (TCP 22)
       ↓
Instance Running
       ↓
Get Public IP
       ↓
SSH Command
       ↓
ssh -i key.pem ubuntu@PUBLIC-IP
       ↓
Ubuntu EC2 Connected
       ↓
Do Linux Administration Lab
       ↓
exit
       ↓
Stop EC2
       ↓
Start EC2 when needed
       ↓
Check New Public IP
       ↓
SSH Again

=> Important Points
Ubuntu EC2 normally uses SSH, not RDP.
SSH uses TCP port 22.
The Ubuntu username is normally ubuntu for the official Ubuntu AMI.
The .pem file is used as the SSH private key.
Keep the .pem file safe and never share it.
chmod 400 can be used to secure the key file on Linux/WSL.
exit disconnects the SSH session but does not stop the EC2 instance.
Stop the EC2 instance when the lab is finished.
The Public IP can change after stopping and starting unless an Elastic IP is being used.

Note:- 

1) If I Get "Permission Denied" for the PEM File

SSH may show an error if the key file permissions are too open.

On Linux/WSL, run:

chmod 400 ubuntu-ec2-key.pem

Then connect again:

ssh -i ubuntu-ec2-key.pem ubuntu@<PUBLIC-IP>
