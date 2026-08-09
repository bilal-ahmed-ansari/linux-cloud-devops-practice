1. What is a Case Statement?

A case statement is used when you need to compare one variable against multiple values.

Instead of writing many if-elif-else conditions, you can use case to make the script shorter and easier to read

2. Why do we use a Case Statement?

Suppose a user enters:

=>start

=>stop

=>restart

=>status

Instead of checking each value using multiple if-elif-else statements, we use a case statement.

It is commonly used in:

a)Menu-driven programs

b)Service management

c)User input validation

d)Backup scripts

e)Automation scripts

3. Syntax
4. 
case VARIABLE in

pattern1)

    commands
    
    ;;

pattern2)

    commands
    
    ;;

pattern3)

    commands
    
    ;;

*)

    default commands
    
    ;;

esac

4. Explanation
   
=>case starts the case statement.

=>VARIABLE is the value to check.

=>pattern ) is the value to match.

=>;; ends a block.

=>*) is the default case (similar to else).

=>esac ends the case statement (case written backwards).

6. Example 1 - Simple Case Statement
7. 
DAY="Monday"

case $DAY in

Monday)

    echo "Today is Monday"
    
    ;;

Tuesday)

    echo "Today is Tuesday"
    
    ;;

Wednesday)

    echo "Today is Wednesday"
    
    ;;

*)

    echo "Invalid Day"
    
    ;;

esac

Output: Today is Monday

Example 2 - User Input

read -p "Enter your choice (yes/no): " CHOICE

case $CHOICE in

yes)

    echo "You selected Yes"
    
    ;;

no)

    echo "You selected No"
    
    ;;

*)

    echo "Invalid Choice"
    
    ;;

esac

Output:

Enter your choice (yes/no): yes

You selected Yes

7. Example 3 - Calculator

read -p "Enter first number: " A

read -p "Enter second number: " B

read -p "Choose (+ - * /): " OP

case $OP in

+)

    echo "Answer = $((A+B))"
    
    ;;

-)

    echo "Answer = $((A-B))"
    
    ;;

\*)

    echo "Answer = $((A*B))"
    
    ;;

/)

    echo "Answer = $((A/B))"
    
    ;;

*)

    echo "Invalid Operator"
    
    ;;

esac

Example Output:

Enter first number: 20

Enter second number: 5

Choose (+ - * /): *

Answer = 100

Note: * is written as \* because * is a wildcard character in Bash.

8. Example 4 - Menu Program

echo "===== MENU ====="

echo "1. Show Date"

echo "2. Show Current User"

echo "3. Show Current Directory"

echo "4. Exit"

read -p "Enter Choice: " CHOICE

case $CHOICE in

1)

    date
    
    ;;
    
2)

    whoami
  
    ;;

3)
    pwd
    ;;

4)

    echo "Goodbye"
  
    ;;

*)
   
    echo "Invalid Choice"
    
    ;;

esac

Output:

===== MENU =====

1. Show Date

2. Show Current User
 
3. Show Current Directory

4. Exit

Enter Choice: 2

bilal

9. Multiple Patterns

One block can handle multiple values.

read -p "Enter character: " CHAR

case $CHAR in

a|e|i|o|u)

    echo "Vowel"
    
    ;;

*)

    echo "Consonant"
    
    ;;

esac

Output:

Enter character: a

Vowel

10. Wildcards in Case Statement

Wildcards make pattern matching easier.

* (Any Value)
  
case $NAME in

*)

echo "Welcome"

;;

esac

Matches every value.

11. ? (Single Character)
12. 
read -p "Enter one character: " CHAR

case $CHAR in

?)

echo "Single Character"

;;

*)

echo "More than one character"

;;

esac

Output:

Enter one character: A

Single Character

12. [ ] (Character Range)
    
read -p "Enter a letter: " LETTER

case $LETTER in

[A-Z])

echo "Uppercase Letter"

;;

[a-z])

echo "Lowercase Letter"

;;

*)

echo "Invalid Input"

;;

esac

13. [0-9] (Digit)
    
read -p "Enter a character: " VALUE

case $VALUE in

[0-9])

echo "Digit"

;;

*)

echo "Not a Digit"

;;

esac

14. Real-Life Example 1 - Service Management

read -p "Enter action (start/stop/restart/status): " ACTION

case $ACTION in

start)

echo "Starting SSH Service..."

;;

stop)

echo "Stopping SSH Service..."

;;

restart)

echo "Restarting SSH Service..."

;;

status)

systemctl status ssh

;;

*)

echo "Invalid Action"

;;

esac

In a real environment, you can replace the echo commands with:

systemctl start ssh

systemctl stop ssh

systemctl restart ssh

15. Real-Life Example 2 - Backup Menu

echo "Backup Menu"

echo "1. Create Backup"

echo "2. Restore Backup"

echo "3. Delete Backup"

read -p "Choose option: " OPTION

case $OPTION in

1)

echo "Creating Backup..."

;;

2)
echo "Restoring Backup..."

;;

3)

echo "Deleting Backup..."

;;

*)

echo "Invalid Option"

;;

esac

Note:-

1. Common Mistakes

a)Wrong:

echo "Hello"

Correct:

1)

echo "Hello"

;;

b)Forgetting esac

Every case statement must end with:

esac

c)Missing Default Case

Always include:

*)

echo "Invalid Choice"

;;

This handles unexpected input.
