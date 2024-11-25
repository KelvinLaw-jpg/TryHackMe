# Bash

### Practice 1
A user has a locker in a bank. To secure the locker, we have to have a script in place that verifies the user before opening it. When executed, 
the script should ask the user for their name, company name, and PIN. If the user enters the following details, they should be allowed to enter, 
or else they should be denied access.

Username: John
Company name: Tryhackme
PIN: 7385

```
#Define Interpreter
#!/bin/bash

# define var
username=""
companyName=""
pin=""

# Use loop to read user input
# define loop
for i in {1..3}; do
    # Do the following 3 times
    if [$i -eq 1]; then
        echo "Enter your username:"
        read username
    elif [$i -eq 2]; then
        echo "Enter your Company Name:"
        read companyName
    else
        echo "Enter your pin:"
        read pin
    fi
done

# check if the input is correct
if [$username = john] && [$companyName = Tryhackme] && [$pin = 7385]; then
    echo "Authentication success, locker open."
else
    echo "Authentication fail, please enter the correct credentials"
fi




```
