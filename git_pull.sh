#! /bin/bash



REPO_URL="https://AshishChicmic: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@github.com/Justin-Davis-Sbrigit/Mini_Heart_Backend_NodeJS.git"


cd Mini_Heart_Backend_NodeJS/

# Pull from the Git repository
git pull "$REPO_URL" 

# Check the result of the pull operation
if [ $? -eq 0 ]; then
  echo "Git pull successful."
else
  echo "Git pull failed."
  exit 
fi


pm2 restart 0
pm2 log 0
