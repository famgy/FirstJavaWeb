<%--
  Created by IntelliJ IDEA.
  User: famgy
  Date: 8/15/18
  Time: 12:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>my-first-javaweb</title>
  <link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">

  <style>
    #login {
      text-align: center;
      max-width: 300px;
      margin: 35px auto;
    }
    #login input{
      margin: 10px 0;
    }
    #submit{
      padding:0px 20px;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/index.jsp">
    <img src="/images/brands/fbrand.svg" width="30" height="30" alt="">
  </a>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link disabled">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled">Logging</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled">Document</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container" id="login">
  <form method="post" action="/login" accept-charset="utf-8">
    <div class="input-prepend">
      <span class="add-on"><img src="/images/login/user-solid.svg" width="25" height="25"></span>
      <input id="username" type="text" name="user" required="required" placeholder="Username">
    </div>

    <div class="input-prepend">
      <span class="add-on"><img src="/images/login/lock-solid.svg" width="25" height="25"></span>
      <input type="password" name="password" required="required" placeholder="Password" >
    </div>

    <div class="control-group" id="submit">
      <input class="btn btn-block" type="submit" value="Sign in">
    </div>
  </form>
</div>
<script>
    document.getElementById("username").focus();
</script>
</body>
</html>
