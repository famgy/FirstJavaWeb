<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%--<link href="webjars/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="webjars/bootstrap-glyphicons/bdd2cbfba0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <link href="webjars/jquery-file-upload/9.10.1/css/jquery.fileupload.css" rel="stylesheet">
    <link href="webjars/jquery-file-upload/9.10.1/css/jquery.fileupload-ui.css" rel="stylesheet">
    <%--<link href="webjars/perfect-scrollbar/0.8.1/css/perfect-scrollbar.css" rel="stylesheet">--%>
    <link href="/css/style.css" type="text/css" rel="stylesheet"/>
    <link  href="/css/application_list.css" rel="stylesheet" type="text/css"/>
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

</div>
<div class="pop"></div>
<div class="pop-cont project-form" id="upload-box" >
    <h2>
        <span>上传应用</span>
    </h2>
    <div class="form-horizontal progress-wrap">
        <span class="find-box js-find-box">11%</span>
        <span class="upload-img"></span>

        <p class="upload-text">正在上传，请稍后...</p>
    </div>
</div>

<div class="container">
    <span class="btn btn-success fileinput-button"  id="browse" href="javascript:;">
        <i class="glyphicon glyphicon-plus"></i>
        <span>Select files...</span>
    </span>
</div>

<div class="container">
    <table class="table table-hover">
        <caption>List of android-packaged-apks</caption>
        <thead class="thead-light">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Size(Byte)</th>
            <th scope="col" colspan="2" style="text-align: center" width="5%">Action</th>
        </tr>
        </thead>

        <c:choose>
            <c:when test="${pfiles!='[]'}">
                <c:forEach items="${pfiles}" var="pfile" varStatus="status">
                    <tr>
                        <th scope="row">${status.count}</th>
                        <td>${pfile.name}</td>
                        <td>${pfile.size}</td>
                        <td style="text-align: center"><a class="glyphicon glyphicon-download-alt" href="/download?filename=${pfile.name}"></a></td>
                        <td style="text-align: center"><a class="glyphicon glyphicon-trash" href="/delete?filename=${pfile.name}"></a></td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>

    </table>
</div>

<script src="webjars/jquery/3.0.0/jquery.min.js"></script>
<%--<script src="webjars/jquery-ui/1.9.0/development-bundle/ui/jquery.ui.widget.js"></script>--%>
<%--<script src="webjars/jquery-file-upload/9.10.1/js/jquery.fileupload.js"></script>--%>
<%--<script src="webjars/jquery-file-upload/9.10.1/js/jquery.iframe-transport.js"></script>--%>
<script src="webjars/plupload/3.1.2/js/plupload.full.min.js"></script>
<script src="/js/enterprise.js"></script>
<script src="/js/application.js"></script>
<script>
    var G_URLS={
        'deletes':"/upload",
        'upload':"/upload",
        'bulk_upload':"/upload"
    };
</script>

</body>
</html>


