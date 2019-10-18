#!/bin/bash

function stashlog() {
    cd /home/admin/baidu

    lastday=$(date +"%m_%d" -d "-1 day")
    if [ ! -f "jisutui_vip-access.log_${lastday}_$1" ]; then
        echo 'acesslog not exist'
        exit 1
    fi

    scp ali$1:/var/log/nginx/jisutui_vip-access.log{,.1} .

    cp jisutui_vip-access.log jisutui_vip-access.log_$(date +"%m_%d")_$1

    len=$(sed -n "$=" jisutui_vip-access.log_${lastday}_$1)

    cat /dev/null >access.log

    sed -n "$(($len + 1)),$ p" jisutui_vip-access.log.1 | grep -i 'baiduspider' | grep -E '/tj.(json|gif|js)' -v >access.log
    grep -i 'baiduspider' jisutui_vip-access.log | grep -E '/tj.(json|gif|js)' -v >>access.log

    cat access.log >>/var/baidu/access.log

    rm -f jisutui_vip-access.log{,.1}
    rm -f jisutui_vip-access.log_${lastday}_$1
}

cat /dev/null >/var/baidu/access.log

stashlog 173
stashlog 164
