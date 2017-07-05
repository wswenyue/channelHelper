#!/bin/bash
# Author: wswenyue.
#Date & Time: 2017-02-27 10:58:07
#Description: for this config

export appName=HelloApp	#App name
export buildType=release #构建类型 
export versionName=2.0.1 #版本name
export versionCode=201 	#版本编号
export buildTime=$(date +%Y%m%d)


export rootPath=`pwd`
export configFiles=${rootPath}/\in
export outFiles=${rootPath}/out
export supportDir=${rootPath}/support

#签名相关
export signedApp=signedapp.apk	#签名过releaseApp包的文件名
export signFile=${configFiles}/\release.keystore #签名使用的key文件
export signFilePass=123456	#签名文件的密码

############for 360#########
export channel360Num=00360 #360渠道编号
export channel360Name=c360 #360渠道包名称

export out360Files=${outFiles}/360
export jiagu360App=${configFiles}/jiagu.apk
