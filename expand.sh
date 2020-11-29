#!/bin/bash
NOW=$(date +"%d/%m/%Y %H%M%S")
# Expand filesystem at first boot
/etc/init.d/resize2fs start
# Add trace log
echo "${NOW} Expand SD card is done" > /var/log/expand.log
# Delete me
rm $0
# And finaly reboot
/sbin/reboot