#!/bin/bash 

project=`basename \`pwd\``
cd $project
git show -s --format=%H > ../HEAD.txt
git pull origin master --tags
git show -s --format=%H > ../new_HEAD.txt
cd ..
if [ `cat new_HEAD.txt` != `cat HEAD.txt` ]; then
    new_HEAD=`cat new_HEAD.txt`
    git add -u
    git commit -m "Update to $new_HEAD."
    git push origin master
fi
rm new_HEAD.txt HEAD.txt
