var exec = require('cordova/exec');

 
exports.share_txt = function (txt, success, error) { 
        exec(success, error, 'WecomPlugin', 'share_txt', [txt]);    
};

exports.share_image = function (path,img_name, success, error) { 
    exec(success, error, 'WecomPlugin', 'share_image', [path,img_name]);    
};


exports.share_file = function (path,file_name, success, error) { 
    exec(success, error, 'WecomPlugin', 'share_file', [path,file_name]);    
};

exports.share_video = function (path, video_name, success, error) { 
    exec(success, error, 'WecomPlugin', 'share_video', [path,video_name]);    
};

exports.share_link = function (thumbUrl, webpageUrl,title,description, success, error) { 
    exec(success, error, 'WecomPlugin', 'share_link', [thumbUrl, webpageUrl,title,description]);    
};

// exports.share_miniProgram = function (username, description,path,title, success, error) { 
//     exec(success, error, 'WecomPlugin', 'share_miniProgram', [username, description,path,title]);    
// };