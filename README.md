# cordova-plugin-wecom
cordova wecom  企业微信分享 



### 1.安装命令

```
cordova plugin add https://github.com/lounai-chen/cordova-plugin-wecom  --variable APPID=123xxxxxx --variable AGENTID=456xxxxxx --variable SCHEMA=789xxxxxx --save 


 
``` 

### 2.使用方法


``` 
WecomPlugin.share_txt('hello world',function(s){ },function(e){alert('error: '+e)})
```
 
  






### **安卓配置**

 

*1. 如果编译有报错 Manifest merger failed with multiple errors, see logs. 需要您手动修改 AndroidManifest 对应的代码*

```
xmlns:tools="http://schemas.android.com/tools"

<application   tools:replace="android:allowBackup"    />

 
```

 


### **ios配置**

1.不支持模拟器调试 

2.AliyunQueenUIKit.framework,MNN.framework 设置为 Do Not Embed,  其他的framework设置为 Embed & Sign 

3.插件的文件夹添加成功,但xcode编译没加载进来,因此需要手动先删除再添加 




##### *注意:多语言配置，资源图片,不知道怎么在插件的plugin.xml文件设置.因此需要您需手动拷贝到对应目录* 
 




参考链接 

企业微信开发者中心-官网文档:   https://developer.work.weixin.qq.com/document/path/91196 
  

