#!/bin/bash

#do whatever is in the loop for 50 times
for i in {1..50}; do 
        #save the printed and decoded argument number 1 to the var CONTENT
        CONTENT=$(echo -n $1| base64 -d)
done

#print the result out
echo "$CONTENT"
