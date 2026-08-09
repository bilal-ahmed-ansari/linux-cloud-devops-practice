1. What is a Function?

A function is a block of code that performs a specific task.

Instead of writing the same code multiple times, you write it once inside a function and call it whenever needed.

2. Why do we use Functions?

Functions help us:

Reduce duplicate code
Make scripts easy to read
Reuse code
Make troubleshooting easier
Organize large scripts

3. Without Function
echo "Server Health Check"
uptime
free -h
df -h

echo "Server Health Check"
uptime
free -h
df -h

The same code is repeated.

4. With Function
health_check() {

    echo "Server Health Check"

    uptime

    free -h

    df -h
}

health_check

health_check

Output

Server Health Check
<system information>

Server Health Check
<system information>

5. Function Syntax
Method 1 (Recommended)
function_name() {

    commands

}

Example

hello() {

    echo "Hello Linux"

}

hello

Method 2
function hello {

    echo "Hello Linux"

}

hello

Both methods work, but the first one is more commonly used.

6. Calling a Function

A function executes only when it is called.

Example

hello() {

    echo "Welcome"

}

hello

Output

Welcome

7. Calling a Function Multiple Times
hello() {

    echo "Linux"

}

hello
hello
hello

Output

Linux
Linux
Linux

8. Function with Parameters

Functions can accept input values.

Example

greet() {

    echo "Welcome $1"

}

greet Bilal

Output

Welcome Bilal

$1 represents the first argument.

a) Another Example

add() {

    echo $(($1+$2))

}

add 10 20

Output

30

9. Positional Parameters Inside Functions

| Variable | Meaning             |
| -------- | ------------------- |
| `$1`     | First argument      |
| `$2`     | Second argument     |
| `$3`     | Third argument      |
| `$#`     | Number of arguments |
| `$@`     | All arguments       |
| `$*`     | All arguments       |

a) Example

show() {

    echo "First : $1"

    echo "Second : $2"

    echo "Arguments : $#"

}

show Linux Bash

Output

First : Linux
Second : Bash
Arguments : 2

10. Returning a Value

A function can return an exit status using return.

Example

check() {

    return 0

}

check

echo $?

Output

0

return only returns numbers between 0 and 255.

11. Returning Data

Usually, functions display data using echo.

Example

square() {

    echo $(($1*$1))

}

RESULT=$(square 5)

echo $RESULT

Output

25

12. Local Variables

A local variable exists only inside the function.

Example

demo() {

    local NAME="Bilal"

    echo $NAME

}

demo

echo $NAME

Output

Bilal

The second echo prints nothing because NAME is local.

13. Global Variables

A global variable can be used anywhere in the script.

Example

NAME="Bilal"

demo() {

    echo $NAME

}

demo

echo $NAME

Output

Bilal

Bilal

14. Function Calling Another Function

Example

hello() {

    echo "Hello"

}

welcome() {

    hello

    echo "Welcome"

}

welcome

Output

Hello

Welcome

15. Check User Exists

check_user() {

    
    if id "$1" >/dev/null 2>&1
    
    then
       
        echo "User exists"
   
    else
       
        echo "User not found"
    
    fi

}

check_user bilal

16. Check Service Status

check_service() {

    systemctl is-active --quiet "$1"

    if [ $? -eq 0 ]
    
    then
       
        echo "$1 is running"
   
    else
       
        echo "$1 is stopped"
    fi

}

check_service ssh

17. Backup Function

backup() {

    tar -czf backup.tar.gz "$1"

    echo "Backup completed"

}

backup /home

18. Health Check Function

health_check() {

    echo "Hostname"

    hostname

    echo

    echo "Memory"

    free -h

    echo

    echo "Disk"

    df -h

}

health_check

19. Source a Script

Sometimes one script uses functions from another script.

Example

functions.sh

hello() {

    echo "Hello"

}

main.sh

source functions.sh

hello

20. Mini Project - Server Health Check

#!/bin/bash

disk_usage() {

    echo "========== Disk Usage =========="

    df -h

}

memory_usage() {

    echo "========== Memory Usage =========="

    free -h

}

system_uptime() {

    echo "========== Uptime =========="

    uptime

}

disk_usage

memory_usage

system_uptime

Note:-
Common Mistakes
1. Calling Before Defining

Wrong

hello

hello() {

echo "Hi"

}

Correct

hello() {

echo "Hi"

}

hello

2. Forgetting Parentheses

Wrong

hello {

echo "Hi"

}

Correct

hello() {

echo "Hi"

}

3. Forgetting to Call the Function

Wrong

hello() {

echo "Hi"

}

Nothing happens because the function is never called.

Correct

hello() {

echo "Hi"

}

hello
