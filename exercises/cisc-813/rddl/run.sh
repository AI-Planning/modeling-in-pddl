#!/bin/bash

echo "Starting RDDL Gym Server..."
( cd /workspace/pyRDDLGym && python run.py $@ ) > pyrddl.log 2>&1 &

sleep 5
echo "Starting PROST..."
( cd /workspace/prost && ./search-release 813rocks "[PROST -s 1 -se [IPC2014]]" ) > prost.log 2>&1

echo "Writing data.json..."
cat /workspace/data.json > data.json
