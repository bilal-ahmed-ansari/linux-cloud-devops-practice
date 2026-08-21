## Objective

Create a static Ansible inventory and manage two AWS EC2 instances from Ubuntu WSL.

## Lab Setup

Ubuntu WSL
Ansible Control Node
       |
       |
   ┌───┴────┐
   |        |
   ↓        ↓
 EC2-1    EC2-2
  app      db

1. Your filename: inventory.ini

Your folder looks like:

03-static-inventory/
├── README.md
└── inventory.ini

The important thing is:

inventory.ini
     ↑
This is the inventory file

inventory.ini is just a filename you chose.

You could also call it:

inventory
hosts
hosts.ini
my-servers.ini

Ansible doesn't require the filename to be exactly inventory.ini.

2. Your inventory.ini explained

You have:

[app]
app1 ansible_host=EC2-1-PUBLIC-IP

[db]
db1 ansible_host=EC2-2-PUBLIC-IP

[all:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/path/to/YOUR-KEY.pem

=> Let's break this down.

a) [app]

This creates a group called:

app

Then:

b) app1 ansible_host=EC2-1-PUBLIC-IP

means:

app1
 ↓
Name we give the server inside Ansible

ansible_host
 ↓
Actual IP address Ansible should connect to

c) [db]

Same concept:

d) [all:vars]

This part is important:

[all:vars]

It means:

These variables apply to all servers in the inventory.

e) You have:

ansible_user=ubuntu

Therefore Ansible will SSH as:

ubuntu

for both:

app1
db1

f) And:

ansible_ssh_private_key_file=/path/to/YOUR-KEY.pem

tells Ansible:

Use this SSH private key when connecting to the servers.

So instead of writing these settings separately for every server, you define them once.

3. Why ansible_host is needed?

This is something beginners often confuse.

Suppose you write:

[app]
app1 ansible_host=13.201.50.100

app1 is not necessarily the actual hostname of the EC2 machine.

It's simply the name you want to use inside Ansible.

So you can run:

ansible app1 -i inventory.ini -m ping

4. Why groups are useful

You have:

[app]
app1 ...


[db]
db1 ...

Now you can target everything:

ansible -i inventory.ini -m ping all

Or only application servers:

ansible -i inventory.ini -m ping app

Imagine a real environment:

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

You can tell Ansible:

Run this only on the database servers.

ansible -i inventory.ini -m shell -a "df -h" db

5. What does ansible-inventory do?

You run:

ansible-inventory -i inventory.ini --list

This doesn't connect to your servers.

It basically asks Ansible:

"Show me how you understand my inventory."

It will display information about:

app group
db group
hosts
variables
all

It's a good command to check whether your inventory is written correctly.

6. What does ansible -i inventory.ini -m ping all do?

Break it down:

a) ansible

Run an Ansible ad-hoc command.

b);-i inventory.ini

Use this inventory file.

c) -m ping

Use the Ansible ping module.

d) all

Target all hosts in the inventory.

So the complete meaning is:

Read inventory.ini, find all the servers, and test whether Ansible can connect to them.

