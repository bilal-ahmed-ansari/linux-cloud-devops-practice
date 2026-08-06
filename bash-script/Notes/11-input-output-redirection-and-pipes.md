1. What is Input/Output (I/O)?

Every Linux command uses one or more of these three streams:

| Stream          | Number | Purpose                 |
| --------------- | ------ | ----------------------- |
| Standard Input  | 0      | Takes input             |
| Standard Output | 1      | Displays normal output  |
| Standard Error  | 2      | Displays error messages |

Example

ls

Output

Documents
Downloads
Music
Pictures

The output is displayed on the terminal (stdout).

2. Why do we use Redirection?

Redirection allows us to:

Save command output into a file
Read input from a file
Save error messages separately
Ignore unwanted output
Create log files

3. Standard Output (>)

> redirects output to a file.

Syntax

command > file

Example

date > date.txt

Contents of date.txt

Thu Aug 6 12:30:15 IST 2026

If the file does not exist, Linux creates it.

If it exists, Linux overwrites it.

4. Append Output (>>)

>> adds output to the end of a file.

Example

date >> log.txt

Run it again

date >> log.txt

Contents

Thu Aug 6 12:30:15 IST 2026
Thu Aug 6 12:31:04 IST 2026

Nothing is overwritten.

Difference Between > and >>
| `>`                 | `>>`                  |
| ------------------- | --------------------- |
| Overwrites the file | Appends to the file   |
| Old data is removed | Old data is preserved |

5. Standard Input (<)

Reads input from a file.

Example

Suppose users.txt contains

Bilal
Rahul
John

Script

while read USER
do
    echo "$USER"
done < users.txt

Output

Bilal
Rahul
John

6. Standard Error (2>)

Redirects only error messages.

Example

ls abc 2> error.log

Nothing appears on the screen.

Contents of error.log

ls: cannot access 'abc': No such file or directory 

7. Append Error (2>>)
ls abc 2>> error.log

Errors are added to the file.

8. Redirect Both Output and Error

Syntax

command > output.txt 2> error.txt

Example

ls Documents abc > output.txt 2> error.txt

output.txt

file1
file2

error.txt

ls: cannot access 'abc'

9. Redirect Everything (&>)

Redirect both output and errors into one file.

Example

ls Documents abc &> result.log

Contents

file1
file2
ls: cannot access 'abc'

10. 2>&1

Redirect error to the same location as output.

Example

ls Documents abc > result.log 2>&1

Both normal output and errors are stored in result.log.

11. /dev/null

/dev/null is a special file.

Anything sent to it is discarded.

It is called the black hole of Linux.

Ignore Output

ls > /dev/null

Nothing is displayed.

12. Ignore Errors

ls abc 2> /dev/null

The error message is hidden.

13. Ignore Everything

ls abc > /dev/null 2>&1

No output and no error message.

14. Pipes (|)

A pipe sends the output of one command as the input to another command.

Syntax

command1 | command2

Example 1

ls | wc -l

Output

12

Explanation

ls lists files.
wc -l counts the lines.

Example 2

ps -ef | grep ssh

This shows processes related to SSH.

Example 3

cat /etc/passwd | grep root

Displays only lines containing root.

Example 4

df -h | grep "/dev"

Shows only mounted devices.

15. tee Command

tee displays output on the terminal and also saves it to a file.

Syntax

command | tee file

Example

date | tee date.txt

Output

Thu Aug 6 12:30:15 IST 2026

The same output is also saved in date.txt.

a) Append with tee

date | tee -a date.txt

-a means append.

16. xargs Command

xargs converts input into command-line arguments.

Example

Suppose users.txt contains

user1
user2
user3

Run

cat users.txt | xargs echo

Output

user1 user2 user3

Another Example

find . -name "*.log" | xargs rm

Deletes all .log files found by find.

Use this carefully, especially with rm.

17. Here Document (<<)

Allows multiple lines of input.

Example

cat << EOF
Hello
Welcome
Linux
EOF

Output

Hello
Welcome
Linux

18. Here String (<<<)

Passes a single string as input.

Example

wc -w <<< "Linux Administration"

Output

2

19. Practical Example 1 - Save Disk Usage
df -h > disk_report.txt

This saves the disk usage report to a file.

Practical Example 2 - Save Running Processes
ps -ef > process_list.txt

Practical Example 3 - Find Failed Login Attempts
grep "Failed" /var/log/auth.log > failed_login.txt

The matching lines are stored in a separate file.

Practical Example 4 - Monitor Memory
free -h | tee memory.log

Shows memory usage and saves it at the same time.

Practical Example 5 - Check SSH Service
systemctl status ssh 2> error.log

If an error occurs, it is stored in error.log.

20. Using > Instead of >>

Wrong

echo "Second Entry" > log.txt

The previous contents are removed.

Correct

echo "Second Entry" >> log.txt

21. Forgetting Stream Numbers

Wrong

ls abc > error.log

This redirects only standard output.

Correct

ls abc 2> error.log

22. Accidentally Hiding Errors
2> /dev/null

Useful, but avoid it while troubleshooting because you may miss important error messages.

23. Mini Project - Server Health Report

#!/bin/bash

REPORT="health_report.txt"

echo "===== Server Health Report =====" > "$REPORT"

echo "" >> "$REPORT"

echo "Hostname:" >> "$REPORT"
hostname >> "$REPORT"

echo "" >> "$REPORT"

echo "Uptime:" >> "$REPORT"
uptime >> "$REPORT"

echo "" >> "$REPORT"

echo "Memory:" >> "$REPORT"
free -h >> "$REPORT"

echo "" >> "$REPORT"

echo "Disk Usage:" >> "$REPORT"
df -h >> "$REPORT"

echo "Health report generated successfully."

cat "$REPORT"

Output:
Health report generated successfully.

===== Server Health Report =====

Hostname:
server01

Uptime:
12:45:18 up 10 days...

Memory:
...

Disk Usage:
...
