1. Conditional Statements (if, if-else, elif, Nested if)

Conditional statements allow a script to make decisions. In simple words, if a condition is true, execute one set of commands. Otherwise, execute another set.

Example:

a)If disk usage is greater than 80%, show a warning.

b)If the user exists, display "User already exists.

c)If a service is running, do nothing. Otherwise, start it.

2. Why do we use Conditional Statements?

They help automate decision-making.

Real-life examples:

a)Check if a file exists before taking a backup.

b)Check if a service is running before restarting it.

c)Check whether a user exists before creating a new user.

d)Check if there is enough disk space before copying files.

3. Types of Conditional Statements

a)if

b)if-else

c)if-elif-else

d)Nested if

4. if Statement

Used when you want to execute commands only if a condition is true.

a)Syntax

if [ condition ]
then
    commands
fi

b)Explanation:

=>if starts the condition.

[ condition ] checks the condition.

=>then starts the commands.

=>fi ends the if block (fi is if written backwards).

c)Example 1: Check Numbers

A=10

B=5

if [ $A -gt $B ]

then

    echo "A is greater"
    
fi

Output: A is greater

Example 2: Check Current User

if [ "$USER" = "bilal" ]

then

    echo "Welcome Bilal"
    
fi

Example 3: Check File Exists

FILE="/etc/passwd"


if [ -f "$FILE" ]

then

    echo "File exists"
    
fi

Output: File exists

5. if-else Statement

Used when there are two possible outcomes.

a)Syntax:

if [ condition ]

then

    commands
    
else

    commands
    
fi

b)Example 1: Age Check

AGE=20

if [ $AGE -ge 18 ]

then

    echo "Eligible to vote"
    
else

    echo "Not eligible to vote"
    
fi

Output: Eligible to vote

Example 2: Check File

FILE="data.txt"

if [ -f "$FILE" ]

then

    echo "File found"
    
else

    echo "File not found"
    
fi

Example 3: Check Directory

DIR="/backup"

if [ -d "$DIR" ]

then

    echo "Directory exists"
    
else

    echo "Directory does not exist"
    
fi

6. if-elif-else Statement

Used when there are multiple conditions.

a)Syntax

if [ condition ]

then

    commands

elif [ condition ]

then

    commands

else

    commands
    
fi

b) Example: Student Grades

MARKS=75

if [ $MARKS -ge 90 ]

then

    echo "Grade A"

elif [ $MARKS -ge 75 ]

then

    echo "Grade B"

elif [ $MARKS -ge 60 ]

then

    echo "Grade C"

else

    echo "Fail"
    
fi

Output: Grade B

Example: Login Check

USERNAME="admin"

if [ "$USERNAME" = "root" ]

then

    echo "Root User"

elif [ "$USERNAME" = "admin" ]

then

    echo "Administrator"

else

    echo "Normal User"
    
fi

Output: Administrator

7. Nested if Statement

An if statement inside another if statement.

a)Syntax

if [ condition ]

then

    if [ condition ]
    
    then
    
        commands
        
    fi
    
fi

b) Example

AGE=25

COUNTRY="India"

if [ $AGE -ge 18 ]

then

    if [ "$COUNTRY" = "India" ]
    
    then
    
        echo "Eligible to vote in India"
        
    fi

fi

Output: Eligible to vote in India

8. Using Multiple Conditions => AND Operator (&&)

Both conditions must be true.

AGE=25
COUNTRY="India"

if [ $AGE -ge 18 ] && [ "$COUNTRY" = "India" ]

then

    echo "Eligible"
    
fi

Output: Eligible

9. Using Double Brackets [[ ]]

Bash supports [[ ]], which is more powerful than [ ].

Example:

NAME="Bilal"

if [[ "$NAME" == "Bilal" ]]

then

    echo "Hello Bilal"
    
fi

Benefits:

=>Better handling of strings.

=>Supports pattern matching.

=>Less chance of errors.

10. Practical Example

a) Check User Exists

USERNAME="bilal"

if id "$USERNAME" >/dev/null 2>&1

then

    echo "User exists"
    
else

    echo "User does not exist"
    
fi

Explanation:

=>id checks if the user exists.

=>>/dev/null hides normal output.

=>2>&1 hides error messages.

The 'if' checks the exit status of the id command.

b) Practical Example 2: Check SSH Service

if systemctl is-active --quiet ssh

then

    echo "SSH service is running"
    
else

    echo "SSH service is stopped"
    
fi

c) Practical Example 3: Check Disk Usage

USAGE=85

if [ $USAGE -ge 80 ]

then

    echo "Disk usage is high"
    
else

    echo "Disk usage is normal"
    
fi

Output: Disk usage is high

d) Practical Example 4: Check Backup Directory

BACKUP="/backup"

if [ -d "$BACKUP" ]

then

    echo "Backup directory found"
    
else

    mkdir "$BACKUP"
    
    echo "Backup directory created"
    
fi

Note:-
1. Missing Spaces

Wrong:

if [$A -gt 10]

Correct:

if [ $A -gt 10 ]

2. Wrong:

if [ $A -gt 10 ]

then

echo "Hello"

Correct:

if [ $A -gt 10 ]

then

echo "Hello"

fi

3. Using = for Numbers

Wrong:

[ $A = 10 ]

Correct:

[ $A -eq 10 ]

4. Not Quoting Strings

Wrong:

[ $NAME = Bilal ]

Correct:

[ "$NAME" = "Bilal" ]
