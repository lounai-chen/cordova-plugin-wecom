var exec = require('cordova/exec');

 
exports.share_txt = function (txt, success, error) { 
        exec(success, error, 'WecomPlugin', 'share_txt', [txt]);    
};


exports.share_image = function (path,img_name,img_type, success, error) { 
    exec(success, error, 'WecomPlugin', 'share_image', [path,img_name,img_type]);    
};


exports.share_file = function (path,file_name,file_type, success, error) { 
    exec(success, error, 'WecomPlugin', 'share_file', [path,file_name,file_type]);    
};

exports.share_video = function (path, video_name,video_type, success, error) { 
    exec(success, error, 'WecomPlugin', 'share_video', [path,video_name,video_type]);    
};

exports.share_link = function (thumbUrl, webpageUrl,title,description,thumb_img_type, success, error) { 
    exec(success, error, 'WecomPlugin', 'share_link', [thumbUrl, webpageUrl,title,description,thumb_img_type]);    
};

// exports.share_miniProgram = function (username, description,path,title, success, error) { 
//     exec(success, error, 'WecomPlugin', 'share_miniProgram', [username, description,path,title]);    
// };