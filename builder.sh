#!/bin/bash
# Author: wswenyue.
#Date & Time: 2017-03-09 13:40:32
#Description: a bash script

. ./\in/config.sh

_TARGET=$1

echo_usage() {
    echo "Usage:"
    echo "  builder.sh "
    echo "  builder.sh all"
    echo "  builder.sh 360"
    echo "  builder.sh clean"
    exit 1
}

case "$_TARGET" in
    "")
        echo "##########开始生成普通渠道包###############"
        sh ./tools/channelBuilder.sh
        echo "##########普通渠道包生成完毕###############"
    ;;
    all)
        echo "##########开始生成普通渠道包###############"
       	sh ./tools/channelBuilder.sh
        echo "##########普通渠道包生成完毕###############"

        echo "##########开始生成360渠道包###############"
       	sh ./tools/channelFor360.sh
        echo "##########360渠道包生成完毕###############"
    ;;
    360)
        echo "##########开始生成360渠道包###############"
        sh ./tools/channelFor360.sh
        echo "##########360渠道包生成完毕###############"
    ;;
    clean)
        echo "##########清理开始###############"
        rm -rf ${outFiles} >/dev/null 2>&1;
        echo "##########清理完毕###############"
    ;;
    *)
        echo_usage
        exit 1
    ;;
esac