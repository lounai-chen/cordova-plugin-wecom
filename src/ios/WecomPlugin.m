/********* WecomPlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "WWKApi.h"

 

@interface WecomPlugin : CDVPlugin {
  // Member variables go here.
     
     CDVPluginResult* pluginResult;
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

- (void)share_txt:(CDVInvokedUrlCommand*)command
{
    myAsyncCallBackId = command.callbackId;

    NSString* txt =  [command.arguments objectAtIndex:0];
  
    WWKSendMessageReq *req = [[WWKSendMessageReq alloc] init];
    WWKMessageTextAttachment *attachment = [[WWKMessageTextAttachment alloc] init];
    attachment.text = txt;
    req.attachment = attachment;
    [WWKApi sendReq:req];
 
    //返回结果
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: @"success"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}

- (void)share_image:(CDVInvokedUrlCommand*)command
{
    myAsyncCallBackId = command.callbackId;

    NSString* path =  [command.arguments objectAtIndex:0];
    NSString* filename =  [command.arguments objectAtIndex:1];
    NSString* filetype =  [command.arguments objectAtIndex:2];

    WWKSendMessageReq *req = [[WWKSendMessageReq alloc] init];
    WWKMessageImageAttachment *attachment = [[WWKMessageImageAttachment alloc] init];
    attachment.filename = filename;
    attachment.path = [[NSBundle mainBundle] pathForResource:path ofType:filetype];
    req.attachment = attachment;
    [WWKApi sendReq:req];
 
    //返回结果
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: @"success"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}

- (void)share_file:(CDVInvokedUrlCommand*)command
{
   myAsyncCallBackId = command.callbackId;

    NSString* path =  [command.arguments objectAtIndex:0];
    NSString* filename =  [command.arguments objectAtIndex:1];
    NSString* filetype =  [command.arguments objectAtIndex:2];

    WWKSendMessageReq *req = [[WWKSendMessageReq alloc] init];
    WWKMessageFileAttachment *attachment = [[WWKMessageFileAttachment alloc] init];
    attachment.filename = filename;
    attachment.path = [[NSBundle mainBundle] pathForResource:path ofType:filetype];
    req.attachment = attachment;
    [WWKApi sendReq:req];
 
    //返回结果
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: @"success"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}

- (void)share_video:(CDVInvokedUrlCommand*)command
{
    myAsyncCallBackId = command.callbackId;

    NSString* path =  [command.arguments objectAtIndex:0];
    NSString* filename =  [command.arguments objectAtIndex:1];
    NSString* filetype =  [command.arguments objectAtIndex:2];

    WWKSendMessageReq *req = [[WWKSendMessageReq alloc] init];
    WWKMessageVideoAttachment *attachment = [[WWKMessageVideoAttachment alloc] init];
    attachment.filename = filename;
    attachment.path = [[NSBundle mainBundle] pathForResource:path ofType:filetype];
    req.attachment = attachment;
    [WWKApi sendReq:req];
 
    //返回结果
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: @"success"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}

- (void)share_link:(CDVInvokedUrlCommand*)command
{
    myAsyncCallBackId = command.callbackId;

    NSString* thumbUrl =  [command.arguments objectAtIndex:0];
    NSString* webpageUrl =  [command.arguments objectAtIndex:1];
    NSString* title =  [command.arguments objectAtIndex:2];
    NSString* description =  [command.arguments objectAtIndex:3];
    NSString* thumb_img_type =  [command.arguments objectAtIndex:4];

    WWKSendMessageReq *req = [[WWKSendMessageReq alloc] init];
    WWKMessageLinkAttachment *attachment = [[WWKMessageLinkAttachment alloc] init];
    attachment.title = title;
    attachment.summary = description;
    attachment.url = webpageUrl;
    attachment.icon = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:thumbUrl ofType:thumb_img_type]];
    req.attachment = attachment;
    [WWKApi sendReq:req];
 
 
    //返回结果
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: @"success"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
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
