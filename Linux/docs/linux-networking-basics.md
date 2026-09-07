Linux Networking Basics Lab

=> Overview

In this lab, I learned and practiced basic Linux networking commands in Ubuntu. These commands are useful for checking network connectivity, viewing network connections, checking listening ports, and understanding the path followed by network packets.

The commands practiced in this lab are:

ping
netstat
traceroute
ip addr
ip route
ss
tracepath

Linux provides several commands to perform these checks.

1. What is Network Troubleshooting?

Network troubleshooting means finding and fixing problems related to network connectivity.

For example, if a website is not opening, we can check:

Whether our system has a network connection.
Whether the default gateway is reachable.
Whether the internet is working.
Whether DNS is resolving domain names.
Whether any network service is listening on the required port.
Which network path packets are following.

2. Lab Environment

Item	                    Details
Operating System	        Ubuntu
Environment	              Ubuntu VM / WSL
Tools	                    Terminal
Main Topic	              Basic Linux Networking
Commands	                ping, netstat, traceroute, ip, ss

3. Installing Required Tools

a) First, I updated the package information:

sudo apt update

b) Then, I installed the required networking tools:

sudo apt install -y iputils-ping net-tools traceroute

=> I checked whether the commands were available:

ping -V
netstat --version
traceroute --version

4. Practice with ping

a) Theory

The ping command is used to check whether a destination is reachable over a network.

It sends ICMP packets to the destination and waits for a reply.

The output usually shows:

Packet sequence number
TTL value
Response time
Packet loss

=> Lab 4.1: Ping Google
ping google.com

This command continuously checks connectivity to Google.

To stop the command, press:

Ctrl + C
