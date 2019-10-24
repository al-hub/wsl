#!/bin/bash

FOLDERS=`smbclient -L 192.168.1.1 -U% | grep "ipTime\|Seagate" | grep -v "@\|found" | awk '{print $1}'`

echo $FOLDERS

#echo -n "Please enter admin's password for RT-AC68R-F528 : "
#read -s password 

unset pw
prompt="Please enter RT-AC68R-F528 admin's password: "
while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]]
    then
	    break
    fi
    prompt='*'
    pw+="$char"
done
echo

for folder in $FOLDERS
do
	echo $folder
	#mount -t cifs //RT-AC68R-F528/$folder /mnt -o username=admin,password=$pw,iocharset=utf8,file_mode=0777,dir_mode=0777,sec=ntlm
	#https://superuser.com/questions/1439250/wsl-drvfs-mount-issues-cannot-mount-read-only/1495627#1495627
	mkdir -p ~/my_mount/$folder
	sudo mount -t drvfs //192.168.1.1/$folder ~/my_mount/$folder
done


