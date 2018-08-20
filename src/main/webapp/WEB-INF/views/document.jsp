<%--
  Created by IntelliJ IDEA.
  User: famgy
  Date: 8/15/18
  Time: 1:30 AM
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
        <img src="./images/brands/fbrand.svg" width="30" height="30" alt="">
    </a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="./workstation">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./logging">Logging</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="./document">Document</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <h1 style="margin: 10px">Welcome to document</h1><br/>
</div>

<div class="container">
    <h2>安全加固</h2>
    <p>
        APK包加固，可快速集成防静态工具分析、DEX函数加密、SO文件加壳、内存保护、反调试、防二次打包等多项安全功能。 支持对金融、手游、电商、社交等多个行业的应用做加固保护，避免核心代码被反编译， 请求协议被伪造，APK包被植入恶意代码等诸多安全问题。
    </p>
    <dl>
        <dt>1.如何对APP进行签名？</dt>
        <dd>Android APP签名后才可以正常安装到手机上，可以使用Java自带的签名工具jarsigner对目标<br/>
            APP进行签名,命令如下:<br/>
            jarsigner -digestalg SHA1 -sigalg MD5withRSA -verbose -keystore &lt;签名证书路径&gt; -storepass<br/> &lt;签名证书passphrase&gt;
            -keypass &lt;签名证书passphrase&gt; -signedjar &lt;签名后的文件路径&gt; &lt;目标文件&gt; &lt;别名&gt;
        </dd>
        <dt>2.如何查看签名是否成功？</dt>
        <dd>
            Windows平台： 查看APP签名是否成功，可以通过解压缩签名后的包，然后查看目录<br/>
            META-INF下面是否存在以.RSA, .DSA结束的文件&gt;<br/>
            Linux平台： 使用Android平台开发工具appt,执行如下命令：<br/>
            aapt l &lt;包名&gt; | grep "META"
        </dd>
        <dt>3.上传应用提示网络错误?</dt>
        <dd>
            上传应用提示网络错误，请检查浏览器的Adobe flash player插件是否安装。如果没有
            安装，请安装后重启浏览器。 或者为了支持更好的用户体验，您可以使用firefox或者chrome浏览器。
        </dd>
        <dt>4.上传的应用提示不能加固</dt>
        <dd>
            上传的应用当检查不存在签名或者存在第三方厂商加固时，无法进行加固。
        </dd>
    </dl>
</div>

</body>
</html>
