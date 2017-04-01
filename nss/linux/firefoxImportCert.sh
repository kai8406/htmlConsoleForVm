#! /bin/bash

# summary
echo "begin to install libnss3-tools for using certutil to import cert to firefox!"

# validate if certutil command is installed
if hash certutil 2>/dev/null; then
	echo "certutil command already exist."
else
	echo "certutil command dosn't exist. you must input password of root user for the command installation."
	sudo apt-get install libnss3-tools
fi

# another way to get user root path,but will return several paths
# username=`whoami`
# userpath=`cat /etc/passwd | grep $username | awk -F ":" '{print $6}'`
# echo $userpath

# get user firefox path
tempPath=/.mozilla/firefox
firefoxPath=$HOME$tempPath
firefoxIniTempPath=/profiles.ini
firefoxIniPath=$firefoxPath$firefoxIniTempPath
echo $firefoxIniPath

# get user firefox cert db name from profiles.ini file
containedChar="Path="
certdbName=`cat $firefoxIniPath | while read line;
do if [[ $line =~ $containedChar ]]
	then
		echo -n "$line"
   fi
done`
certdbName=${certdbName#Path=}
echo $certdbName

# get base path of bash file
basePath=$(cd `dirname $0`; pwd)
echo $basePath

# construct certutil executing command, cert file is in bastPath folder,and certName is changed according to you.
certName=/00ec645e.0.crt
command="certutil -A -n vc192.168.20.64 -t \"C,,\" -i ${basePath}${certName} -d ${firefoxPath}/${certdbName}"
echo ${command}

# exct
eval ${command}
echo "command run end."
