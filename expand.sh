#!/bin/bash
# Expand filesystem at first boot
/etc/init.d/resize2fs start; reboot
# And delete me
rm $0