#!/bin/ash
cd /home/container

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

echo "yolk Node.js Version"
node -v

echo "yolk NPM Version"
npm -v

echo "yolk PNPM Version"
pnpm -v

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e $(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

## if auto_update is not set or to 1 update
echo "Check for Update"
if [ -z ${AUTO_UPDATE} ] || [ "${AUTO_UPDATE}" == "1" ]; then
    # Update Server
		git init -b main
		git config --global --add safe.directory /mnt/server
		git pull ${GIT_ADDRESS} ${BRANCH}
		echo "Install PNPM Dependencies"
		pnpm install

else
    echo -e "Not updating the server as auto update was set to 0. Starting Server"
fi

# Run the Server
eval ${MODIFIED_STARTUP}