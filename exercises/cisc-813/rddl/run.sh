#!/bin/bash

# Confirm 4 parameters
if [ $# -ne 4 ]; then
    echo
    echo "  Usage: rddlprost <domain> <instance> <rounds (e.g., 30)> <time (e.g., 300)>"
    echo
    exit 1
fi

convert_to_absolute_path() {
    if [[ $1 != /* ]]; then
        ABS_PATH="$(pwd)/$(basename "$1")"
    else
        ABS_PATH=$1
    fi
    echo "$ABS_PATH"
}

DOM="$(convert_to_absolute_path "$1")"
INST="$(convert_to_absolute_path "$2")"

# Make sure they exist
if [ ! -f "$DOM" ]; then
    echo "Domain file $DOM does not exist."
    exit 1
fi

if [ ! -f "$INST" ]; then
    echo "Instance file $INST does not exist."
    exit 1
fi

echo "Starting RDDL Gym Server..."
( cd /workspace/pyRDDLGym && python run.py "$DOM" "$INST" "$3" "$4" ) > pyrddl.log 2>&1 &

sleep 5
echo "Starting PROST..."
( cd /workspace/prost && ./search-release 813rocks "[PROST -s 1 -se [IPC2014]]" ) > prost.log 2>&1

echo "Writing data.json..."
cat /workspace/data.json > data.json
