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

2. 离开Beacon的区域，并等一段时间，1分钟左右，（在配置工具里看不到了）
3. 打开App，进入后台
4. 进入到Beacon区域，会有消息弹出。





