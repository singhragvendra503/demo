
#!/bin/bash

echo "Please, enter number of hours: "
read hour
echo "Please, enter number of minuts: "
read min
echo "Please, enter number of seconds: "
read sec
while [ $hour -ge 0 ]; do
   while [ $min -ge 0 ]; do
     while [ $sec -ge 0 ]; do
       echo -ne "$hour:$min:$sec\r"
       let "sec = sec-1"
       sleep 1
     done
     sec=59
     let "min = min-1"
   done
   min=59
   let "hour=hour-1"
 done
