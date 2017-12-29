#!/bin/bash
cd /c/Users/lalithapopuri/third_repo
branch_name=`git symbolic-ref --short HEAD` 
retcode=$?
non_push_suffix="_local"


# Only push if branch_name was found (my be empty if in detached head state)
if [ $retcode = 0 ] ; then
    #Only push if branch_name does not end with the non-push suffix
    if [[ $branch_name != *$non_push_suffix ]] ; then
        echo
        echo "**** Pushing current branch $branch_name to origin [i4h_mobiles post-commit hook]"
        echo
        git push origin $branch_name;
    fi
fi