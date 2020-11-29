#!/bin/bash
# Expand filesystem at first boot
/etc/init.d/resize2fs.sh start
# And delete me
rm $0