#!/bin/bash
host=10.3.3.42
for port in {1..65535}; do
    timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
        echo "port $port is open"
done
echo "Done"

#for /L %i in (1,1,255) do @ping -n 1 -w 200 10.5.5.%i > nul && echo 10.5.5.%i is up.
