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

=> Lab 4.2: Send Only Four Packets
ping -c 4 google.com

Here:

-c means count
4 means send four packets

This is useful when we want the command to finish automatically.

=> Lab 4.3: Ping the Localhost
ping -c 4 127.0.0.1

127.0.0.1 is the localhost address. It refers to the same computer on which the command is being executed.

This test checks whether the local network stack is working.

=> Lab 4.4: Ping a Public IP Address
ping -c 4 8.8.8.8

This checks connectivity to Google's public DNS server using an IP address.

It also helps us test internet connectivity without depending on DNS name resolution.

=> Lab 4.5: Find and Ping the Default Gateway

First, I checked the routing information:

ip route

Example output:

default via 192.168.1.1 dev ens33

Then, I pinged the gateway:

ping -c 4 192.168.1.1

The gateway address may be different on another system, so I used the address shown by ip route.

=> Lab 4.6: Practice Ping Options

Send one packet every two seconds:

ping -i 2 -c 5 google.com

Wait for a maximum of two seconds for each reply:

ping -W 2 -c 4 google.com

Note:- What I Learned from ping

How to check whether a host is reachable.
How to test localhost connectivity.
How to check connectivity to the default gateway.
How to test internet connectivity using an IP address.
How to identify packet loss and response time.
How to use the -c option to send a fixed number of packets.

5. netstat

=> Theory

The netstat command is used to display network-related information.

It can show:

Active network connections
Listening ports
TCP connections
UDP connections
Routing information
Network statistics
Processes using network ports

netstat is an older command, but it is still useful for learning Linux networking and troubleshooting.

=> Lab 5.1: Display All Connections
netstat -a

This displays all active and listening connections.

=> Lab 5.2: Display Listening Connections
netstat -l

This shows services that are waiting for incoming connections.

=> Lab 5.3: Display Listening TCP Ports
netstat -lt

Here:

-l means listening
-t means TCP

=> Lab 5.4: Display Listening UDP Ports
netstat -lu

Here:

-l means listening
-u means UDP

=> Lab 5.5: Display Listening Ports with Process Information
sudo netstat -tulpn

Here,
-p	Show process information
-n	Show numeric addresses and port numbers

Example output:

Proto  Local Address  Foreign Address  State   PID/Program name
tcp    0.0.0.0:22     0.0.0.0:*        LISTEN  1234/sshd

If SSH is running, the output may show port 22 in the listening state.

=> Lab 5.6: Check Whether SSH Is Listening
sudo netstat -tulpn | grep :22

This means that the SSH service is listening on port 22.

=> Lab 5.7: Display the Routing Table
netstat -r

This displays the system's routing table.

The modern alternative is:

ip route

=> Lab 5.8: Display Network Statistics
netstat -s

This displays statistics related to protocols such as TCP, UDP, and IP.

Note:- What I Learned from netstat

How to view active network connections.
How to identify listening ports.
How to check whether SSH is listening on port 22.
How to identify processes using network ports.
How to view the routing table.

How to display network protocol statistics.

6. traceroute

=> The traceroute command is used to display the network path taken by packets from the local system to a destination.

Each router between the source and destination is called a hop.

Traceroute helps us identify where a network delay or connectivity problem may be occurring.

=>  Lab 6.1: Trace the Route to Google
traceroute google.com

Example output:

1  192.168.1.1
2  10.20.0.1
3  172.16.0.1
4  ...
5  ...

The hop numbers represent the routers through which the packets are passing.

=> Lab 6.2: Trace the Route to an IP Address
traceroute 8.8.8.8

This traces the route to Google's public DNS server.

=> Lab 6.3: Use ICMP Packets
sudo traceroute -I google.com

The -I option uses ICMP packets.

This can be useful when the default traceroute method is blocked by a network or firewall.

=> Lab 6.4: Limit the Number of Hops
traceroute -m 10 google.com

The -m 10 option limits the maximum number of hops to 10.

=> Lab 6.5: Display Only IP Addresses
traceroute -n google.com

The -n option disables hostname resolution and displays numeric IP addresses.

Note:- What I Learned from traceroute

How to trace the path to a destination.
What a network hop means.
How to identify routers between two systems.
How to use ICMP packets with traceroute.
How to limit the maximum number of hops.
How to display numeric IP addresses.

7. ip addr

=> Theory

The ip addr command displays information about network interfaces and IP addresses.

It helps us check:

Network interface names
IPv4 addresses
IPv6 addresses
MAC addresses
Interface status

=> Lab 7.1: Display Network Interfaces
ip addr

A shorter version is:

ip a

=> Lab 7.2: Display a Specific Interface
ip addr show

This displays the IP configuration of all interfaces.

The output may contain interfaces such as:

lo — Loopback interface
ens33 — Ethernet interface
eth0 — Ethernet interface
wlan0 — Wireless interface

Note:- What I Learned from ip addr

How to identify network interfaces.
How to find the IP address of my Ubuntu system.
How to check whether an interface is up.
How to identify the loopback interface.

8. ip route

=> Theory

The ip route command displays the routing table.

The routing table tells Linux where to send network packets.

=> Lab 8.1: Display the Routing Table
ip route

Example output:

default via 192.168.1.1 dev ens33
192.168.1.0/24 dev ens33 proto kernel scope link src 192.168.1.10

Meaning:

default via = default gateway
dev = network interface
src = source IP address
/24 = network range

Note:- What I Learned from ip route

How to find the default gateway.
How Linux decides where to send packets.
How to identify the network interface used for routing.

9. tracepath

=> Theory

tracepath is another command used to trace the network path to a destination.

=> Lab 9.1: Trace the Route
tracepath google.com

=> Lab 9.2: Trace the Route to an IP Address
tracepath 8.8.8.8

10. Important Observations

During this lab, I learned that:

A successful ping does not always mean that a website is working.
Some servers block ICMP packets, so ping may fail even when the server is reachable.
netstat helps identify whether a service is listening on the expected port.
traceroute may show * * * when a router does not respond to traceroute packets.
The default gateway is important for communication outside the local network.
DNS converts domain names such as google.com into IP addresses.
ss is the modern alternative to netstat.
