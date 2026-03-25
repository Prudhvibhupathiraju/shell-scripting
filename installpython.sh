#!/bin/bash
ID=$(id -u)
timestamp=$(TZ=Asia/Kolkata date "+%Y-%m-%d_%H:%M:%S")
LOGFILE="/tmp/shell-script-logs/$0-$timestamp.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
echo -e "Script is executing at $Y $timestamp $N "
echo -e "$R Checking ditrubution is Ubuntu or Red Hat $N"
validate_distrubution(){
cat /etc/os-release | grep $1 &>> $LOGFILE
if [ $? -eq 0 ]
then
echo -e "$G Distrubution is $1 $N"
OS="$1"
else
echo -e "$R Distrubution is not $1 $N" &>> $LOGFILE
fi
}
validate_distrubution "Ubuntu"
validate_distrubution "rhel"
if [ $ID -ne 0 ]
then
echo -e "$R Run this with root access $N"
exit 1
else
echo -e "$G Executing with root access $N"
fi
if [ "$OS" = "Ubuntu" ]
then
installer=apt
elif [ "$OS" = "rhel" ]
then
installer=yum
fi                             
$installer install python3 python3-pip -y &>> $LOGFILE
if [ $? -eq 0 ]
then
echo -e "$G Successfully installed python3 python3-pip $N"
else
echo -e "$R Installation failed $N"
fi

