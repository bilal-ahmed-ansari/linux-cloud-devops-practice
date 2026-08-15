# Passwordless SSH Authentication

## Objective

Set up SSH key-based authentication between Ubuntu WSL and an AWS EC2 instance.

After completing the setup, I can connect to the EC2 instance without entering the password.

## Environment

- Control Node: Ubuntu WSL
- Managed Node: AWS EC2
- User: ubuntu
- Authentication: SSH key

## Step 1: Check SSH Keys

Check whether an SSH key already exists:

```bash
ls -l ~/.ssh/

If a key does not exist, create one:

ssh-keygen

This creates:

id_ed25519
id_ed25519.pub

id_ed25519 is the private key.

Do not share the private key.

Step 2: Copy Public Key to EC2

The AWS .pem key is used for the initial connection.

Command:

ssh-copy-id -f "-o IdentityFile=~/.ssh/YOUR-KEY.pem" ubuntu@EC2-PUBLIC-IP

Replace:

YOUR-KEY.pem with your EC2 key
EC2-PUBLIC-IP with your EC2 public IP

The public key is copied to the EC2 instance.

Step 3: Test SSH

Now connect to the EC2 instance:

ssh ubuntu@EC2-PUBLIC-IP

If the setup is correct, SSH connects without asking for the password.

=> Result

Passwordless SSH authentication is working between WSL and the EC2 instance.

=> Important

Never upload these files to GitHub:

.pem
private SSH keys
passwords
AWS access keys

id_ed25519.pub is the public key.
