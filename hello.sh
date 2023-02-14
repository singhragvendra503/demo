#! /bin/bash

function my_fun() {
  echo "inside trapped function "
}
trap my_fun 15 2
echo "sleep1"
sleep 400 &
echo "sleep2"
sleep 400
