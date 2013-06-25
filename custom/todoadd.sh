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

if [ ! -f "$folder/Info.md" ] ;
then
	echo "WARNING: No Info.md, these is not mandatory but this provide help for managing patches."
	echo "WARNING: The file should contain references from the POL issue/feature DB."
	echo "WARNING: The file should contain references from WineHQ website."
	echo "WARNING: Patches url sources, or any thing interesting about this build."
	echo "If you want to add it, please press ^C within 30 secondes, or wait if you really want made life harder for POL Team."
	sleep 30s
fi

list=$(cd "$folder" && ls -1 *.patch | wc -l)
if [ $list -lt 1 ] ; then
	echo "There is not patch!"
	echo "Patch files must end with .patch"
	exit
fi
echo "Seems good, adding Wine-$winev as $folder with $list patche(s)"
#all todo, regardless arch/os
echo "wine-$winev	$folder" >> todo.lst

#todo for specific arch/os
echo "wine-$winev	$folder" >> todo_darwin-x86.lst
echo "wine-$winev	$folder" >> todo_linux-amd64.lst
echo "wine-$winev	$folder" >> todo_linux-x86.lst

echo "Almost done, adding files to git for you and commiting."
git add "$folder"
git add todo.lst
git add todo_linux-x86.lst todo_linux-amd64.lst todo_darwin-x86.lst
if [ -z "$message" ] ; then
	git commit -m "Adding patches $folder for wine $winev."
else
	git commit -m "Adding patches $folder for wine $winev. Comment is: $message"
fi
echo "You have to push, if you need to edit commit message, please use: git commit --amend"
