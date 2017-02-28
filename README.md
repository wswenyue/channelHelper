# channelHelper
###基于[walle](https://github.com/Meituan-Dianping/walle)工具的多渠道打包脚本

###使用本脚本需要注意：
- 按照config.sh文件中的注释改成自己项目配置
- 替换要写入渠道的包，一般是你打好的release包。这个apk要放到当前目录下覆盖signedapp.apk就可以
- 替换使用360加固过，未签名的包【不要使用360的签名工具签名】。这个apk要放在360目录下覆盖jiagu.apk就好
- 替换签名文件，这个文件要放在support目录下，覆盖signKey.jks就好
- 各种渠道的定义是在channel.txt这个文件中，格式为：渠道号#渠道名称。这个需要你根据项目情况修改。

### 使用方法
> 打普通渠道包

```bash
$ cd channelHelpe/
$ sh ./channelBuilder.sh
```
> 打360渠道包

```bash
$ cd channelHelper/360/
$ sh ./channelFor360.sh
```

### Support
如遇到walle错误请参考https://github.com/Meituan-Dianping/walle 
