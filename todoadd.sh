#!/bin/bash

function usage()
{
	echo "Usage: $0 WineVersion PatchFolder [extra commit message]"
	echo "Ex: $0 1.5.27 Tera"
	echo "Ex: $0 1.5.27 Tera 'Add fix for tera request #1234'"
	exit 1
}
[ ! -z "$1" -a ! -z "$2" ] || usage
winev=$1
folder=$2
shift
shift
message="$@"
if [ ! -d "$folder" ] ; then
	echo No folder, see usage.
	usage
	exit
fi
echo $winev | grep -q -E '^[[:digit:]]*\.[[:digit:]]*(|\.[[:digit:]]*)$'
ret=$?
if [ $ret -eq 1 ] ; then
	echo "Bad WineVersion, see usage."
	usage
	exit
fi
grep -q "^wine-$winev[[:space:]]$folder$" todo.lst
ret=$?
if [ $ret -eq 0 ] ; then
	echo "Refusing to add, build already in list."
	exit
fi
if [ ! -f "$folder/winebuild.cfg" ] ; 
then
	echo "Missing winebuild.cfg, not adding to list."
fi

list=$(cd "$folder" && ls -1 *.patch | wc -l)
if [ $list -lt 1 ] ; then
	echo "There is not patch!"
	echo "Patch files must end with .patch"
	exit
fi
echo "Seems good, adding Wine-$winev as $folder with $list patche(s)"
echo "wine-$winev	$folder" >> todo.lst
cp todo.lst todo_darwin-x86.lst
cp todo.lst todo_linux-amd64.lst
cp todo.lst todo_linux-x86.lst
echo "Almost done, adding files to git for you and commiting."
git add "$folder"
git add todo.lst
git add todo_linux-x86.lst todo_linux-amd64.lst todo_darwin-x86.lst
if [ -z $message ] ; then
	git commit -m "Adding patches $folder for wine $winev."
else
	git commit -m "Adding patches $folder for wine $winev. Comment is: $message"
fi
echo "You have to push, if you need to edit commit message, please use: git commit --amend"
