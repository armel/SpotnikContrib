#!/bin/bash
# Balancer RRF by F4HWN
# Place balancer.sh in /etc/spotnik (and chmod +x it)
# Call it in rc.local (before /etc/spotnik/restart)

VALID=(rrf rrf2 rrf3 rrf4)
CHECK=/etc/spotnik/balancer.dat
TARGET=/etc/spotnik/restart.rrf
URL=http://rrf.f5nlg.ovh:8080/RRFDepot/balancer.dat

# Check if need to balance
if test -f "$CHECK"; then
    exit 0
fi

# Get value from RRF server
VALUE="`wget -qO- $URL`"

n=${#VALUE}

if ((n!=0)); then
    if [[ " ${VALID[*]} " =~ " ${VALUE} " ]]; then
        # Replace
        SEARCH=`grep -o 'echo "HOST=[^"]*' $TARGET | grep -o '[^"]*$'`
        REPLACE="HOST="$VALUE".f5nlg.ovh"
        sed -i.back "s/$SEARCH/$REPLACE/" $TARGET
        touch $CHECK
    fi
fi