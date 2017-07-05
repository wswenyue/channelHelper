# channelHelper V2.0
### 基于[walle](https://github.com/Meituan-Dianping/walle)工具的多渠道打包脚本

### 使用本脚本需要注意：
- 只需要关心 `in` 文件下的配置
- `channel.txt` 是渠道编号对应的配置文件，请根据自己需求配置
- `config.sh` 是主要的配置文件，具体请根据相关注释修改
- `jiagu.apk` 是用360加固宝加固过的apk，未签名
- `release.keystore` 是使用的签名key文件
- `signedapp.apk` 是生成的签名过的app包文件

### 使用方法
> 打普通渠道包

```bash
$ cd channelHelper/
$ sh ./builder.sh 
```

> 只打360渠道包

```bash
$ cd channelHelper/
$ sh ./builder.sh 360
```

> 打所有渠道（包括360）

```bash
$ cd channelHelper/
$ sh ./builder.sh all
```

> 清空输出文件夹

```bash
$ cd channelHelper/
$ sh ./builder.sh clean
```

> 查看帮助

```bash
$ cd channelHelper/
$ sh ./builder.sh help
```

### 注意该工具是直接可以跑通的。不需要任何处理

### Support
欢迎各位给我提供使用意见
如遇到walle错误请参考https://github.com/Meituan-Dianping/walle 
