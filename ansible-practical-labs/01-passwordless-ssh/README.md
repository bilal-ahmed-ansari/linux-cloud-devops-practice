# Passwordless SSH Authentication

## Objective

Set up SSH key-based authentication between Ubuntu WSL and an AWS EC2 instance.

After completing the setup, I can connect to the EC2 instance without entering the password.

## Environment

- Control Node: Ubuntu WSL
- Managed Node: AWS EC2
- User: ubuntu
- Authentication: SSH key


Step 1: When you create an EC2 instance, AWS gives you a .pem private key.

For example:

my-key.pem

Initially, you use this .pem file to connect:

ssh -i my-key.pem ubuntu@<EC2-PUBLIC-IP>

The problem is that Ansible needs to connect to the EC2 server repeatedly. Instead of depending on the .pem key every time, we can copy your SSH public key to the EC2 server.

After that, SSH authentication can happen using your SSH key pair.

Step 2: Check SSH Keys

Check whether an SSH key already exists in WSL machine:

ls -l ~/.ssh/

If a key does not exist, create one:

ssh-keygen

This creates:

id_ed25519
id_ed25519.pub

id_ed25519 is the private key.

Do not share the private key.

**********

1. What are the two keys?

Your SSH setup has two keys:

Private Key  → ~/.ssh/id_ed25519
Public Key   → ~/.ssh/id_ed25519.pub

Think of it like:

Private key = Your secret key 
Public key  = Key that you give to the server

Never share your private key.

The .pem file you downloaded from AWS is also a private key.

2. Why are we using the AWS .pem key?

Suppose your EC2 server is:

EC2 Public IP = 13.234.56.78

And your AWS key is:

my-key.pem

Initially, EC2 trusts this AWS key.

So you can connect:

ssh -i ~/.ssh/my-key.pem ubuntu@13.234.56.78

**********

Step 3: The command

ssh-copy-id -f "-o IdentityFile=~/.ssh/YOUR-KEY.pem" ubuntu@EC2-PUBLIC-IP

Let's break it down.

a) ssh-copy-id

This command copies your public SSH key to the remote server.

Normally, it copies:

~/.ssh/id_ed25519.pub

to the EC2 user's:

~/.ssh/authorized_keys

b) -f means force.

What does -f do?

Normally, ssh-copy-id first checks whether the public key is already installed on the remote server.

With:

-f

you are telling ssh-copy-id:

"Don't worry about checking whether the key already exists. Force the installation of the public key."

c) -o IdentityFile=...

This tells SSH:

"Use this AWS .pem private key to authenticate to the EC2 server."

Step 4: Test passwordless SSH

After copying the key, try:

ssh ubuntu@13.234.56.78

Notice that we didn't use -i my-key.pem.

If everything is configured correctly, SSH should use your local SSH key automatically.

You can verify:

ssh -v ubuntu@13.234.56.78

Note:-

1. Without -f:

ssh-copy-id ubuntu@13.234.56.78

It may try to authenticate using your normal SSH keys.

2. With -f:

ssh-copy-id -f "-o IdentityFile=~/.ssh/my-key.pem" ubuntu@13.234.56.78

You're saying:

"Use this .pem key to get into EC2, and force-copy my public key."

3. Never upload these files to GitHub:

.pem
private SSH keys
passwords
AWS access keys

id_ed25519.pub is the public key.
