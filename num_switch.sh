#!/bin/sh

#
# Start or Stop Num Services by F4HWN Armel
#

SERVICES=("ambeserver" "analog_bridge" "hblink3" "hbmonitor" "ircddbgateway" "md380-emu" "mmdvm_bridge" "nxdngateway" "p25gateway" "ysfgateway")
for SERVICE in "${SERVICES[@]}"
do
    echo "$SERVICE.service"
    STATUS="$(systemctl is-active $SERVICE.service)"
    if [ "${STATUS}" = "active" ]; then
        echo "Stop $SERVICE.service"
        systemctl stop $SERVICE.service
    else
        echo "Start $SERVICE.service"
        systemctl start $SERVICE.service
    fi
done