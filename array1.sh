#!/bin/bash

declare -a arr
arr=( "user1 name age" "user2" "user3" ) 
for i in "${arr[@]}"
do
 echo $i
 done
 for i in "${arr[*]}"
do
 echo $i
 done
