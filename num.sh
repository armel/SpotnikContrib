#!/bin/bash

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
        esac
done
