#!/bin/bash

# This script start or stop numeric services
# F4HWN Armel
# Usage : num.sh [stop|start|status]


SERVICES=("ambeserver" "analog_bridge" "ircddbgateway" "md380-emu" "mmdvm_bridge" "nxdngateway" "p25gateway" "ysfgateway")
for SERVICE in "${SERVICES[@]}"
do
    case "$1" in
        start)
            echo "Start $SERVICE.service"
            systemctl start $SERVICE.service
            ;;
        stop)
            echo "Stop $SERVICE.service"
            systemctl stop $SERVICE.service
            ;;
        status)
            echo "Status $SERVICE.service"
            systemctl is-active $SERVICE.service
            ;;
        esac
done
