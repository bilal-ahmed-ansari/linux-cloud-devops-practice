1. What are Command Line Arguments?

Command line arguments are values passed to a script when it is executed.

Instead of hardcoding values inside the script, you can pass them while running it.

2. Example

Script:

#!/bin/bash

echo "Hello $1"

Run:

bash hello.sh Bilal

Output

Hello Bilal

Here,

hello.sh is the script.
Bilal is the command line argument.

3. Syntax
bash script.sh arg1 arg2 arg3

Example

bash user.sh bilal linux admin

| Argument | Variable |
| -------- | -------- |
| bilal    | `$1`     |
| linux    | `$2`     |
| admin    | `$3`     |

4. Special Variables

Shell provides several built-in special variables.

| Variable | Description                        |
| -------- | ---------------------------------- |
| `$0`     | Script name                        |
| `$1`     | First argument                     |
| `$2`     | Second argument                    |
| `$3`     | Third argument                     |
| `$#`     | Number of arguments                |
| `$@`     | All arguments (separately)         |
| `$*`     | All arguments (as one string)      |
| `$$`     | Current script Process ID (PID)    |
| `$?`     | Exit status of the last command    |
| `$!`     | PID of the last background process |

5. $0 - Script Name

Example

#!/bin/bash

echo "Script Name: $0"

Run

bash demo.sh

Output

Script Name: demo.sh

6. $# - Number of Arguments

Example

#!/bin/bash

echo "Total Arguments: $#"

Run

bash demo.sh Linux Ubuntu Bash

Output

Total Arguments: 3

7. $@ - All Arguments

Prints all arguments individually.

Example

#!/bin/bash

echo "$@"

Run

bash demo.sh Linux Ubuntu Bash

Output

Linux Ubuntu Bash

8. Loop Through All Arguments
#!/bin/bash

for ARG in "$@"
do
    echo "$ARG"
done

Output

Linux
Ubuntu
Bash

Each argument is treated separately.

9. $* - All Arguments

Example

#!/bin/bash

echo "$*"

Output

Linux Ubuntu Bash

10. Difference Between $@ and $*

a) Suppose you run:

bash demo.sh "Linux Admin" Ubuntu

Using "$@"

for ARG in "$@"
do
    echo "$ARG"
done

Output

Linux Admin
Ubuntu

b) Using "$@"

for ARG in "$@"
do
    echo "$ARG"
done

Output

Linux Admin
Ubuntu

Using "$*"

echo "$*"

Output
Linux Admin Ubuntu
Interview Tip
"$@" keeps each argument separate.
"$*" combines all arguments into one string.

For most scripts, "$@" is preferred.

11. $$ - Process ID (PID)

Every running process has a unique Process ID.

Example

#!/bin/bash

echo "PID = $$"

Output

PID = 4521

This value changes every time the script runs.

12. $? - Exit Status

Shows whether the previous command succeeded or failed.

Example

ls
echo $?

Output

0

Meaning:

0 = Success

Now try an invalid command:

abc
echo $?

Output

127
Meaning:

Command not found.

13. $! - Background Process ID

Used after running a command in the background.

Example

sleep 60 &

Then

echo $!

Output

5421

This is the PID of the background process.

14. Practical Example 1 - Greeting User
#!/bin/bash

echo "Welcome $1"

Run

bash greet.sh Bilal

Output

Welcome Bilal

Practical Example 2 - Add Two Numbers
#!/bin/bash

echo $(($1+$2))

Run

bash add.sh 10 20

Output

30
Practical Example 3 - Create User
#!/bin/bash

echo "Creating User: $1"

Production command

useradd "$1"

Run

bash create_user.sh bilal

Practical Example 4 - Backup Directory
#!/bin/bash

tar -czf backup.tar.gz "$1"

Run

bash backup.sh /home

The script creates a backup of the /home directory.

Practical Example 5 - Multiple Directories
#!/bin/bash

for DIR in "$@"
do
    echo "Backing up $DIR"
done

Run

bash backup.sh /home /etc /var

Output

Backing up /home
Backing up /etc
Backing up /var

15. Shift Command

shift removes the first argument and shifts the remaining arguments one position to the left.

Example

#!/bin/bash

echo "$1"

shift

echo "$1"

Run

bash demo.sh Linux Ubuntu Bash

Output

Linux
Ubuntu

After shift:

Before	After
$1 = Linux	$1 = Ubuntu
$2 = Ubuntu	$2 = Bash

16. Validate Number of Arguments

Example

#!/bin/bash

if [ $# -ne 2 ]
then
    echo "Usage: $0 <num1> <num2>"
    exit 1
fi

echo $(($1+$2))

Run

bash add.sh 10

Output

Usage: add.sh <num1> <num2>

17. Mini Project - Backup Script
#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Usage: $0 <directory1> <directory2> ..."
    exit 1
fi

for DIR in "$@"
do
    echo "Creating backup of $DIR"
    tar -czf "$(basename "$DIR").tar.gz" "$DIR"
done

echo "Backup completed."

Example

Run

bash backup.sh /home /etc

Output

Creating backup of /home
Creating backup of /etc
Backup completed.

Note:-
1. Common Mistakes
Forgetting Quotes

Wrong

echo $1

Better

echo "$1"

2. Using Arguments Without Validation

Wrong

echo $(($1+$2))

If arguments are missing, the result may be incorrect.

Better

if [ $# -ne 2 ]

Validate the input first.
