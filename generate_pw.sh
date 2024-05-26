#!/bin/bash

read -s -p "Please enter the password: " PASSWORD
echo

BASE62=($(echo {0..9} {a..z} {A..Z}))
# bc needs uppercase chars...
HASH=$(echo -n "${PASSWORD}" | sha256sum | tr "a-z" "A-Z" | cut -d " " -f 1)
ENCODED=""
for i in $(BC_LINE_LENGTH=0 bc <<< "obase=62; ibase=16; $HASH"); do
    ENCODED="${ENCODED}${BASE62[$(( 10#$i ))]}"
done

echo "The hashed password is: ${ENCODED}"
