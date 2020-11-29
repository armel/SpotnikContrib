#!/bin/sh
NOW=$(/bin/date +"%d/%m/%Y %H:%M:%S")
# Expand filesystem at first boot
/etc/init.d/resize2fs start
# Add trace log
/bin/echo "${NOW} Expand SD card is done" > /var/log/expand.log
# Delete me
rm /etc/init.d/expand.sh
# And finaly reboot
/sbin/reboot