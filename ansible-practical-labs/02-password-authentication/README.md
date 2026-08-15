## Objective

Set up password-based SSH authentication on an AWS EC2 Ubuntu instance.

## Step 1: Connect to EC2

Initially connect using the AWS `.pem` key:

ssh -i ~/.ssh/YOUR-KEY.pem ubuntu@EC2-PUBLIC-IP

Step 2: Set Password

Inside the EC2 instance, set a password for the Ubuntu user:

sudo passwd ubuntu

Enter the new password when asked.

You should see:

passwd: password updated successfully

Step 3: Enable Password Authentication

Open the SSH configuration file:

sudo nano /etc/ssh/sshd_config.d/60-cloudimg-settings.conf

Set:

PasswordAuthentication yes

Save and exit.

Step 4: Restart SSH

Restart the SSH service:

sudo systemctl restart ssh

Check the service:

sudo systemctl status ssh

It should show:

Active: active (running)

Step 4: Restart SSH

Restart the SSH service:

sudo systemctl restart ssh

Check the service:

sudo systemctl status ssh

It should show:

Active: active (running)

ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no ubuntu@EC2-PUBLIC-IP

Enter the password that was created earlier.

=> Result

Password-based SSH authentication is working on the EC2 instance.

=> Difference

a)SSH key authentication:

SSH private/public key
        ↓
Authentication
        ↓
Login

b)Password authentication:

Username + Password
        ↓
Authentication
        ↓
Login

This was performed as a practical lab on an EC2 instance.

