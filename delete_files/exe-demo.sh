#!/bin/bash

export hosts="192.168.1.11 192.168.12"
export hostUser="dongli"
export hostPem="/user/local/pem/dong.li.pem"
export paths="/user/local/ /user/share/*.log"

./delete_files.sh

exit
