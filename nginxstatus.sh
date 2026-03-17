#!/bin/bash
service="nginx"
email="prudhvi.bhupathiraju999@gmail.com"
host=$(hostname)
DATE=$(date "+%Y-%m-%d %H:%M:%S")

systemctl status $service | grep "running"
if [ $? -ne 0 ]
then
LOGS=$(journalctl -u nginx -n 10 --no-pager)
MESSAGE=$(cat <<EOF
=============================
🚨 SERVICE ALERT 🚨
=============================

Server      : $host
Service     : $service
Status      : DOWN ❌
Time        : $DATE

Recent Logs
-----------------------------
$LOGS

Action Required:
systemctl status $SERVICE

=============================
Linux Monitoring System
=============================
EOF
)
echo "$MESSAGE" | mail -s "🚨 ALERT: $SERVICE DOWN on $host" $email
else
echo "$service is up on $(hostname)" | mail -s "$service is running" $email
fi
