#!/bin/bash

#config
. ../config.sh

#init
rm -f ./app_zip.apk
rm -f ./${appName}-${channel360Name}-${buildType}-v${versionName}-${versionCode}-${buildTime}.apk

#优化
../support/zipalign -v -p 4 ${jiagu360App} app_zip.apk
if [ $? -ne 0 ];then
	echo "优化出错"
	exit 0
fi
#签名
../support/apksigner sign --ks ../support/${signFile} --ks-pass pass:${signFilePass} app_zip.apk
if [ $? -ne 0 ];then
	echo "签名出错"
	exit 0
fi
#校验签名是否成功
../support/apksigner verify app_zip.apk

if [ $? -ne 0 ];then
	echo "校验签名出错"
	exit 0
fi

#写入渠道信息
java -jar ../support/walle-cli-all.jar put -c channel360Num ./app_zip.apk ./${appName}-${channel360Name}-${buildType}-v${versionName}-${versionCode}-${buildTime}.apk

rm -f ./app_zip.apk

echo "ok"