#!/bin/sh
#
# Script to run in background svxbridge.py 
#
/opt/Analog_Bridge/dvswitch.sh ambemode YSFW
# a tester manuellement et adapter les ports et les output input device 
# si quelqu'un parle sur la ROOM ca ne marche pas donc a relancer a la main
python3 /opt/svxbridge/svxbridge.py> /dev/null 2>&1 &

