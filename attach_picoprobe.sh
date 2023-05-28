#!/usr/bin/sh

set -- "$(usbipd.exe wsl list 2>/dev/null | awk '{if($0 ~ /Picoprobe/){print $0}}')"
if [ ${#} -gt 0 ] && [ -z "${0}" ] ;
then
    echo "test"
    for i in "${@}"
    do
        BUSID="$(echo "${i}"| awk '{if($0 ~ /Attached/){print $1}}')"
        if [ -n "${BUSID}" ];
        then
            echo "Already attached ${BUSID}"
        else
            BUSID="$(echo "${i}"| awk '{print $1}')"
            
            if [ -n "${BUSID}" ];
            then
                echo "attaching ${BUSID}"
                usbipd.exe wsl attach -b "${BUSID}"
            fi
        fi
    done
    exit 0
else
    echo "Not connect any Picoprobe"
    exit 1
fi
