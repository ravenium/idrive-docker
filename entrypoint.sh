#!/usr/bin/bash
# Entrypoint for idrive
if [ ! -e /etc/init.d/idrivecron ]; then
    echo "idrivecron not found. install idrive first:"
    echo "docker exec -it <container_id/name> bash "
    echo "in another terminal window while this is running."
    echo "then run idrive installation script: ./idriveforlinux.bin --install"
    echo "Follow prompts to set up your account, then restart the container."
    echo "docker restart <container_id/name>"
    echo "If iDrive had a config file we could mount it to the container fully automated, but it doesn't."
    echo "...but at least now you won't have to restart cron every container restart!"
else
    update-rc.d idrivecron enable
    service idrivecron start
fi
tail -f /dev/null
