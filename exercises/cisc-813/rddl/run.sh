#!/bin/bash

echo "Starting RDDL Gym Server..."
# ( cd /workspace/pyRDDLGym && python run.py $@ ) > pyrddl.log 2>&1 &
( cd /workspace/pyRDDLGym && python run.py $@ ) &

echo "Starting PROST..."
# ( cd /workspace/prost && ./prost.py 813rocks "[PROST -s 1 -se [IPC2014]]" ) > prost.log 2>&1
( cd /workspace/prost && ./prost.py 813rocks "[PROST -s 1 -se [IPC2014]]" )

echo "Writing data.json..."
cat /workspace/data.json > data.json
