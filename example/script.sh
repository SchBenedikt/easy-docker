#!/bin/bash

echo "Bitte geben Sie etwas ein: "
read user_input

if [ "$user_input" = "sch" ]; then
    echo "Sie haben 'sch' eingegeben!"
else
    echo "Sie haben etwas anderes eingegeben: $user_input"
fi
