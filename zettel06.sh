#!/bin/bash

#test for number of arguments and if second argument is int
echo "checking syntax"
regex_int='^[0-9]+$';
if ! [[ $# = 2 && $2 =~ $regex_int ]]; then
  echo "syntax: ./sript.sh <name> <count>"
  exit 1
else
  echo "syntax is fine"
fi
#copy first argument into variable dir
dir=$1

#test if directory already exists
echo "checking if directory already exists"
while [ -d  $dir ]; do
  echo "directory already exists, please enter another name"
  read dir
done
#copy dir into origdir so we can manipulate dir
origdir=$dir

echo "this name is fine, lets start getting subdirectory names"

#get all other directory names and append them to dir
for (( i=0; i<$2; i++ )) do
  echo "give me a subdirectory name"
  read -e -i"$dir/" dir
done

echo "thats it, now I will create the following directory"
echo $dir

#creating directory
mkdir -p $dir

#changing rights
echo "lets make all directories read only"
chmod -R 755 $origdir
echo "and finally make the base directory writable to all"
chmod 777 $origdir





