1. How do you normally log in to an Ubuntu EC2 instance?

When you create an Ubuntu EC2 instance in Amazon Web Services, you normally select/create an EC2 Key Pair.

For example:

EC2 Instance
     |
     | SSH
     |
Your Windows PC
     |
     +---- ubuntu.pem

You download the private key, for example:

my-key.pem

Then you connect:

ssh -i my-key.pem ubuntu@<EC2-Public-IP>

Here, you are not entering an Ubuntu password.

The .pem private key proves that you are authorized to log in.

2. What happens inside the EC2 server?

When the EC2 instance is created, AWS puts the corresponding public key inside the Ubuntu user's SSH configuration.

You have:

Your PC
   |
   | private key (.pem)
   |
   v
EC2 Ubuntu
   |
   | public key
   v
Authorized key

SSH checks whether your private key matches the public key stored on the server.

If they match → login is allowed.

3. Password authentication vs SSH key authentication

These are two different authentication methods.

a) Password authentication:

Username + Password
       |
       v
     Server
       |
    Login

Example:

Username: ubuntu
Password: ********

b) SSH key-based authentication:

Private SSH Key
       |
       v
     Server
       |
   Key verified
       |
     Login

Example:

ssh -i my-key.pem ubuntu@192.168.1.10

No server password is entered.

4. So what does "passwordless SSH" mean?

Passwordless SSH does NOT mean there is no security.

It means:

You can connect through SSH without typing the server's account password because authentication is done using SSH keys.

For example:

ssh ubuntu@192.168.1.10

5. One more important distinction: .pem key vs SSH key setup

For your AWS lab, think of it like this:

AWS EC2
   |
   | Key Pair created
   |
   +---- Public Key → stored on EC2
   |
   +---- Private Key (.pem) → downloaded by you

You use the .pem file to initially access the instance:

ssh -i my-key.pem ubuntu@<EC2-IP>

Later, you can create/configure your own SSH keys and use SSH key-based/passwordless authentication between machines.

6. Let's see exactly how you create your own SSH keys and configure passwordless SSH.

Assume:

Machine A = Your WSL/Ubuntu machine
Machine B = EC2 Ubuntu server

Step 1: Create an SSH key on Machine A

On your WSL/Ubuntu machine:

ssh-keygen

It will ask something like:

Enter file in which to save the key:

Press Enter to accept the default:

~/.ssh/id_ed25519

Then it asks for a passphrase.

For a simple lab, you can press Enter twice to leave it empty.

You now have two files:

~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub

Important:

id_ed25519      = PRIVATE KEY
id_ed25519.pub  = PUBLIC KEY

Never share the private key.

Step 2: Copy the public key to EC2

Initially, you can use your AWS .pem key to access EC2.

For example:

ssh -i my-key.pem ubuntu@<EC2-IP>

Once inside EC2, create the SSH directory if necessary:

mkdir -p ~/.ssh
chmod 700 ~/.ssh

Now you need to put your public key into:

~/.ssh/authorized_keys

You can do this conveniently from Machine A using:

ssh-copy-id -i ~/.ssh/id_ed25519.pub ubuntu@<EC2-IP>

If your EC2 initially only accepts the .pem key, you may need to specify that key:

Note:- When you create an EC2 instance on AWS, Then public key is already configured by AWS itself.

cat ~/.ssh/authorized_keys

will show the public key that AWS installed.

After that, authorized_keys can contain multiple public keys, if you create your own ssh keys and cooy to ec2 instance (by default it eill paste into authorized_keys under EC2 instance).
