#!/bin/bash
#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
REPO_URL="https://singhragvendra503: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@github.com/singhragvendra503/demo.git"   
cd /home/ragvendra/gitrepo
git clone git@github.com:singhragvendra503/demo.git
cd /home/ragvendra/gitrepo/demo/  
# Pull from the Git repository 
#git pull "$REPO_URL"   
# Check the result of the pull operation 
#if [ $? -eq 0 ]; then   
#	echo "Git pull successful." 
#else   
#	echo "Git pull failed."   
#	exit  
#fi  
git add .
if [ $? -ne 0 ]; then
 exit
fi
git commit -m "Automated commit $date"
if [ $? -ne 0 ]; then
 exit
fi
git push -f "$REPO_URL"
if [ $? -eq 0 ]; then   
	echo "Git push successful." 
else   
	echo "Git push failed."   
	exit  
fi 
