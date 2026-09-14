Step 1: Check your username

Run:

whoami

For example, if it shows:

bilal

Step 2: Open sudoers safely
sudo visudo

It will ask for your password this time.

Step 3: Add this line at the bottom

Replace bilal with your actual username:

bilal ALL=(ALL) NOPASSWD: ALL

For example:

# User privilege specification
root    ALL=(ALL:ALL) ALL

bilal   ALL=(ALL) NOPASSWD: ALL

Step 4: Save and exit

If visudo opens in nano:

Ctrl + O → Enter
Ctrl + X
Step 5: Test

Run:

sudo whoami

It should show:

root

And it should not ask for a password

2. What does this mean?
bilal ALL=(ALL) NOPASSWD: ALL

bilal → your user
ALL → applies to all hosts
(ALL) → can run commands as any user
NOPASSWD → don't ask for password
ALL → all sudo commands
