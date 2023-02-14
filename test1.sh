#!/bin/bash
# #1. How can you perform string manipulation in bash scripts, such as string concatenation and substring extraction?
# #string concatenation
# a="Ragvendra "
# b="Singh"
# echo "$a $b"
# #substring extraction
# read -p "Enter index number till then you want substring:" n
# string="How can you perform string manipulation "
# substring=${string:0:$n}
# echo "$substring"

# #2. What is the significance of the readonly command in bash scripts and how is it used?
# #in readonly command varaible if variable value is define once after that its value cannot change.
# readonly c="Ravi"
# echo "$c"
# c=11 #here value of c not change and both echo output is same
# echo "$c"

# #3. How can you redirect input and output streams in bash scripts and why is this useful?
# #here mainly three terms  1.standered input (stdin) represented by 0 2. standered output (stdout) represented by 1 3.standard error (sdterr) represented by 2

# cd notfile &> both_output.txt


# #4. What is the difference between using single quotes and double quotes in bash scripts, and when should each be used?
# #I am not able to explain this question
# echo 'That is Sohans car'
# echo "That is Sohan's car"

# #5. How can you perform regular expressions matching and substitution in bash scripts using the grep and sed commands?
# grep '^error' error.txt
# sed 's/error/warnning/g' error.txt


# #6. What is the significance of using process substitution in bash scripts and how is it performed?
# #Sustitite process feature that allow to the out of the command to be use as input without storing in any file
# json_data=$(cat MOCK_DATA.json) #MOCK_DATA.json read and store in json_data variabl if we need we use it without rereading MOCK_DATA.json
# echo "$json_data"

# #7. How can you write scripts that run in the background and how can you monitor their progress and status?
# top &> file.log  #list of process running in the system this is running in background
# cat file.log
# read -p "Enter PID of process you want to stop :" PID
# kill $PID

#8. What is the purpose of using the trap command in bash scripts and how is it used?


#trap "echo Hello World" SIGINT
#trap - SIGINT #back from trap

# #9. How can you write scripts that can handle signals, such as interrupt and terminate signals, and respond to them in an appropriate manner?
# trap "echo 'Exiting due to SIGINT signle'; exit 130" INT
# while true; do
# echo "Hello"
# sleep 1
# done

# trap "echo 'Exiting due to SIGTERM signle'" TERM
# for (( i=0; i<5;i++ )); do
# echo "Hello"
# sleep 1
# done

#10. What is the purpose of using the source command in bash scripts and how is it used to include files in other scripts? 
#Run script in current shell environment rather then seprate
#Example:-
#make afile name hello.sh and code given bellow
    #! /bin/bash

    # function hello {
    #     echo "this is omly testing "
    # }
#make second file hello1.sh which use source command
#by using souce now hello.sh's fucntion available in hello1.sh
#code of hello2.sh is
    #! /bin/bash

    #function hello {
    #echo "this is omly testing "
    #}