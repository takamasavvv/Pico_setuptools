#!/usr/bin/sh
USB_STATE="detach"
usbipd.exe wsl list 2>/dev/null | while read -r line; do
if echo "${line}" | grep -q "Picoprobe"
then
    if echo "${line}" | grep -q "Attached"
    then
        USB_STATE="attach"
        echo "already attached Picoprobe"
    else
        usbipd.exe wsl attach -i "$(echo "${line}" | awk '{print $2}')"
        for i in $(seq 5);
        do
            if echo lsusb | grep -q "Picoprobe"
            then
                USB_STATE="attach"
                break;
            fi
            echo "${i}"
            sleep 1
        done
    fi
    # if [ $USB_STATE = "detach" ]; then
    #     USB_STATE="attach"
    # fi

    # echo "Connected Picoprobe"
    # exit 0

fi
done




