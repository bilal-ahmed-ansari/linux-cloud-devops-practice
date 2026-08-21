## Objective

Set up password-based SSH authentication on an AWS EC2 Ubuntu instance.

=> What is happening here?

Normally, when you connect to an Ubuntu EC2 instance, you use the .pem private key:

ssh -i ~/.ssh/YOUR-KEY.pem ubuntu@EC2-PUBLIC-IP

This is SSH key-based authentication.

With password authentication, instead of proving your identity using the .pem key, you prove it using:

Username + Password

So the flow becomes:

Your Laptop
    |
    | SSH connection
    | Username: ubuntu
    | Password: ********
    ↓
AWS EC2 Ubuntu
    |
    | Checks password
    ↓
Login successful

=> Your lab, explained step-by-step

1. First login using .pem

You need an initial way to access the EC2 server.

ssh -i ~/.ssh/YOUR-KEY.pem ubuntu@EC2-PUBLIC-IP

The .pem key gets you into the server.

2. Create a password for ubuntu

Inside EC2:

sudo passwd ubuntu

This creates/changes the password of the ubuntu user.

For example:

New password: ********
Retype new password: ********


passwd: password updated successfully

Important: This does not mean SSH will immediately accept the password.

SSH server configuration also needs to allow password authentication.

3. Tell SSH to allow passwords

You edited:

sudo nano /etc/ssh/sshd_config.d/60-cloudimg-settings.conf

and added:

PasswordAuthentication yes

This basically tells the SSH server:

"Password-based login is allowed."

4. Restart SSH

sudo systemctl restart ssh

This makes the SSH service reload the configuration.

You can check:

sudo systemctl status ssh

You want:

Active: active (running)

5. Test password authentication

From your local machine, use:

ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no ubuntu@EC2-PUBLIC-IP

You should get:

ubuntu@EC2-PUBLIC-IP's password:

Enter the password you created with:

sudo passwd ubuntu

If the password is correct, you get logged in.

=> Why are these two options used?

a) -o PreferredAuthentications=password

means:

Prefer password authentication.

And:

b) -o PubkeyAuthentication=no

means:

Don't use SSH public/private key authentication for this connection.
