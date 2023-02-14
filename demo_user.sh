#!/bin/bash

read -p "Please,enter your username:" user_name
read -sp "Please,enter your password:" user_passwd
echo
if [ "$user_name" != "$DEMO_USER" ];
then 
echo "User not valid"
exit 1
fi
if [ $user_passwd != $DEMO_PASSWORD ];
then
echo "please enter password again"
fi

