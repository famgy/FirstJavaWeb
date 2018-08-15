(function(global) {
    var enterprise = enterprise || {};
    enterprise.uploader = function (options, onError, onFilesAdded, onFileUploaded) {
        var uploader = new plupload.Uploader({
            browse_button: options.browse_button,
            url: options.url,
            init: options.init
        });

        return uploader;
    };
    enterprise.openPop = function(cont){
        $(".pop").fadeIn();
        cont.fadeIn();
    };
    enterprise.closePop = function(cont){
        $(".pop").fadeOut();
        cont.fadeOut();
    };
    enterprise.PLUPLOAD_ERROR_MESSAGES = {
        DEFAULT:'发生错误, 请检查后再试',
        INIT_ERROR:'没有找到上传插件，你可能需要安装 <a target="_blank" href="' + enterprise.FLASH_DOWNLOAD_URL + '">Adobe Flash</a>',
        HTTP_ERROR:'网络错误',
        FILE_SIZE_ERROR: '上传文件大于100M',
        FILE_EXTENSTION_ERROR: '文件格式错误',
        REP_APP:'已经上传此版本APP',
        PACKAGE_ERR:'包名不一致'
    };
    enterprise.showFntext2_error = function(text, waiting, callback) {
        $('li#fntext2_delete > span.fntext2_notice_span').html(text);
        $('li#fntext2_delete').show();
        setTimeout(function() {
            $('li#fntext2_delete').fadeOut('slow');
            if (typeof callback === 'function') {
                callback.call();
            }
        }, waiting || 5000);
    };
    enterprise.countDown=function(secs){
        if(--secs>0){
            setTimeout("enterprise.countDown()",1000)
        }else{
            window.location.reload();
        }
    }

    global.enterprise = enterprise;
})(window);