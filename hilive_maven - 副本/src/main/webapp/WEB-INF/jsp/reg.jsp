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
    <meta name="viewport"
          content="width=device-width,user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/uikit/css/uikit.almost-flat.css" rel="stylesheet">

    <script>
       window.onload=function () {
//           clearInterval(timer);
           var body=document.getElementById('reg_body');
           var index=0;
           var strArr=['reg2.jpg','log1.jpg'];
          setInterval(function () {
               var str="${pageContext.request.contextPath}/assets/image/"+strArr[index++];
               body.style.backgroundImage='url('+str+')';
               index=index%strArr.length;
           },3000)
       }
        function checkPsd() {
            var submit = $('#submit');
            if ($('#psd').val().length < 5) {
                $('#psdError').html('密码不能少于6位');
                submit.attr("disabled", "0");

            }
            else {
                $('#psdError').html('');
                submit.removeAttr("disabled");
            }
        }
        function checknumber() {
            var submit = $('#submit');
            if ($('#phone_number').val().length != 10) {
                $('#numberError').html('请输入正确的11位手机号码格式');
                submit.attr("disabled", "0");
            }
            else {
                $('#numberError').html('');
                submit.removeAttr("disabled");
            }
        }
        //ajax检查用户名是否存在
        function checkname() {
            var req = new XMLHttpRequest();

            req.open('get', '${pageContext.request.contextPath}/ajaxCheckName/' + $('#username').val(), true);
            req.send();

            req.onload = function () {
                var div = document.getElementById('div');
                var submit = document.getElementById('submit');

                if (req.responseText == 1) {
                    div.innerHTML = '该用户名已经存在';
                    submit.setAttribute("disabled", "0");

                }
                else {
                    div.innerHTML = '';
                    submit.removeAttribute("disabled");
                }
            }
        }
    </script>
    <%@include file="common/js_css_header.jsp"%>
</head>
<body id="reg_body" style=" background-image:url('../../assets/image/log1.jpg');background-size: 100% 100%">
<%@include file="common/header.jsp"%>
<div class="uk-grid uk-grid-collapse">
    <div class="uk-width-medium-3-5">
        <div class="uk-grid">
            <div class="uk-width-medium-1-10">

            </div>
            <div class="uk-text-large uk-panel uk-width-medium-5-10 uk-text-bold uk-text-success" style="margin-top: 110px">
                <div style="">
                    人生必须有一段与大自然契合的阅历，在那天然的契合之中，
                </div>

                人才能剥离庸俗世事的骚扰，从生物世界中观照自己，咀嚼出生命本真的意味
            </div>
        </div>

    </div>
    <div class="uk-width-medium-1-5 uk-margin-large-top" >
        <div class="uk-panel uk-panel-box uk-text-center "style="opacity: 0.8;background-color: white">
            <div class="uk-grid   uk-margin-large-bottom">
                <div class="uk-width-medium-1-3">
                    <div class="uk-text-bold uk-margin-large" style="font-size: 25px">
                        注册
                    </div>
                </div>
                <div class="uk-width-medium-2-3">
                    <a href="${pageContext.request.contextPath}/login1">已有账号？现在去登录</a>
                </div>
            </div>

            <form action="${pageContext.request.contextPath}/do_reg" method="post">

                <div class="uk-form-row uk-margin-bottom">
                    <div class="uk-form-icon">
                        <i class="uk-icon-user" id="dusername"></i>
                        <input class="uk-form-large" type="text" name="username"
                               placeholder="用户名" onblur="checkname()" id="username" style="border: 0;outline:none;width: 100%" autocomplete="off" >
                    </div>
                </div>
                <div id="div" style="color: red">

                </div>
                <div class="uk-form-row uk-margin-bottom">
                <div class="uk-form-icon">
                    <i class="uk-icon-lock"></i>
                    <input class="uk-form-large" autocomplete="off"  type="password" name="password" id="psd" onkeypress="checkPsd()" style="width:100%;border: 0;outline: none" placeholder="密码">
                </div>
                </div>

                <span style="color: red" id="psdError"> </span>
                <div class="uk-form-row uk-margin-large-bottom">
                    <div class="uk-form-icon">
                        <i class="uk-icon-phone"></i>
                    <input class="uk-form-large" autocomplete="off" type="text" name="phonenumber" onkeypress="checknumber()" id="phone_number" placeholder="电话号" style="width: 100%;border: 0;outline: none">
                    </div>
                </div>

                <div id="numberError" style="color: red;">

                </div>
                <div class="uk-form-row">
                    <input class="uk-text-bold uk-width-medium-1-1 uk-button uk-button-large uk-button-success " type="submit" value="立即注册" id="submit">
                </div>

            </form>

        </div>

    </div>

</div>











</body>
</html>
