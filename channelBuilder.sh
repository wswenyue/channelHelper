#!/bin/bash

#config
. ./config.sh

cat ./channel.txt | while read line   #filename 为需要读取的文件名,也可以放在命令行参数里。
do
    echo $line

    OLD_IFS="$IFS"
    IFS="#"
    arr=($line)
    IFS="$OLD_IFS"
    echo ${arr[0]}
    echo ${arr[1]}

    java -jar ./support/walle-cli-all.jar put -c ${arr[0]} ./app.apk ./out/${appName}-${arr[1]}-${buildType}-v${versionName}-${versionCode}-${buildTime}.apk

    echo "----${arr[0]}_${arr[1]}----ok"

done