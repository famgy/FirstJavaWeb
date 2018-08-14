<%--
  Created by IntelliJ IDEA.
  User: famgy
  Date: 8/15/18
  Time: 1:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Famgy workstation</title>
    <link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="webjars/bootstrap-glyphicons/bdd2cbfba0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <link href="webjars/jquery-file-upload/9.10.1/css/jquery.fileupload.css" rel="stylesheet">
    <link href="webjars/jquery-file-upload/9.10.1/css/jquery.fileupload-ui.css" rel="stylesheet">

    <script src="webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="webjars/jquery-ui/1.9.0/development-bundle/ui/jquery.ui.widget.js"></script>
    <script src="webjars/jquery-file-upload/9.10.1/js/jquery.fileupload.js"></script>
    <script src="webjars/jquery-file-upload/9.10.1/js/jquery.iframe-transport.js"></script>

    <style>
        .bar {
            height: 18px;
            background: green;
        }
    </style>

    <script>
        $(document).ready(function () {
            $('#fileupload').fileupload({
                dataType: 'json',
                add: function (e, data) {
                    data.context = $('<p/>').text('Uploading...').appendTo(document.body);
                    data.submit();
                },
                done: function (e, data) {
                    $.each(data.result.files, function (index, file) {
                        $('<p/>').text(file.name).appendTo(document.body);
                    });
                    data.context.text('Upload finished.');
                },
                progressall: function (e,data) {
                    var progress = parseInt(data.loaded / data.total * 100, 10);
                    $('#progress .bar').css(
                        'width',
                        progress + '%'
                    );
                }
            });
        });
    </script>
</head>
<body>
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand mb-0 h1" href="#">
        <img src="/images/brands/fbrand.svg" width="30" height="30" alt="">
    </a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/workstation">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logging">Logging</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/document">Document</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="/search" method="post">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="apkname">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>

    </div>
</nav>

<div class="container">
    <H1 style="margin: 10px">Welcome to workstation</H1><br/>
</div>

<div class="container">
    <form id="fileupload" action="upload" method="POST" enctype="multipart/form-data">
        上传文件：
        <span class="btn btn-success fileinput-button">
                <i class="glyphicon glyphicon-plus"></i>
                <span>Select files...</span>
                <input type="file" name="files[]" multiple>
            </span>
    </form>
    <div id="progress">
        <div class="bar" style="width: 0%;"></div>
    </div>
</div>

<div class="container">
    <table class="table table-hover">
        <caption>List of android-packaged-apks</caption>
        <thead class="thead-light">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Size(Byte)</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pfiles}" var="pfile" varStatus="status">
            <tr>
                <th scope="row">${status.count}</th>
                <td>${pfile.name}</td>
                <td>${pfile.size}</td>
                <td><a href="/download?filename=${pfile.name}">Download</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
