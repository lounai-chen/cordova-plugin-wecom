package  com.plugin.huayu.noahwecomplugin;



import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.os.Build;

import android.support.annotation.RequiresApi;

import com.tencent.wework.api.IWWAPI;
import com.tencent.wework.api.IWWAPIEventHandler;
import com.tencent.wework.api.WWAPIFactory;
import com.tencent.wework.api.model.BaseMessage;
import com.tencent.wework.api.model.WWMediaFile;
import com.tencent.wework.api.model.WWMediaImage;
import com.tencent.wework.api.model.WWMediaLink;
import com.tencent.wework.api.model.WWMediaMiniProgram;
import com.tencent.wework.api.model.WWMediaText;
import com.tencent.wework.api.model.WWMediaVideo;
import com.tencent.wework.api.model.WWSimpleRespMessage;


import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;


public class WecomPlugin extends CordovaPlugin {

  private static  String APPID = "";
	private static  String AGENTID = "";
	private static  String SCHEMA = "";

  private static CallbackContext mCallbackContext;
  IWWAPI iwwapi;
  int stringId;

  @RequiresApi(api = Build.VERSION_CODES.M)
  @Override
  public void initialize(CordovaInterface cordova, CordovaWebView webView) {
    super.initialize(cordova, webView);
    stringId = this.cordova.getContext().getApplicationInfo().labelRes;
    Context context = this.cordova.getActivity().getApplicationContext();
    ApplicationInfo applicationInfo = null;
    try {
      applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(),
        PackageManager.GET_META_DATA);
    } catch (PackageManager.NameNotFoundException e) {
      e.printStackTrace();
    }
    APPID = applicationInfo.metaData.getString("com.plugin.huayu.noahwecomplugin.APPID");
    AGENTID = String.valueOf(applicationInfo.metaData.getInt("com.plugin.huayu.noahwecomplugin.AGENTID"));
    SCHEMA = applicationInfo.metaData.getString("com.plugin.huayu.noahwecomplugin.SCHEMA");

    iwwapi = WWAPIFactory.createWWAPI(this.cordova.getContext());
    iwwapi.registerApp(SCHEMA);
  }


  @RequiresApi(api = Build.VERSION_CODES.M)
  @Override
  public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
    mCallbackContext = callbackContext;    //拿到回调对象并保存

    if (action.equals("share_txt")) {

      String msg = args.getString(0);

      WWMediaText txt = new WWMediaText(msg);
      txt.appPkg = this.cordova.getContext().getPackageName();
      txt.appName = this.cordova.getContext().getString(stringId);
      txt.appId = APPID; //企业唯一标识。创建企业后显示在，我的企业 CorpID字段
      txt.agentId = AGENTID; //应用唯一标识。显示在具体应用下的 AgentId字段
      iwwapi.sendMessage(txt);

      callJS("成功");

      return true;
    }
    else if(action.equals("share_img")) {
      String path = args.getString(0);
      String img_name = args.getString(1);

      WWMediaImage img = new WWMediaImage();
      img.fileName = img_name;
      img.filePath = path;
      img.appPkg = this.cordova.getContext().getPackageName();
      img.appName = this.cordova.getContext().getString(stringId);
      img.appId = APPID; //企业唯一标识。创建企业后显示在，我的企业 CorpID字段
      img.agentId = AGENTID;
      iwwapi.sendMessage(img);

      callJS("成功");
      return true;
    }
    else if(action.equals("share_file")) {
      String path = args.getString(0);
      String file_name = args.getString(1);

      WWMediaFile file = new WWMediaFile();
      file.fileName = file_name;
      file.filePath = path;
      file.appPkg = this.cordova.getContext().getPackageName();
      file.appName = this.cordova.getContext().getString(stringId);
      file.appId = APPID; //企业唯一标识。创建企业后显示在，我的企业 CorpID字段
      file.agentId = AGENTID; //应用唯一标识。显示在具体应用下的 AgentId字段
      iwwapi.sendMessage(file);

      callJS("成功");
      return true;
    }
    else if(action.equals("share_video")) {
      String path = args.getString(0);
      String video_name = args.getString(1);

      WWMediaVideo video = new WWMediaVideo();
      video.fileName = video_name;
      video.filePath = path;
      video.appPkg =  this.cordova.getContext().getPackageName();
      video.appName =  this.cordova.getContext().getString(stringId);
      video.appId = APPID; //企业唯一标识。创建企业后显示在，我的企业 CorpID字段
      video.agentId = AGENTID; //应用唯一标识。显示在具体应用下的 AgentId字段
      iwwapi.sendMessage(video);

      callJS("成功");
      return true;
    }
    else if(action.equals("share_link")) {
      WWMediaLink link = new WWMediaLink();
      link.thumbUrl =  args.getString(0);
      link.webpageUrl = args.getString(1);
      link.title =  args.getString(2);
      link.description =  args.getString(3);
      link.appPkg =  this.cordova.getContext().getPackageName();
      link.appName = this.cordova.getContext().getString(stringId);
      link.appId = APPID; //企业唯一标识。创建企业后显示在，我的企业 CorpID字段
      link.agentId = AGENTID; //应用唯一标识。显示在具体应用下的 AgentId字段
      iwwapi.sendMessage(link);

      callJS("成功");
      return true;
    }
//     else if(action.equals("share_miniProgram")) {
//       String username = args.getString(0);
//       String description = args.getString(1);
//       String path = args.getString(2);
//       String title = args.getString(3);

//       WWMediaMiniProgram miniProgram = new WWMediaMiniProgram();
//       miniProgram.appPkg = this.cordova.getContext().getPackageName();
//       miniProgram.appName = this.cordova.getContext().getString(stringId);
//       miniProgram.appId = APPID; //企业唯一标识。创建企业后显示在，我的企业 CorpID字段
//       miniProgram.agentId = AGENTID; //应用唯一标识。显示在具体应用下的 AgentId字段
//       miniProgram.schema = SCHEMA;

//       miniProgram.username = username;// "gh_dde54cb88ce7@app"; //必须是应用关联的小程序，注意要有@app后缀
//       miniProgram.description = description;
//       miniProgram.path = path;

// //      Bitmap bitmap = ((BitmapDrawable) getDrawable(R.drawable.test)).getBitmap();
// //      ByteArrayOutputStream stream = new ByteArrayOutputStream();
// //      bitmap.compress(Bitmap.CompressFormat.JPEG, 0, stream);
// //      byte[] byteArray = stream.toByteArray();

//      // miniProgram.hdImageData = byteArray;
//       miniProgram.title = title;
//       iwwapi.sendMessage(miniProgram, new IWWAPIEventHandler() {
//         @Override
//         public void handleResp(BaseMessage resp) {
//           if(resp instanceof WWSimpleRespMessage){
//             WWSimpleRespMessage rsp = (WWSimpleRespMessage)resp;
//             //String t = "";
// //            Toast.makeText(MainActivity.this,
// //              t = "发小程序," + rsp.errCode + "," + rsp.errMsg,
// //              Toast.LENGTH_LONG).show();
//           }
//         }
//       });

//     }

      return false;
  }



  public static void callJS(String message) {
    if (mCallbackContext != null) {
      PluginResult dataResult = new PluginResult(PluginResult.Status.OK, message);
      dataResult.setKeepCallback(true);// 非常重要
      mCallbackContext.sendPluginResult(dataResult);
    }
  }









}
