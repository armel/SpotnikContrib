#!/bin/sh

#
# Start and Stop Num Services by F4HWN Armel
#

case "$1" in
    start)
        echo "Start Num Services"
        systemctl start ambeserver.service
        systemctl start analog_bridge.service
        systemctl start hblink3.service
        systemctl start hbmonitor.service
        systemctl start ircddbgateway.service
        systemctl start md380-emu.service
        systemctl start mmdvm_bridge.service
        systemctl start nxdngateway.service
        systemctl start p25gateway.service
        systemctl start ysfgateway.service
        ;;
    stop)
        echo "Stop Num Services"
        systemctl stop ambeserver.service
        systemctl stop analog_bridge.service
        systemctl stop hblink3.service
        systemctl stop hbmonitor.service
        systemctl stop ircddbgateway.service
        systemctl stop md380-emu.service
        systemctl stop mmdvm_bridge.service
        systemctl stop nxdngateway.service
        systemctl stop p25gateway.service
        systemctl stop ysfgateway.service
        ;;
    esac