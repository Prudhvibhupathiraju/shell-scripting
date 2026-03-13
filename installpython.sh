#!/bin/bash
echo "Checking ditrubution is Ubuntu or Red Hat"
cat /etc/os-release | grep Ubuntu
if [ $? -eq 0 ]
then
echo "Distrubution is Ubuntu"
OS="ubuntu"
else
echo "Distrubution is not Ubuntu"
fi
cat /etc/os-release | grep Redhat
if [ $? -eq 0 ]
then
echo "Distrubution is Redhat"
OS="Redhat"
else
echo "Distrubution is not Redhat"
fi
ID=$(id -u)
if [ $ID -ne 0 ]
then
echo "Run this with root access"
else
echo "Executing with root access"
fi
if [ "$OS" = "ubuntu" ]
then
apt install python3 python3-pip -y
elif [ "$OS" = "Redhat" ]
then
yum install python3 python3-pip -y
else
echo "invalid distrubution"
fi
