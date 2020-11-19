#!/bin/bash

yarn --version # confirm we're using yarn v2 berry
yarn -s sleep & # run the sleep script in package.json
sleep 1
parent_process=$(ps | grep "node.*yarn -s sleep" | grep -v "grep" | awk '{print $1}')
echo "killing yarn process: $parent_process"
kill "$parent_process"

# note: at this point, the child sleep process should be terminated but is not
if ps | grep 'sleep 1000' | grep -v 'grep'
then
  echo "[FAIL] still sleeping"
  exit 1
else
  echo "[PASS] done sleeping"
  exit 0
fi

# kill everything
pkill -f sleep