IOS P2P Sample
===

该项目使用IJKMediaPlayer，演示我们的P2P功能的样例程序

### 功能

- 直播、点播基本功能+P2P
- 直播时移支持
- HLS P2P原生支持
- 防盗播支持

### 开发者中心

开发者中心可帮助您查看一些统计数据。

**地址**: http://devcenter.vbyte.cn  
**测试帐号**: 用户名: test@vbyte.cn，密码: Vb360  

### 编译安装

[IOS SDK][4]托管于第三方平台[CocoaPods][6]上，使用上非常简单，此demo演示集成IOS SDK是如此的简单。

由于apple的开发限制，本demo并不能提供一个编译好的ipa程序，也不能发布一个简单的demo上app store，若想体验IOS的demo请下载编译此项目！

- 将项目clone到本地
```bash
git clone https://github.com/Vbytes/ios-sample.git
```

- 在项目根目录下，执行`pod install`

```bash
cd /path/to/ios-sample
pod install
```
- 打开生成的xcworkspace，使用自己的开发者证书，或者在模拟器上即可编译运行该demo应用

### 扩展链接

* **[IOS SDK][4]**: SDK的开源代码仓库
* **[IOSSample][7]**: 一个使用ijkplayer的简单样例
* **[API Doc][2]**: 更加详细的API文档，其中包含如直播时移的高级功能使用方法

### 技术支持

感谢阅读本篇文档，希望能帮您尽快上手IOS SDK的用法，再次欢迎您使用月光石P2P加速SDK！

*温馨提示*：如果你需要任何帮助，或有任何疑问，请[联系我们](mailto:contact@exatech.cn)。

[1]: http://devcenter.vbyte.cn
[2]: http://docs.vbyte.cn/api/ios/
[4]: https://github.com/Vbytes/VbyteP2PFramework
[6]: http://cocoapods.org/?q=VByteP2P
[7]: https://github.com/Vbytes/ios-sample
