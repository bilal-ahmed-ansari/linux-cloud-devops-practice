# Ansible Practical Labs

I am learning Ansible through hands-on practice using Ubuntu WSL and AWS EC2.

In this repository, I am documenting the labs I perform step by step.

## Labs

### 1. Passwordless SSH Authentication

Configured SSH key-based authentication between Ubuntu WSL and an AWS EC2 instance.

Topics:
- SSH key pair
- Public and private key
- ssh-copy-id
- Passwordless SSH

[View Lab](./01-passwordless-ssh/)

### 2. SSH Password Authentication

Configured password-based SSH authentication on another AWS EC2 instance.

Topics:
- Setting user password
- PasswordAuthentication
- SSH configuration
- Restarting SSH

[View Lab](./02-password-authentication/)

### 3. Ansible Static Inventory

Created a static Ansible inventory using INI format.

Topics:
- Inventory
- Hosts
- Groups
- app and db groups
- ansible_host
- ansible_user
- ansible-inventory
- Ansible ping
- Ad-hoc commands

[View Lab](./03-static-inventory/)

## Practice Environment

- Windows
- Ubuntu WSL
- AWS EC2
- Ansible
- SSH

I will continue adding more Ansible labs as I learn.
