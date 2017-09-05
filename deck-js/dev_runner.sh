#!/bin/bash
PORT=8080 npm run watch &
IPID=$!
cat # This waits until stdin closes
kill $IPID
sleep 1
kill -9 $IPID