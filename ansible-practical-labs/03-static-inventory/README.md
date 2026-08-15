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

Step 1: Create Inventory File

Create the inventory file:

Add:

[app]
app1 ansible_host=EC2-1-PUBLIC-IP

[db]
db1 ansible_host=EC2-2-PUBLIC-IP

[all:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/path/to/YOUR-KEY.pem

Replace the EC2 IP addresses and key path with your own values.

=> What does this mean?
a)[app]

This creates an app group.

b)[app]
app1 ansible_host=EC2-1-PUBLIC-IP

app1 is the name given to the server.

c)ansible_host is the actual IP address of the server.

d)[db]

This creates a db group.

[db]
db1 ansible_host=EC2-2-PUBLIC-IP

e)[all:vars]

These variables apply to all hosts.

[all:vars]
ansible_user=ubuntu

The SSH private key can also be specified:

ansible_ssh_private_key_file=/path/to/key.pem

Step 2 - Check Inventory

Run:

ansible-inventory -i inventory.ini --list

This shows how Ansible understands the inventory.

Step 3 - Test All Hosts

Run:

ansible -i inventory.ini -m ping all

Result:

app1 | SUCCESS
"ping": "pong"

db1 | SUCCESS
"ping": "pong"

Step 4 - Test Only App Servers
ansible -i inventory.ini -m ping app

Only the hosts in the app group are contacted.

Step 5 - Test Only DB Servers
ansible -i inventory.ini -m ping db

Only the hosts in the db group are contacted.

Step 6 - Run an Ad-hoc Command

Check hostname:
ansible -i inventory.ini -m shell -a "hostname" all

Check disk usage:
ansible -i inventory.ini -m shell -a "df -h" all

Check uptime:
ansible -i inventory.ini -m shell -a "uptime" all

=> What I Learned
Ansible inventory defines the managed hosts.
Hosts can be grouped according to their role.
ansible_host specifies the IP address.
ansible_user specifies the remote user.
Groups allow commands to be executed on selected servers.
ansible-inventory can be used to verify the inventory.
ansible -m ping can be used to test connectivity.
Ad-hoc commands can be used to perform quick tasks.

nano inventory.ini

Add:
