/********* WecomPlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
 


@interface WecomPlugin : CDVPlugin {
  // Member variables go here.
     
   
}
 

- (void)share_txt:(CDVInvokedUrlCommand*)command;
- (void)share_img:(CDVInvokedUrlCommand*)command;
- (void)share_file:(CDVInvokedUrlCommand*)command;
 
- (void)share_video:(CDVInvokedUrlCommand*)command;
- (void)share_link:(CDVInvokedUrlCommand*)command;
//- (void)share_miniProgram:(CDVInvokedUrlCommand*)command;
 


@end

@implementation WecomPlugin


static NSString* myAsyncCallBackId = nil;
 

- (void)pluginInitialize {
 
}

- (void)init:(CDVInvokedUrlCommand*)command
{
    
    
    NSString* push_url =  [command.arguments objectAtIndex:0];
        NSString* orientation =  [command.arguments objectAtIndex:1];
 
        
    
}

- (void)start:(CDVInvokedUrlCommand*)command
{
    NSString *msg =@"-10|推流未知错误";
    if([self.publisherVC start] != 0){
        msg = @"102|开启推流";
    }
    [self sendCmd: msg];
    
}

- (void)stop:(CDVInvokedUrlCommand*)command
{
    [self.publisherVC stop];
    
}

//开启预览
- (void)preview:(CDVInvokedUrlCommand*)command
{
    [self.publisherVC  startPreviewPlugin];
}

//停止预览
- (void)StopPreview:(CDVInvokedUrlCommand *) command{
    [self.publisherVC  StopPreviewPlugin];
}


- (void)Pause:(CDVInvokedUrlCommand *)command 
{
    [self.publisherVC  pausePushPlugin];
}


- (void)ResumeAsync:(CDVInvokedUrlCommand *) command
{
    [self.publisherVC  resumePushPlugin];
}


- (void)RestartPushAync:(CDVInvokedUrlCommand *) command
{
    [self.publisherVC  restartPushPlugin];
}

- (void)CameraDirection:(CDVInvokedUrlCommand*)command{
    [self.publisherVC CameraDirection];
}

- (void)LiveFlash:(CDVInvokedUrlCommand*)command{
    [self.publisherVC LiveFlash];
}


-  (void)  sendCmd : (NSString *)msg
{
    if(myAsyncCallBackId != nil)
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: msg ];
        //将 CDVPluginResult.keepCallback 设置为 true ,则不会销毁callback
        [pluginResult  setKeepCallbackAsBool:YES];
        [selfplugin.commandDelegate sendPluginResult:pluginResult callbackId: myAsyncCallBackId];

    }
}


@end
