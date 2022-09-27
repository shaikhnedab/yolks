#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Print Node.js Version
node -v
# Print NPM Version
npm -v
# Print Python Version
python3.9 --version
# Print PIP Version
python3.9 pip --version
# Install Python Requirements
python3.9 -m pip install -r requirements.txt
# Build NPM Packages
npm run build

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}