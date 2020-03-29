#!/bin/bash
git annex webapp --listen=127.0.0.1 > /tmp/gitannexweb.out &
PID=$!

while [[ ! -s  /tmp/gitannexweb.out ]]; do sleep 1; done
PORT=`grep -Po "1:(\K.+)(?=/)" /tmp/gitannexweb.out`
cat /tmp/gitannexweb.out
socat TCP-LISTEN:8888,fork TCP:127.0.0.1:$PORT &
wait $PID
