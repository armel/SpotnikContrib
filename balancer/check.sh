#!/bin/bash
# Check RRF by F4HWN

SERVER_TARGET=3
SERVER_LIMIT=4
NODE_URL="http://rrf2.f5nlg.ovh:4440/nodes"
NODE_FILENAME="/tmp/nodes"
MIN=1000

# Get node list
wget -qO $NODE_FILENAME $NODE_URL

# Main loop
for((i=1; i<=$SERVER_LIMIT; i++))
do
    count=`grep -o -i '\['$i',"RRF"' $NODE_FILENAME | wc -l`
    if((count < MIN))
    then
        MIN=$((count))
        SERVER_TARGET=$i
    fi
    echo "Server RRF$i -> $count nodes"
done

# Result

echo "Best empty server is RRF$SERVER_TARGET with only $MIN nodes !"
