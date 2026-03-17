#!/bin/bash
service="nginx"
email="prudhvi.bhupathiraju999@gmail.com"
systemctl status $service | grep "running"
if [ $? -ne 0 ]
then
echo "$service is down on $(hostname)" | mail -s "$service down alert" $email
else
echo "$service is up on $(hostname)" | mail -s "$service is running" $email
fi
