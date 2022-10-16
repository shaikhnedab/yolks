#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

echo "Node.js Version"
node -v
echo "NPM Version"
npm -v
echo "Python Version"
python3.9 --version
echo "PIP Version"
python3.9 -m pip --version
echo "Install Python Requirements"
python3.9 -m pip install -r requirements.txt
echo "Install NPM Packages"
npm install

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}