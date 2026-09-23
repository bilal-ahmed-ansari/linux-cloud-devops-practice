1. What I learned

In this lab, I created a Windows Server EC2 instance on AWS and connected to it using Remote Desktop (RDP).

I also learned how to stop and start the EC2 instance and connect to it again.

2. Create Windows Server EC2

I created a Windows Server instance from:

AWS Console → EC2 → Launch Instance

While creating the instance, I selected:

Windows Server AMI
Required instance type
Key pair
Security Group
Required storage

3. Create Key Pair

For the Windows Server, I created a key pair and downloaded the .pem file.

The .pem file is important because AWS uses it to decrypt the Windows Administrator password

4. Allow RDP in Security Group

Windows Server uses RDP (Remote Desktop Protocol).

RDP uses:

Protocol: TCP
Port: 3389

For a lab, I allowed RDP from My IP instead of allowing it from everyone.

5. Get Windows Administrator Password

After the EC2 instance was running:

EC2 → Instances → Select Instance → Connect → RDP client

Then:

Get password → Upload .pem file → Decrypt Password

AWS showed the Windows Administrator password.

6. Download RDP File

From the RDP client page, I downloaded the Remote Desktop file.

The file has the .rdp extension.

I opened the .rdp file from my Windows computer.

7. Connect to Windows Server

When Remote Desktop opened, I entered:

Username: Administrator
Password: <Administrator password>

After login, I was connected to my Windows Server EC2 instance.

8. Disconnect from Windows Server

If I only disconnect from RDP, the Windows Server continues running.

For example, I can simply close the Remote Desktop window.

The EC2 instance is still running in AWS.

So AWS can still charge for the running instance.

9. Stop EC2 Instance After Lab

When I finished my lab, I stopped the EC2 instance from AWS:

EC2 → Instance → Instance state → Stop instance

The instance status changed to:

Stopped

This is better for my lab because I don't need the Windows Server running all the time.

10. Start the Instance Again

When I want to continue my lab:

EC2 → Instance → Instance state → Start instance

I wait until:

Instance state: Running
Status checks: 2/2

Then I check the Public IPv4 address.

=> My Learning Flow
Create Windows Server EC2
          ↓
Create Key Pair (.pem)
          ↓
Configure Security Group
          ↓
Allow RDP - TCP 3389
          ↓
Get Administrator Password
          ↓
Download RDP File
          ↓
Connect using Remote Desktop
          ↓
Do Windows Server Lab
          ↓
Stop EC2
          ↓
Start EC2 when needed
          ↓
Check New Public IP
          ↓
Connect using RDP again

=> What I practiced:-

Creating Windows Server EC2
Creating and using an AWS key pair
Understanding .pem file
Getting Windows Administrator password
Connecting to Windows Server using RDP
Understanding RDP port 3389
Stopping and starting EC2
Reconnecting to Windows Server after starting the instance
