#!/bin/bash

arr=("$@")
read -p  "Enter name:-" arr
for name in ${arr[@]}
do 
	echo $name
done

