1. What is a Loop?

A loop is used to execute the same block of code multiple times.

Instead of writing the same command repeatedly, we use a loop.

Example

Without loop

echo "Hello"
echo "Hello"
echo "Hello"
echo "Hello"
echo "Hello"

a) With loop

for i in {1..5}
do
    echo "Hello"
done

Output

Hello
Hello
Hello
Hello
Hello

2. Why do we use Loops?

Loops help us:

Save time
Reduce duplicate code
Automate repetitive tasks
Manage multiple files or users
Perform bulk operations

Real-life examples:

Create 50 users
Backup multiple directories
Check multiple servers
Rename many files
Monitor system resources repeatedly

3. Types of Loops

Bash provides three main loops:

for loop
while loop
until loop

It also provides:

break
continue

4. for Loop

The for loop is used when you know how many times the loop should run.

Syntax
for variable in list
do
    commands
done

Example 1 - Print Numbers
for i in 1 2 3 4 5
do
    echo $i
done

Output

1
2
3
4
5

Example 2 - Print Names
for NAME in Bilal Ahmed Rahul John
do
    echo $NAME
done

Output

Bilal
Ahmed
Rahul
John

Example 3 - Range
for i in {1..10}
do
    echo $i
done

Output

1
2
3
4
5
6
7
8
9
10

Example 4 - Step Value
for i in {2..20..2}
do
    echo $i
done

Output

2
4
6
8
10
12
14
16
18
20

Example 5 - C Style for Loop

Syntax

for (( initialization; condition; increment ))
do
    commands
done

Example

for ((i=1; i<=5; i++))
do
    echo $i
done

Output

1
2
3
4
5

a) Loop Through Files
for FILE in *.txt
do
    echo $FILE
done

If the directory contains:

data.txt
notes.txt
users.txt

Output

data.txt
notes.txt
users.txt

b) Loop Through Directories
for DIR in */
do
    echo $DIR
done

c) Practical Example - Create Multiple Directories
for i in {1..5}
do
    mkdir Project$i
done

Result

Project1
Project2
Project3
Project4
Project5

d) Practical Example - Create Users
for USER in user1 user2 user3
do
    echo "Creating $USER"
done

In production:

useradd $USER

5. while Loop

The while loop runs as long as the condition is true.

a) Syntax
while [ condition ]
do
    commands
done

b) Example 1
COUNT=1

while [ $COUNT -le 5 ]
do
    echo $COUNT
    ((COUNT++))
done

Output

1
2
3
4
5

c) Example 2 - Countdown
COUNT=5

while [ $COUNT -ge 1 ]
do
    echo $COUNT
    ((COUNT--))
done

Output

5
4
3
2
1

d) Example 3 - Read File Line by Line

Suppose users.txt contains

Bilal
Rahul
John

Script

while read USER
do
    echo $USER
done < users.txt

Output

Bilal
Rahul
John

6. until Loop

The until loop runs until the condition becomes true.

It is the opposite of a while loop.

a) Syntax

until [ condition ]
do
    commands
done

b)!Example
COUNT=1

until [ $COUNT -gt 5 ]
do
    echo $COUNT
    ((COUNT++))
done

Output

1
2
3
4
5

7. Difference Between while and until
while

Runs while the condition is true.

while [ $COUNT -le 5 ]
until

Runs until the condition becomes true.

until [ $COUNT -gt 5 ]

8. break Statement

break immediately exits the loop.

Example

for i in {1..10}
do
    if [ $i -eq 5 ]
    then
        break
    fi

    echo $i
done

Output

1
2
3
4

The loop stops when i becomes 5.

9. continue Statement

continue skips the current iteration and moves to the next one.

Example

for i in {1..5}
do
    if [ $i -eq 3 ]
    then
        continue
    fi

    echo $i
done

Output

1
2
4
5

The number 3 is skipped.

10. Nested Loops

A loop inside another loop.

Example

for i in {1..3}
do
    for j in {1..2}
    do
        echo "$i $j"
    done
done

Output

1 1
1 2
2 1
2 2
3 1
3 2

11. Real-Life Example 1 - Backup Multiple Directories
for DIR in /home /etc /var
do
    echo "Backing up $DIR"
done

In production, replace echo with a backup command such as tar.

Real-Life Example 2 - Check Multiple Services
for SERVICE in ssh cron nginx
do
    systemctl status $SERVICE
done

This checks the status of multiple services one after another.

Real-Life Example 3 - Ping Multiple Servers
for SERVER in 192.168.1.10 192.168.1.11 192.168.1.12
do
    ping -c 2 $SERVER
done

Useful for checking whether servers are reachable

Real-Life Example 4 - Check Disk Usage Every 5 Seconds
while true
do
    df -h
    sleep 5
done

Press Ctrl + C to stop the script.

12. sleep Command

sleep pauses the script for a specified time.

Example

echo "Starting"

sleep 3

echo "Finished"

The script waits 3 seconds before printing "Finished".

13. Infinite Loop

A loop that never ends unless stopped manually.

Example

while true
do
    echo "Monitoring Server..."
    sleep 10
done

Stop it using:

Ctrl + C

14. Mini Project - Health Check Multiple Servers
#!/bin/bash

SERVERS="server1 server2 server3"

for SERVER in $SERVERS
do
    echo "Checking $SERVER..."
    ping -c 2 $SERVER
    echo "----------------------"
done

This is a simple example of automating health checks across multiple servers.

Note:- Forgetting mistakes
1. Forgetting done

Wrong

for i in {1..5}
do
echo $i

Correct

for i in {1..5}
do
echo $i
done

2. Infinite Loop by Mistake

Wrong

COUNT=1

while [ $COUNT -le 5 ]
do
    echo $COUNT
done

The value of COUNT never changes.

Correct

((COUNT++))

inside the loop.

3. Missing Spaces

Wrong

while[$COUNT -le 5]

Correct

while [ $COUNT -le 5 ]
