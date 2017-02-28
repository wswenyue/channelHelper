#!/bin/bash
# Author: wswenyue.
#Date & Time: 2017-02-27 10:58:07
#Description: for this config

export appName=appName
#要写入渠道的包，一般是你打好的release包。这个apk要放到当前目录下覆盖signedapp.apk就可以
export signedApp=signedapp.apk

#使用360加固过，未签名的包【不要使用360的签名工具签名】。这个apk要放在360目录下覆盖jiagu.apk就好
export jiagu360App=jiagu.apk

#签名文件，这个文件要放在support目录下，覆盖signKey.jks就好
export signFile=signKey.jks
#签名文件的密码
export signFilePass=keyPass

export buildType=release
export versionName=0.1.2.0
export versionCode=120
export buildTime=$(date +%Y%m%d)

############for 360#########
export channel360Num=005
export channel360Name=C360
