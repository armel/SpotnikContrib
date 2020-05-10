#!/bin/sh
#
# Perform return to RRF after timeout  
# F4HWN Armel
#

# Set timeout in seconds

timeout=60

# Init other values (don't touch)

last=`date +%s`
timer=0
talker_start=0
talker_stop=`date +%s`

# Remove last log

rm /tmp/timersalon.log

# Main loop

while [ $timer -lt $timeout ]; do

    # Catch last Talker start (if exist)

    tmp=`grep 'ReflectorLogic: Talker start:' /tmp/svxlink.log | tail -1 | cut -c1-24`
    if [ ! -z "$tmp" ]
    then
        talker_start=`date -d "$tmp" +%s`
    fi

    # Catch last Talker stop (if exist)

    tmp=`grep 'ReflectorLogic: Talker stop:' /tmp/svxlink.log | tail -1 | cut -c1-24`
    if [ ! -z "$tmp" ]
    then
        talker_stop=`date -d "$tmp" +%s`
    fi

    # If last Talker start > last Talker stop, then somebody is speaking so
    #   last activity is now
    # Else
    #   last activity was at last Talker stop... 

    if [ $talker_start -gt $talker_stop ]
    then
        last=`date +%s`
        trace=false
        rm /tmp/timersalon.log
    else
        last=$talker_stop
        trace=true
    fi

    now=`date +%s`

    timer=$(($now-$last))

    # Write trace for debug

    if [ "$trace" = true]
    then

cat << EOF >> /tmp/timersalon.log
Last Talker Start   : `date +'%d-%m-%Y %H:%M:%S' -d @$talker_start` ($talker_start)
Last Talker Stop    : `date +'%d-%m-%Y %H:%M:%S' -d @$talker_stop` ($talker_stop)
Last Radio Activity : `date +'%d-%m-%Y %H:%M:%S' -d @$last` ($last)
Timer               : $timer seconds
--------------------
EOF

    fi

    # And standby...

    sleep 10
done

# Return to RRF

/etc/spotnik/restart.rrf