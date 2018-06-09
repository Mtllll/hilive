<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/8
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/uikit/css/uikit.almost-flat.css" rel="stylesheet">
    <%--<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">--%>
    <meta name="viewport"
          content="width=device-width,user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <script>
        window.onload = function () {
            //变换图片
            var picArr=['paobu.jpg','zhangpeng.jpg'];
            var index=1;
            var body=document.getElementById('log_body');
            setInterval(function () {
              var str = "${pageContext.request.contextPath}/assets/image/"+picArr[index++];
                body.style.backgroundImage='url('+str+')';
                index=index%picArr.length;
            },3000);
//验证码
            var img = document.getElementById('img');
            img.onclick = function () {
                var date = new Date();
                img.src = '${pageContext.request.contextPath}/yanzheng?time=' + date.getTime();
            }
        }
    </script>
    <%@include file="common/js_css_header.jsp"%>
</head>
<body id="log_body" style="background-image: url('../../assets/image/paobu.jpg');background-size:100% 100%">
<%@include file="common/header.jsp"%>
<div class="uk-grid uk-grid-collapse">
    <div class="uk-width-medium-3-5" >
        <div class="uk-grid">
            <div class="uk-width-medium-1-10">

            </div>
            <div class="uk-text-large uk-panel uk-width-medium-5-10 uk-text-bold uk-text-danger" style="margin-top: 200px">
                <div style="">
                    在旅行中，不知道为什么，人很容易卸下伪装，没有太多的防备心，变得坦诚，善感。
                </div>
                因此旅行就是上一条Gap，让我们还可以偶尔抽身，不至于生于欲望，死于欲望。

            </div>
        </div>
    </div>
    <div class="uk-width-medium-1-5 uk-margin-large-top" >
        <div class="uk-panel uk-panel-box uk-text-center" style="background-color: white;opacity: 0.8">
            <div class="uk-grid uk-margin-large-bottom">
                <span class="uk-width-medium-1-3">
                    <div class="uk-text-bold" style="font-size: 25px">登录</div>
                </span>
                <div class="uk-width-medium-2-3">
                <a href="${pageContext.request.contextPath}/reg">还没有账号？现在去注册</a>
                </div>
            </div>
            <div style="color: red">${error}</div>
            <form method="post" action="${pageContext.request.contextPath}/login">
                <div class="uk-form-row uk-margin-bottom">
                    <div class="uk-form-icon">
                        <i class="uk-icon-user"></i>
                        <input type="text" name="username" class="uk-form-large" placeholder="用户名" style="width:100%;border:0;outline: none">
                    </div>
                </div>
                <input type="hidden" name="preUrl" value="${preUrl}">


                <div class="uk-form-row uk-margin-bottom">
                    <div class="uk-form-icon">
                        <i class="uk-icon-lock"></i>
                        <input type="password" name="password" class="uk-form-large" placeholder="密码" style="width:100%;border:0;outline: none">
                    </div>
                </div>

                <div class="uk-form-row">

                    <div class="uk-form-icon">
                        <i class="uk-icon-flag-checkered"></i>
                        <input type="text" name="yyy" placeholder="验证码" class=" uk-form-large"style="width:100%;border:0;outline: none">
                    </div>
                </div>
                <div class="uk-margin-bottom uk-width-2-3"><img src="yanzheng" id="img" style="opacity: 0.8"></div>
                <div class="uk-form-row">
                    <input type="submit" value="确认登录" class="uk-button-large uk-button uk-button-danger uk-width-1-1 uk-text-bold">
                </div>
                <div style="color:red">${reult}</div>
            </form>
        </div>

    </div>

</div>
</body>
</html>
