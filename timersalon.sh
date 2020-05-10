#!/bin/sh
#
# Perform return to RRF after timeout  
# F4HWN Armel
#

# Set timeout in seconds

timeout=120

# Init other values (don't touch)

start=`date +%s`
timer=0

# Main loop

while [ $timer -lt $timeout ]; do
    last=`grep 'ReflectorLogic: Talker stop:' /tmp/svxlink.log | tail -1 | cut -c1-24`
    last=`date -d "$last" +%s`

    now=`date +%s`

    if [ $start -gt $last ]
    then
        timer=$(($now-$start))
    else
        timer=$(($now-$last))
    fi

    sleep 10
done

# Return to RRF

/etc/spotnik/restart.rrf