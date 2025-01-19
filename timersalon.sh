#!/bin/sh

# This script automatically moves the RRF node to the RRF room 
# after a timeout (360s by default).
#
# Usage : ./timersalon.sh [--timeout=SECONDS] [--noise=SECONDS]
#
# F4HWN Armel
# Version 0.2


# Set default timeout duration in seconds
timeout=360

# Set default noise duration in seconds
noise=3

# Parse arguments
while [ $# -gt 0 ]; do
    case $1 in
    --timeout=*)
        timeout=${1#*=}
        ;;
    --noise=*)
        noise=${1#*=}
        ;;
    *)
        echo "Unknown argument: $1"
        echo "Usage: $0 [--timeout=SECONDS] [--noise=SECONDS]"
        exit 1
        ;;
    esac
    shift
done

# Initialize other values (do not modify)
last=$(date +%s)
timer=0
talker_start=$(date +%s)
talker_stop=$(date +%s)
duration=0
log='/tmp/timersalon.log'

# Start log
{
    echo "Start QSY at        : $(date +'%d-%m-%Y %H:%M:%S' -d @$last) ($last)"
    echo "--------------------"
} >"$log"

# Main loop
while [ "$timer" -lt "$timeout" ]; do
    # Standby
    sleep 10

    # Catch last Talker start (if exists)
    tmp=$(grep 'ReflectorLogic: Talker start:' /tmp/svxlink.log | tail -1 | cut -c1-24)
    if [ -n "$tmp" ]; then
        talker_start=$(date -d "$tmp" +%s)
    fi

    # Catch last Talker stop (if exists)
    tmp=$(grep 'ReflectorLogic: Talker stop:' /tmp/svxlink.log | tail -1 | cut -c1-24)
    if [ -n "$tmp" ]; then
        talker_stop=$(date -d "$tmp" +%s)
    fi

    now=$(date +%s)

    trace=true

    # Determine last activity
    if [ "$talker_start" -gt "$talker_stop" ]; then
        {
            duration=$((now - talker_start))

            if [ "$((now - talker_start))" -gt "$noise" ]; then
                last=$now
            fi
        }
    else
        {
            if [ "$talker_stop" -gt "$talker_start" ]; then
                {
                    if [ "$((talker_stop - talker_start))" -gt "$noise" ]; then
                        last=$talker_stop
                    fi
                }

            fi
            duration=$((talker_stop - talker_start))
        }
    fi

    timer=$((now - last))

    # Write trace for debugging (only if trace is true)
    if [ "$trace" = true ]; then
        {
            duration_minutes=$((duration / 60))
            duration_seconds=$((duration % 60))

            echo "Last Talker Start : $(date +'%d-%m-%Y %H:%M:%S' -d @$talker_start) ($talker_start)"
            echo "Last Talker Stop  : $(date +'%d-%m-%Y %H:%M:%S' -d @$talker_stop) ($talker_stop)"
            echo "Last Activity     : $(date +'%d-%m-%Y %H:%M:%S' -d @$last) ($last)"
            echo "Last Duration     : $(printf '%02d:%02d' $duration_minutes $duration_seconds)"
            echo "Timeout           : $(printf '%03d seconds' $timeout)"
            echo "Noise             : $(printf '%03d seconds' $noise)"
            echo "Timer             : $(printf '%03d seconds' $timer)"
            echo "------------------"
        } >>"$log"
    else
        {
            echo "Last QSO active at  : $(date +'%d-%m-%Y %H:%M:%S' -d @$now) ($now)"
            echo "--------------------"
        } >"$log"
    fi
done

# Return to RRF
{
    echo "Return to RRF at    : $(date +'%d-%m-%Y %H:%M:%S' -d @$now) ($now)"
} >>"$log"

/etc/spotnik/restart.rrf