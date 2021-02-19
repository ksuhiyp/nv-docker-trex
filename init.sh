#!/bin/bash

if [ ! -f /config/config.json ]; then
	cp /home/nobody/config.json /config/config.json
fi

echo Starting T-rex miner...
echo ============================================================
echo Server: $SERVER
echo Algorithm: $ALGO
echo Wallet: $WALLET
echo Worker: $WORKER
echo ============================================================


./t-rex -c /config/config.json  