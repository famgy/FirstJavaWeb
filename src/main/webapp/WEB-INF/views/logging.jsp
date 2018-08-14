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
    <title>Document</title>
    <link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand mb-0 h1" href="#">
        <img src="/images/brands/fbrand.svg" width="30" height="30" alt="">
    </a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/workstation">Home</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/logging">Logging</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/document">Document</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <H1 style="margin: 10px">Welcome to logging</H1><br/>
</div>

<div class="container">
    <pre>${loggingbuffer}</pre>
</div>
</body>
</html>
