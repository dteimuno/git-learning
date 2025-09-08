#add remote repo to local project:
git remote add origin [https-connection-string] #in this case origin is the alias of the remote repo we are pulling. That is what we call it. #expects two arguments one the alias you want to call your repo locally and 2, the webaddress of the repo

#list all your remote repositories
git remote -v

#push data to remote repo
git push origin master #expects two arguments; One, the first is the remote name or alias and then the second is the current branch we're one

#clone repository
git clone [ssh link]

#fetch changes to local repo from remote:
git fetch origin master #this fetches the origin alias remote repo and its master branch back to our local repo

#or insteag of fetching and mergin please use git pull. It is two commands in one:
git pull origin master #does both fetching and mergin into our master branch


#rebasing
git rebase master #if your branch is say sarah, this command places everything in master branch into the sarah branch

#interative rebase. must use -i option with git rebase command:
git rebase -i HEAD~4 #this will then allow you to pick commands you can modify the documents with and then do an interactive rebase

#want some commits and not other
git cherry-pick [hash-of-commit-you-want]
#so do git log to identify the commit hash in the source branch
#then git checkout [BRANCH_NAME] to move to branch you want
#then git cherry-pick [COPIED_HASH] to merge only that file to your current branch

##revert changes
git revert [HASH]

#reset commit but softly
git reset --soft HEAD~1 #it will reset but we still have access to the other files

#reset but hard(everything from previous commit wiped ou)
git reset --hard HEAD~1

#Statsh old changes in the working area
git stash

#get changes back into working area
git stash pop

#see all the stashes
git stash list

#after using git stash, see all the contents of a git stash
git stash show [particular-git-stash]
git stash pop

#what to do after you performed a hard reset; use 
git reflog #will show you absolutely all the history of everything done in git and then use:
git reset [] #point it to particular point in time that you want 

