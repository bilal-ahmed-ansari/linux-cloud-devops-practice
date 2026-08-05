1. What is an Array?

An array is a variable that can store multiple values.

A normal variable stores only one value.

Example of a normal variable:

NAME="Bilal"

Here, NAME stores only one value.

An array can store many values.

FRUITS=("Apple" "Mango" "Orange")

Now one variable stores three values.

2. Why do we use Arrays?

Arrays are useful when working with:

Multiple users
Multiple files
Multiple servers
Multiple directories
Multiple services

Instead of creating many variables:

USER1="bilal"
USER2="rahul"
USER3="john"

Use one array:

USERS=("bilal" "rahul" "john")

This is cleaner and easier to manage.

3. Array Syntax
ARRAY_NAME=(value1 value2 value3)

Example

COLORS=("Red" "Green" "Blue")

4. Display All Elements

Use [@] to print all elements.

COLORS=("Red" "Green" "Blue")

echo "${COLORS[@]}"

Output

Red Green Blue

5. Access Individual Elements

Array indexing starts from 0.

COLORS=("Red" "Green" "Blue")

| Index | Value |
| ----- | ----- |
| 0     | Red   |
| 1     | Green |
| 2     | Blue  |

a) Print first element

echo "${COLORS[0]}"

Output

Red

b) Print second element

echo "${COLORS[1]}"

Output

Green

6. Add New Element
COLORS=("Red" "Green")

COLORS+=("Blue")

echo "${COLORS[@]}"

Output

Red Green Blue

7. Update an Element
COLORS=("Red" "Green" "Blue")

COLORS[1]="Yellow"

echo "${COLORS[@]}"

Output

Red Yellow Blue

8. Delete an Element
COLORS=("Red" "Green" "Blue")

unset COLORS[1]

echo "${COLORS[@]}"

Output

Red Blue

The element at index 1 is removed.

9. Delete Entire Array
unset COLORS

10. Number of Elements

Use #.

COLORS=("Red" "Green" "Blue")

echo "${#COLORS[@]}"

Output

3

11. Length of an Element
NAME="Linux"

echo "${#NAME}"

Output

5

12. Loop Through an Array
COLORS=("Red" "Green" "Blue")

for COLOR in "${COLORS[@]}"
do
    echo "$COLOR"
done

Output

Red
Green
Blue

13. Loop Using Index
COLORS=("Red" "Green" "Blue")

for ((i=0; i<${#COLORS[@]}; i++))
do
    echo "${COLORS[$i]}"
done

Output

Red
Green
Blue

14. Array with User Input
read -a NUMBERS

echo "${NUMBERS[@]}"

Example

Input

10 20 30 40

Output

10 20 30 40

-a tells read to store the input as an array.

15. Print All Indexes
FRUITS=("Apple" "Mango" "Orange")

echo "${!FRUITS[@]}"

Output

0 1 2

16. Slice an Array

Print specific elements.

FRUITS=("Apple" "Mango" "Orange" "Banana")

echo "${FRUITS[@]:1:2}"

Output

Mango Orange

Explanation

Start at index 1
Print 2 elements

17. Associative Arrays

Associative arrays use keys instead of index numbers.

Supported in Bash 4 and later.

Declare an associative array

declare -A EMPLOYEE

Assign values

EMPLOYEE[Name]="Bilal"

EMPLOYEE[City]="Mumbai"

EMPLOYEE[Company]="DNEG"

Access values

echo "${EMPLOYEE[Name]}"

Output

Bilal

a) Print all keys

echo "${!EMPLOYEE[@]}"

Example Output

Name City Company

b) Print all values

echo "${EMPLOYEE[@]}"

Example Output

Bilal Mumbai DNEG

18. Practical Example 1 - Create Multiple Users
USERS=("user1" "user2" "user3")

for USER in "${USERS[@]}"
do
    echo "Creating $USER"
done

In production, replace echo with:

useradd "$USER"

Practical Example 2 - Restart Services
SERVICES=("ssh" "cron" "nginx")

for SERVICE in "${SERVICES[@]}"
do
    echo "Restarting $SERVICE"

    systemctl restart "$SERVICE"
done

Practical Example 3 - Backup Directories
DIRECTORIES=("/home" "/etc" "/var")

for DIR in "${DIRECTORIES[@]}"
do
    echo "Backing up $DIR"
done

Practical Example 4 - Ping Multiple Servers
SERVERS=("192.168.1.10" "192.168.1.11" "192.168.1.12")

for SERVER in "${SERVERS[@]}"
do
    ping -c 2 "$SERVER"
done

19. Mini Project - Server Health Check
#!/bin/bash

SERVERS=("server1" "server2" "server3")

for SERVER in "${SERVERS[@]}"
do
    echo "Checking $SERVER"

    ping -c 2 "$SERVER"

    echo "--------------------------"
done

This script checks multiple servers one by one. If you add or remove servers, you only need to update the array.

Note:-
1. Forgetting Quotes

Wrong

echo ${FRUITS[@]}

Better

echo "${FRUITS[@]}"

Quoting helps when array elements contain spaces.

2. Using Index 1 as First Element

Wrong

echo "${FRUITS[1]}"

if you expect the first element.

Remember:

0 = First
1 = Second
2 = Third

3. Forgetting declare -A

Wrong

EMPLOYEE[Name]="Bilal"

Correct

declare -A EMPLOYEE
