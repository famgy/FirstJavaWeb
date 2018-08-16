$(document).ready(function () {
    var init_up = {
        FilesAdded: function (up, files) {
            up.start();
        },
        UploadProgress: function(up, file){
            if (file.percent != 100 ){
                enterprise.openPop($('#upload-box'));
                $('.js-find-box').html(file.percent+'%');
            } else {
                enterprise.closePop($('#upload-box'));

            }
        },
        FileUploaded: function(up, file, info) {
            var response = $.parseJSON(info.response);
            var msgs=response[0];
            if (msgs.success == 1){
                location.href = msgs.redirect_url;
            }else{
                enterprise.showFntext2_error(msgs,3000);
                enterprise.countDown(3);
            }
        },
        Error: function(up, error) {
            switch(error.code) {
                case plupload.INIT_ERROR:
                    enterprise.showFntext2_error(enterprise.PLUPLOAD_ERROR_MESSAGES['INIT_ERROR']);
                    break;
                case plupload.HTTP_ERROR:
                    enterprise.showFntext2_error(enterprise.PLUPLOAD_ERROR_MESSAGES['HTTP_ERROR']);
                    enterprise.countDown(3);
                    break;
                case plupload.FILE_SIZE_ERROR:
                    enterprise.showFntext2_error('文件大于300MB,请压缩后再上传');
                    break;
                case plupload.FILE_EXTENSION_ERROR:
                    enterprise.showFntext2_error('格式错误');
                    break;
                default:
                    enterprise.showFntext2_error(enterprise.PLUPLOAD_ERROR_MESSAGES['DEFAULT']);
            }
        },
    }

    var uploader = enterprise.uploader({
        url: G_URLS.upload,
        browse_button: 'browse',
        init: init_up
    });

    uploader.init();
});