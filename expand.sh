#!/bin/bash
# Expand filesystem at first boot
/etc/init.d/resize2fs start
# Delete me
echo "Expand done" > /tmp/foo
rm $0
# And finaly reboot
/sbin/reboot