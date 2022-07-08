# cordova-plugin-wecom
cordova wecom  企业微信分享 



### 1.安装命令

```
cordova plugin add https://github.com/lounai-chen/cordova-plugin-wecom  --variable APPID=123xxxxxx --variable AGENTID=456xxxxxx --variable SCHEMA=789xxxxxx --save 

``` 

### 2.使用方法


``` 

1.分享文字
WecomPlugin.share_txt('hello world',function(s){ },function(e){alert('error: '+e)}); 

2.分享图片
WecomPlugin.share_image('path','img_name','img_type',function(s){ },function(e){alert('error: '+e)}); 

3.分享文件
WecomPlugin.share_file('path','file_name','file_type',function(s){ },function(e){alert('error: '+e)}); 

4.分享视频
WecomPlugin.share_video('path', 'video_name','video_type',function(s){ },function(e){alert('error: '+e)}); 
 
5.分享链接
WecomPlugin.share_link('thumbUrl, 'webpageUrl','title','description','thumb_img_type',function(s){ },function(e){alert('error: '+e)}); 




```
 
  






### **安卓配置**

 

*1. 如果编译有报错 Manifest merger failed with multiple errors, see logs. 需要您手动修改 AndroidManifest 对应的代码*

```
xmlns:tools="http://schemas.android.com/tools"

<application   tools:replace="android:allowBackup"    />

 
<queries>
    <package android:name="com.tencent.wework" />   // 指定企业微信包名
</queries>

```

 


### **ios配置**

1.需要您手动修改 AppDelegate.m 

``` 
#import "WWKApi.h" 

@interface AppDelegate () <WWKApiDelegate>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*! @brief 调用这个方法前需要先到管理端进行注册 走管理端的注册方式
     *
     * 在管理端通过注册(可能需要等待审批)，获得schema+corpid+agentid
     * 将获取到的三个参数对应填在这里，并到项目 Target 的 Info 里边注册 URL Types
     *
     * @param appId   第三方App的Schema
     * @param corpId  第三方App所属企业的ID
     * @param agentId 第三方App在企业内部的ID
     */
    [WWKApi registerApp:@"wxworksdktest" corpId:@"wx4bed5325e7819482" agentId:@""];
    return YES;
}

``` 







 
 




##### 参考链接 

企业微信开发者中心-官网文档:   https://developer.work.weixin.qq.com/document/path/91196 
  

