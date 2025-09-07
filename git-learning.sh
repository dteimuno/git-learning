git status
git add
git config user.email "munodennis@___mail.com"
git config user.name "Dennis Tei-Muno"
git commit #restores file to previous version from commit

#In order:
git config user.email "munodennis@___mail.com"
git config user.name "Dennis Tei-Muno"
git add .
git commit -m "Updated first story" #for best practice, each commit should solve a certain problem
git status 

#To move file from staging area:
git restore --staged story1.txt

#remove file from git tracking and keep or delete permanently. You must use the options of either --cached(remove from git tracking but keep in directory) or -f(forced removal)
git remove --cached notes.txt #remove file from tracking  but leave in directory
git remove -f notes.txt #remove file from tracking and permanently delete

#use .gitignore to permanently remove file from tracking

#get log of git
git log

#get log of git with file only
git log --name-only

#create new branch  from master and switch to it
git checkout -b dev
 OR
#create branch
git branch [BRANCH_NAME]

#switch branches
git checkout [BRANCH_NAME]
#see a list of all our branches:
git branch

#delete branch
git branch -d [BRANCH_NAME]

#merge branch. Assuming your side branch is signup/feature
##first change your branch to the master and then git merge [side-branch]
###in full steps:
git checkout main
git merge feature/signup
