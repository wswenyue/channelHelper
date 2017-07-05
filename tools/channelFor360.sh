#!/bin/bash

#config
#. ${configFiles}/config.sh

zipApk=./appzip.apk
out360Apk=${out360Files}/${appName}-${channel360Name}-${buildType}-v${versionName}-${versionCode}-${buildTime}.apk

#init
rm ${zipApk} >/dev/null 2>&1;
rm ${out360Apk} >/dev/null 2>&1;


#优化
${supportDir}/zipalign -v -p 4 ${jiagu360App} ${zipApk} >/dev/null 2>&1;
if [ $? -ne 0 ];then
	echo "优化出错"
	exit 0
fi
#签名
${supportDir}/apksigner sign --ks ${signFile} --ks-pass pass:${signFilePass} ${zipApk} >/dev/null 2>&1;
if [ $? -ne 0 ];then
	echo "签名出错"
	exit 0
fi
#校验签名是否成功
${supportDir}/apksigner verify ${zipApk} >/dev/null 2>&1;

if [ $? -ne 0 ];then
	echo "校验签名出错"
	exit 0
fi

#写入渠道信息
java -jar ${supportDir}/walle-cli-all.jar put -c ${channel360Num} ${zipApk} ${out360Apk}  >/dev/null 2>&1;

rm -f ${zipApk}  >/dev/null 2>&1;

echo "360渠道包生成成功-->"${out360Apk}

check=`java -jar ${supportDir}/walle-cli-all.jar show -c ${out360Apk}`


IFS=' : ' read -r -a arrCheck <<< "$check"  

if [[ ${arrCheck[1]} == ${channel360Num} ]]; then
  	echo "检测渠道包正常-->"${arrCheck[1]}
else
	echo "检测渠道包不正常-->"${arrCheck[1]}
fi



