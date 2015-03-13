# Beacon-Notification-iOS
演示如何使用Beacon来Schedule一个消息。

步骤:

1. 首先使用配置工具配置相关的Beacon配置信息如下

```
{
"beacon":true,
"id":"23A01AF0-232A-4518-9C0E-323FB773F5EF",
"mj":"0x8888",
"mi":"0x8888",
"tx":6,
"ai":4,
}
```

您也可以通过配置工具的扫描如下二维码配置(或将项目中的二维码保存到相册获取二维码)

 ![image](https://raw.githubusercontent.com/Sensoro/Beacon-Notification-iOS/master/Resources/Notification.JPG)
 

如果您身边没有Beacon，您也可以在手机上装一个模拟云子的App

下载链接：http://fir.im/wpko

2. 打开App，进入后台
3. 离开Beacon的区域，会有离场消息弹出（谢谢光临Sensoro）
4. 停留大概1分钟左右，然后进入到Beacon区域，会有进场消息弹出(欢迎进入Sensoro)。


注意事项：

1. 同一个应用最多只能检测20个不同的本地通知，即拥有不同 identifier 的本地通知
2. 测试机的系统要求 8.0 以上，iPhone 4s 及以上, iPad 2 及以上,Ipod 5 及以上
3. 注意检测有没有打开蓝牙
4. 长时间得不到消息，请重启下手机


