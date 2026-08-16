Think of it like this:

Playbook → Play → Tasks → Modules

And Collections are packages that contain Ansible content such as modules, roles and plugins.

1. Playbook
A Playbook is a YAML file (.yml or .yaml) that contains instructions for Ansible.

For example, suppose you have two EC2 servers:

webservers
└── web1

databases
└── db1

You can create one playbook that:
a) Installs Nginx on the web server 
b) Starts Nginx 
c) Installs PostgreSQL on the database server 
d) Starts PostgreSQL

Example:

---
- name: Configure web server
  hosts: webservers

  tasks:
    - name: Install Nginx
      ansible.builtin.apt:
        name: nginx
        state: present

    - name: Start Nginx
      ansible.builtin.service:
        name: nginx
        state: started

- name: Configure database server
  hosts: databases

  tasks:
    - name: Install PostgreSQL
      ansible.builtin.apt:
        name: postgresql
        state: present

    - name: Start PostgreSQL
      ansible.builtin.service:
        name: postgresql
        state: started

The entire Yaml file is a playbook.

2. Play

A Play is one section inside a playbook.

In the above example, there are two plays:

Play 1
- name: Configure web server
  hosts: webservers

This play says:

"Run the following tasks on the machines belonging to webservers."

Play 2

- name: Configure database server
  hosts: databases

This says:

"Run the following tasks on the machines belonging to databases."

So:

Playbook
│
├── Play 1 → webservers
│ ├── Task
│ └── Task
│
└── Play 2 → databases
      ├── Task
      └── Task

In short, Play = Which servers + What work

3. Task

A Task is one specific action that Ansible should perform.

For example:

- name: Install Nginx
  ansible.builtin.apt:
    name: nginx
    state: present

This is one task.

Another task:

- name: Start Nginx
  ansible.builtin.service:
    name: nginx
    state: started

This is another task.

So:

Play
│
├── Task 1 → Install Nginx
│
└── Task 2 → Start Nginx

Ansible normally executes tasks in the order they are written.

4. Module

A Module is what actually performs the operation.

For example:
"ansible.builtin.apt:" is the APT module.

=> It can install, remove, or manage packages on Debian/Ubuntu systems.

Example:

- name: Install Nginx
  ansible.builtin.apt:
    name: nginx
    state: present

Here:

Task
│
├── name: Install Nginx
│
└── Module: ansible.builtin.apt
       │
       ├── name: nginx
       └── state: present


Another example:
-- name: Start Nginx
  ansible.builtin.service:
    name: nginx
    state: started

Here the module is:
ansible.builtin.service

=> It manages services.

5. Common modules you should know

As a beginner, you don't need to memorize hundreds of modules.

Start with these:

| Module     | Purpose                                     |
| ---------- | ------------------------------------------- |
| `apt`      | Install/manage packages on Ubuntu/Debian    |
| `dnf`      | Manage packages on newer RHEL-based systems |
| `yum`      | Manage packages on older RHEL-based systems |
| `service`  | Manage services                             |
| `systemd`  | Manage systemd services                     |
| `copy`     | Copy files to remote servers                |
| `file`     | Manage files/directories/permissions        |
| `user`     | Create/manage users                         |
| `command`  | Run commands                                |
| `shell`    | Run shell commands                          |
| `template` | Create configuration files using Jinja2     |

=> For example, creating a user

- name: Create DevOps user
  ansible.builtin.user:
    name: devops
    state: present

Here:

Task = Create DevOps user
Module = user

6. Collections

This part can initially be confusing.

A Collection is basically a package/bundle of Ansible content.

It can contain things such as:

Collection
│
├── Modules
├── Plugins
├── Roles
└── Other Ansible content

For example:

community.general.some_module:

Here:

community.general
        │
        └── Collection

The collection provides the module.

7. What does ansible.builtin mean?

You will often see:

ansible.builtin.apt

or:

ansible.builtin.service

ansible.builtin refers to Ansible's built-in collection.

So:

ansible.builtin.apt

means:

Use the apt module from Ansible's built-in collection.

Similarly:

ansible.builtin.copy

means:

Use the copy module from the built-in collection.

8. Complete example

Let's connect everything together.

Suppose your inventory is:

[webservers]
web1 ansible_host=10.0.1.10


[dbservers]
db1 ansible_host=10.0.1.20


[all:vars]
ansible_user=ubuntu

Now create:

site.yml

---
- name: Configure web server
  hosts: webservers

  tasks:

    - name: Install Nginx
      ansible.builtin.apt:
        name: nginx
        state: present

    - name: Start Nginx
      ansible.builtin.service:
        name: nginx
        state: started

- name: Configure database server
  hosts: dbservers

  tasks:

    - name: Install PostgreSQL
      ansible.builtin.apt:
        name: postgresql
        state: present

    - name: Start PostgreSQL
      ansible.builtin.service:
        name: postgresql
        state: started

Now understand the structure:

site.yml
   │
   │  PLAYBOOK
   │
   ├── Play 1
   │     │
   │     ├── hosts: webservers
   │     │
   │     ├── Task 1
   │     │      └── apt module
   │     │
   │     └── Task 2
   │            └── service module
   │
   └── Play 2
         │
         ├── hosts: dbservers
         │
         ├── Task 1
         │      └── apt module
         │
         └── Task 2
                └── service module

This is the main concept you should remember.

9. How Ansible executes it

When you run:

ansible-playbook -i inventory site.yml

Ansible roughly works like this:

Read Inventory
      ↓
Read Playbook
      ↓
Find the Play
      ↓
Find target hosts
      ↓
Execute Tasks
      ↓
Each Task uses a Module
      ↓
Module performs the action
      ↓
Move to next Task

For example:

Play: Configure web server
        ↓
webservers
        ↓
Task: Install Nginx
        ↓
apt module
        ↓
Nginx installed
        ↓
Task: Start Nginx
        ↓
service module
        ↓
Nginx started
le is a playbook
- name: Configure web server
  hosts: webservers
