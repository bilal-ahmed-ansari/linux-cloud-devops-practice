1. What is a String?

A string is a sequence of characters.

A string can contain:

Letters
Numbers
Special characters
Spaces

Examples

NAME="Bilal"

CITY="Mumbai"

MESSAGE="Linux Administration"

PASSWORD="Admin@123"

All of the above are strings.

2. Create a String
NAME="Bilal"

echo "$NAME"

Output

Bilal

3. String Length

Use # to find the number of characters.

NAME="Linux"

echo ${#NAME}

Output
5

4. Concatenate Strings

Concatenation means joining two or more strings.

FIRST="Bilal"

LAST="Ansari"

FULL="$FIRST $LAST"

echo "$FULL"

Output

Bilal Ansari

5. Compare Strings

Use = or ==.

NAME="Bilal"

if [ "$NAME" = "Bilal" ]
then
    echo "Matched"
fi

Output

Matched

6. Check Strings are Not Equal
NAME="Bilal"

if [ "$NAME" != "Ahmed" ]
then
    echo "Not Matched"
fi

Output

Not Matched

7. Check Empty String
NAME=""

if [ -z "$NAME" ]
then
    echo "String is Empty"
fi

Output

String is Empty

-z checks whether the string length is zero.

8. Check Non-Empty String
NAME="Linux"

if [ -n "$NAME" ]
then
    echo "String is Not Empty"
fi

Output

String is Not Empty

9. Convert to Uppercase
NAME="linux"

echo "${NAME^^}"

Output

LINUX

10. Convert to Lowercase
NAME="LINUX"

echo "${NAME,,}"

Output

linux

11. Capitalize First Letter
NAME="linux"

echo "${NAME^}"

Output

Linux

12. Extract Substring

Syntax

${STRING:START:LENGTH}

Example

NAME="LinuxAdministration"

echo "${NAME:0:5}"

Output

Linux

a) Another Example

NAME="BilalAhmed"

echo "${NAME:5:5}"

Output

Ahmed

13. Remove Characters from Beginning
FILE="/home/bilal/file.txt"

echo "${FILE#/home/}"

Output

bilal/file.txt

14. Remove Longest Match from Beginning
FILE="/home/bilal/docs/file.txt"

echo "${FILE##*/}"

Output

file.txt

Explanation

Everything before the last / is removed.

15. Remove Characters from End
FILE="backup.tar.gz"

echo "${FILE%.gz}"

Output

backup.tar

16. Remove Longest Match from End
FILE="backup.tar.gz"

echo "${FILE%%.*}"

Output

backup

17. Replace First Match
TEXT="Linux Server"

echo "${TEXT/Linux/Ubuntu}"

Output

Ubuntu Server

18. Replace All Matches
TEXT="Linux Linux Linux"

echo "${TEXT//Linux/Ubuntu}"

Output

Ubuntu Ubuntu Ubuntu

19. Check String Starts With
NAME="LinuxServer"

if [[ $NAME == Linux* ]]
then
    echo "Starts with Linux"
fi

Output

Starts with Linux

20. Check String Ends With
FILE="backup.tar.gz"

if [[ $FILE == *.gz ]]
then
    echo "Compressed File"
fi

Output

Compressed File

21. Search Inside String
TEXT="Linux Administration"

if [[ "$TEXT" == *Admin* ]]
then
    echo "Found"
fi

Output

Found

22. Join Strings
FIRST="Linux"

SECOND="Server"

echo "$FIRST $SECOND"

Output

Linux Server

23. Reverse a String

Using the rev command.

echo "Linux" | rev

Output

xuniL

24. Read String from User
read -p "Enter your name: " NAME

echo "Welcome $NAME"

Example Output

Enter your name: Bilal

Welcome Bilal

25. Pattern Matching
FILE="backup.tar.gz"

case $FILE in

*.gz)

echo "Compressed File"

;;

*.txt)

echo "Text File"

;;

*)

echo "Unknown"

;;

esac

26. Regular Expression Example
EMAIL="admin@gmail.com"

if [[ "$EMAIL" =~ @gmail\.com$ ]]
then
    echo "Valid Gmail Address"
fi

Output

Valid Gmail Address

27. Practical Example 1 - Check Log File
FILE="/var/log/messages"

if [[ "$FILE" == *.log || "$FILE" == */messages ]]
then
    echo "Log File Found"
fi

28. Practical Example 2 - Rename Backup Files
FILE="backup.tar.gz"

NEW_NAME="${FILE/.tar.gz/.zip}"

echo "$NEW_NAME"

Output

backup.zip

29. Practical Example 3 - Convert Username
USERNAME="Bilal"

echo "${USERNAME,,}"

Output

bilal

Useful when usernames should always be lowercase.

30. Practical Example 4 - Extract Filename
PATH_NAME="/home/bilal/scripts/backup.sh"

echo "${PATH_NAME##*/}"

Output

backup.sh

31. Mini Project - Username Validator
#!/bin/bash

read -p "Enter username: " USERNAME

if [[ -z "$USERNAME" ]]
then
    echo "Username cannot be empty"
elif [[ ${#USERNAME} -lt 4 ]]
then
    echo "Username must contain at least 4 characters"
else
    echo "Valid Username"
    echo "Lowercase Username: ${USERNAME,,}"
fi

Example Output
Enter username: Bilal

Valid Username
Lowercase Username: bilal

Note:-
1. Forgetting Quotes

Wrong

echo $NAME

Better

echo "$NAME"

This prevents issues when the string contains spaces.

2. Using = for Numeric Comparison

Wrong

[ "$NUMBER" = 10 ]

Correct

[ "$NUMBER" -eq 10 ]

3.  Not Quoting Variables in if

Wrong

[ $NAME = Bilal ]

Correct

[ "$NAME" = "Bilal" ]
