#!/bin/bash

#
# Enable or Disable Num Services by F4HWN Armel
#

SERVICES=("ambeserver" "analog_bridge" "ircddbgateway" "md380-emu" "mmdvm_bridge" "nxdngateway" "p25gateway" "ysfgateway")
for SERVICE in "${SERVICES[@]}"
do
    STATUS="$(systemctl is-active $SERVICE.service)"
    if [ "${STATUS}" = "active" ]; then
        echo "Stop $SERVICE.service"
        systemctl stop $SERVICE.service
        echo "Disable $SERVICE.service"
        systemctl disable $SERVICE.service
    else
        echo "Enable $SERVICE.service"
        systemctl enable $SERVICE.service
        echo "Start $SERVICE.service"
        systemctl start $SERVICE.service
    fi
done