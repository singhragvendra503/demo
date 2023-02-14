#!/bin/bash

htop
if [ $? -eq 0 ];
then
	echo "Command run successfully"
else
	echo "Please,install packege"
       sudo apt install -y htop
htop
fi
