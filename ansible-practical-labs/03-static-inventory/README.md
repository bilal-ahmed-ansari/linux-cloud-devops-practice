=> Objective

Create a static Ansible inventory and manage two AWS EC2 instances from Ubuntu WSL.

In this lab:

Ubuntu WSL
     |
     ↓
Ansible Control Node
     |
   ┌─┴────┐
   ↓      ↓
 EC2-1   EC2-2
  app     db

  The two EC2 instances are already created. We will tell Ansible which servers exist and how to connect to them.

  1. What is an Ansible Inventory?

An inventory is a file where we define the servers that Ansible needs to manage.

In simple language:

Inventory is like a list of servers for Ansible.

For example:

app1 → Application server
db1  → Database server

Ansible reads this information and knows:

What IP address to use
Which username to use
Which SSH key to use
Which group a server belongs to

Which servers to manage2. What is Static Inventory?

A static inventory is an inventory where we manually write the server information.

For example:

[app]
app1 ansible_host=EC2-1-PUBLIC-IP

[db]
db1 ansible_host=EC2-2-PUBLIC-IP

We manually add the servers and their details.

That's why it is called static.

Simple meaning

Static inventory = We manually maintain the list of servers.

If a new EC2 instance is created, we normally need to add it to the inventory ourselves.

3. Lab Directory

In this lab, our folder is:

03-static-inventory/
├── README.md
└── inventory.ini

The important file is:

inventory.ini

This is our Ansible inventory file.

4. Is inventory.ini a Fixed Filename?

No.

inventory.ini is just a filename that we chose.

We could also call it:

inventory
hosts
hosts.ini
my-servers.ini

Ansible doesn't require the filename to be exactly inventory.ini.

If we use a different filename, we tell Ansible which file to use:

ansible -i hosts.ini -m ping all

5. Our Inventory File

Our inventory.ini contains:

[app]
app1 ansible_host=EC2-1-PUBLIC-IP

[db]
db1 ansible_host=EC2-2-PUBLIC-IP

[all:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/path/to/YOUR-KEY.pem

Let's understand each part.

6. [app]

This creates a group called:

app

Then we add:

app1 ansible_host=EC2-1-PUBLIC-IP

So:

app
 ↓
app1
 ↓
EC2-1

app1 is the name we give the server inside Ansible.

7. What is ansible_host?

For example:

app1 ansible_host=13.201.50.100

Here:

app1
 ↓
Name used by Ansible

13.201.50.100
 ↓
Actual IP address of the EC2 server

So ansible_host tells Ansible:

"Connect to this IP address."

The name app1 doesn't have to be the actual hostname of the EC2 instance.

We choose the name ourselves.

8. Similarly,

Similarly:

[db]
db1 ansible_host=EC2-2-PUBLIC-IP

This creates a group called:

db

and puts:

db1

inside that group.

So our inventory now looks like:

Inventory
│
├── app
│   └── app1
│
└── db
    └── db1

9. Why Are Groups Useful?

Groups allow us to easily select specific servers.

For example:

ansible -i inventory.ini -m ping app

means:

Run the ping module only on the servers inside the app group.

Similarly:

ansible -i inventory.ini -m ping db

means:

Run it only on the database servers.

And:

ansible -i inventory.ini -m ping all

means:

Run it on all servers.

10. Real-World Example

Imagine a company has:

production
│
├── web
│   ├── web1
│   ├── web2
│   └── web3
│
├── app
│   ├── app1
│   └── app2
│
└── db
    ├── db1
    └── db2

We can tell Ansible:

ansible -i inventory.ini -m shell -a "df -h" db

This means:

Run df -h only on the database servers.

This is one of the main benefits of inventory groups.

11. What is [all:vars]?

We have:

[all:vars]

This means:

The variables below this section apply to all servers in the inventory.

For example:

[all:vars]
ansible_user=ubuntu

This tells Ansible:

Use the ubuntu user when connecting to these servers.

So we don't have to write:

app1 ansible_user=ubuntu
db1 ansible_user=ubuntu

separately.

12. ansible_user

We have:

ansible_user=ubuntu

This tells Ansible which Linux user to use for SSH.

For Ubuntu EC2 instances, the common SSH user is:

ubuntu

So Ansible will connect like:

Ansible
   ↓
SSH
   ↓
ubuntu@EC2

13. ansible_ssh_private_key_file

We have:

ansible_ssh_private_key_file=/path/to/YOUR-KEY.pem

This tells Ansible:

Use this private SSH key when connecting to the EC2 instances.

For example:

ansible_ssh_private_key_file=/home/bilal/aws/testing.pem

This is the .pem key that belongs to your AWS EC2 key pair.

Important: Don't upload the .pem private key to GitHub.

Add it to .gitignore if necessary.

14. Why Do We Need a Static Inventory?

Without an inventory, Ansible doesn't know which remote servers we want to manage.

The inventory provides:

Server name
    ↓
IP address
    ↓
SSH username
    ↓
SSH private key

So Ansible knows how to connect.

15. We can test both EC2 servers using:

ansible -i inventory.ini -m ping all

Let's break it down.

a) ansible

Run an Ansible ad-hoc command to connect.

b) -i inventory.ini

Tell Ansible:

Use this inventory file.

c) -m ping

Use the Ansible ping module.

d) all

Target all hosts in the inventory.

=> So the complete meaning is:

Read inventory.ini, find all the servers, and test whether Ansible can connect to them.

If everything is correct, we should get:

app1 | SUCCESS
db1  | SUCCESS

16. Target Only One Server

We can also target a specific host:

ansible -i inventory.ini -m ping app1

This means:

Test the connection only to app1.

17. Main Concept

The most important thing to remember is:

Static Inventory
       ↓
Manually define servers
       ↓
Group the servers
       ↓
Define connection details
       ↓
Ansible uses this information
       ↓
Connects to the servers
