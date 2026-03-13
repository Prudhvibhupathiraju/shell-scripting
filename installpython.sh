#!/bin/bash
echo "Checking ditrubution is Ubuntu or Red Hat"
validate_distrubution(){
cat /etc/os-release | grep $1
if [ $? -eq 0 ]
then
echo "Distrubution is $1"
OS="$1"
else
echo "Distrubution is not $1"
fi
}
validate_distrubution "Ubuntu"
validate_distrubution "rhel"
ID=$(id -u)
if [ $ID -ne 0 ]
then
echo "Run this with root access"
exit 1
else
echo "Executing with root access"
fi
if [ "$OS" = "Ubuntu" ]
then
apt install python3 python3-pip -y
exit 1
elif [ "$OS" = "Redhat" ]
then
yum install python3 python3-pip -y
exit 1
else
echo "invalid distrubution"
fi
