#!/bin/bash

#config
#. ${configFiles}/config.sh

rm ${outFiles}/*.apk >/dev/null 2>&1;

build_channel(){
	cat ${configFiles}/channel.txt | while read line   #filename 为需要读取的文件名,也可以放在命令行参数里。
	do
	    #echo $line

	    OLD_IFS="$IFS"
	    IFS="#"
	    arr=($line)
	    IFS="$OLD_IFS"
	    #echo ${arr[0]}
	    #echo ${arr[1]}
	    outFile=${outFiles}/${appName}-${arr[1]}-${buildType}-v${versionName}-${versionCode}-${buildTime}.apk

	    java -jar ${supportDir}/walle-cli-all.jar put -c ${arr[0]} ${configFiles}/${signedApp} ${outFile}
	    #echo ${outFile}
	    #outs[1]=${outFile}
	    echo "渠道包-->"${outFile}"--生成完毕"
	    check=`java -jar ./support/walle-cli-all.jar show -c  ${outFile}`
	    IFS=' : ' read -r -a arrCheck <<< "$check"  

		if [[ ${arrCheck[1]} == ${arr[0]} ]]; then
		  	echo ${arr[1]}"--检测渠道号正常-->"${arrCheck[1]}
		else
			echo ${arr[1]}"--检测渠道包错误-->"${arrCheck[1]}
		fi

	done
}

build_channel


