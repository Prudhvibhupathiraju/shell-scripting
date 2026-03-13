#!/bin/bash
echo "Checking ditrubution is Ubuntu or Red Hat"
cat /etc/os-release | grep Ubuntu
if [ $? -e 0 ]
then
echo "Distrubution is Ubuntu"
OS=ubuntu
else
echo "Distrubution is not Ubuntu"
fi
cat /etc/os-release | grep Redhat
if [ $? -e 0 ]
then
echo "Distrubution is Redhat"
OS=Redhat
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
if [ $OS -e ubuntu ]
then
apt install python3 python3-pip
elif [ $OS -e Redhat ]
yum install python3 python3-pip
else
echo "invalid distrubution"
fi


