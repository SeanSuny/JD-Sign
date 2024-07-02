# 声明

```text
本镜像为个人使用,请勿随意传播此镜像
```

容器命令

```shell
docker run -d \
    --name=jd_sign \
    -p 17840:8080 \
    -v $PWD/jd_sign:/app/data \
    --restart=always \
    --log-opt max-file=2 \
    --log-opt max-size=50m \
    seansuny/jd-sign:latest
```

接口

```text
http://ip:端口/sign
```

传参方式

Request Body:(application/json)

```json
{
    "fn": "isvObfuscator", // functionId 必填
    "body": "{\"url\":\"https://lzkj-isv.isvjd.com\",\"id\":\"\"}",  // body 必填，可以为JSON字符串或者对象
    "client": "android", // client 非必填 默认android
    "clientVersion": "12.2.2", // clientVersion 非必填 默认12.2.2
    "uuid": "192643cf416a41b3a6299558e7f39d7c", // uuid 非必填 会自动生成
    "ep": true // 是否生成ep参数 非必填
}
```

Response Body:

```json
{
    "body": "functionId=isvObfuscator&body=%7B%22url%22%3A%22https%3A%2F%2Flzkj-isv.isvjd.com%22%2C%22id%22%3A%22%22%7D&ef=1&ep=%7B%22appname%22%3A%22com.jingdong.app.mall%22%2C%22cipher%22%3A%7B%22aid%22%3A%22CJuyDtGzY2Y0CJZrDNPsC2O2Ctu5DJU4ZJdwCzvuD2C%3D%22%2C%22dBrand%22%3A%22WQvrb21f%22%2C%22dModel%22%3A%22UwVubWvBCtLGcw8%3D%22%2C%22openudid%22%3A%22CJuyDtGzY2Y0CJZrDNPsC2O2Ctu5DJU4ZJdwCzvuD2C%3D%22%2C%22osVersion%22%3A%22CJO%3D%22%2C%22screen%22%3A%22CtS5DyenCNqm%22%2C%22uuid%22%3A%22CJuyDtGzY2Y0CJZrDNPsC2O2Ctu5DJU4ZJdwCzvuD2C%3D%22%2C%22wifiBssid%22%3A%22dW5hbw93bq%3D%3D%22%7D%2C%22ciphertype%22%3A5%2C%22hdid%22%3A%22JM9F1ywUPwflvMIpYPok0tt5k9kW4ArJEU3lfLhxBqw%3D%22%2C%22ridx%22%3A1%2C%22ts%22%3A1698575375038%2C%22version%22%3A%221.2.0%22%7D&client=android&clientVersion=12.2.2&uuid=192643cf416a41b3a6299558e7f39d7c&st=1698575374985&sign=c9fff725a9cec3643dd59f3a4d9f54ee&sv=111", // 完整的参数
    "code": 0,
    "fn": "isvObfuscator", // functionId
    "msg": "success",
    "sign": "st=1698575374985&sign=c9fff725a9cec3643dd59f3a4d9f54ee&sv=111", // sign
    "traceId": "4da367b8-c02f-4c27-97ce-79bb7ddf39b5"
}
```

```text
在目录下有一个 `apk` 和 `so` ，环境不改的情况下，可以自行替换APK和SO，**需要64位APK文件**。
`libjdbitmapkit.so` 在安装包 `\lib\arm64-v8a\` 下面， 请注意文件名称请保持示例的，不要修改文件名。
```
