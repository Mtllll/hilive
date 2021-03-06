<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/19
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport"
          content="width=device-width,user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/uikit/css/uikit.almost-flat.css" rel="stylesheet">
    <%@include file="common/js_css_header.jsp"%>

    <style>
        .myInfo {
            background-color: #F4F5F5;
        }

        input::-webkit-input-placeholder { /* WebKit browsers */
        font-size:15px;
        color: #007FFF;
        }
        .file-box {
            display: inline-block;
            position: relative;
            padding: 3px 5px;
            overflow: hidden;
            color: white;
            background-color: #007FFF;
        }

        .file-btn {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 20px;
            left: 0;
            outline: none;
            background-color: red;
            filter: alpha(opacity=0);
            -moz-opacity: 0;
            -khtml-opacity: 0;
            opacity: 0;
        }


        .personalDate .app-edit{
            border: 0;
            border-radius: 0;
        }
    </style>
</head>
<body class="myInfo">
<%@include file="common/header.jsp" %>
<div class="personalDate">

    <!--个人资料-->
    <div class="uk-grid uk-container uk-container-center ">
        <div class="uk-width-medium-3-5 ">
            <div class="uk-panel uk-panel-box uk-panel-box-secondary app-edit">
                <div class="uk-text-bold uk-margin-bottom uk-margin-large-top" style="font-size: 22px;font-family:YouYuan ">个人资料编辑</div>
                <div style="border-bottom: 1px solid #F1F1F1"></div>
                <form action="${pageContext.request.contextPath}/do_edit_personalInfo" method="post"
                      enctype="multipart/form-data">
                    <%--头像--%>
                    <div class="uk-grid  uk-margin-large-top uk-margin-bottom">
                        <div class="uk-width-medium-1-10">
                            <div class=" uk-text-bold" style="color:#007FFF">头像</div>
                        </div>
                        <div class="uk-width-medium-5-10">
                            <div class="file-box">
                                <input type="file" name="avatar2" class="file-btn"/>
                                上传文件
                            </div>
                        </div>
                    </div>
                    <%--昵称--%>
                    <div style="border-bottom: 1px solid #F1F1F1"></div>
                    <div class="uk-margin-large-top uk-margin-bottom">
                        <span class="uk-text-bold uk-margin-large-right" style="color:#007FFF">昵称</span><input
                            class="uk-form-large" type="text" name="nickname" value="${userinfo.nickname}" placeholder="请填写你的昵称"
                            style="outline: none;border: 0" autocomplete="off">
                    </div>
                    <%--性别--%>
                    <div style="border-bottom: 1px solid #F1F1F1"></div>
                    <div class="uk-margin-large-top uk-margin-bottom">
                        <span class="uk-text-bold uk-margin-large-right" style="color:#007FFF">性别</span><input
                            class="uk-form-large" type="text" name="sex" value="${userinfo.sex}" placeholder="请填写你的性别"
                            style="outline: none;border: 0" autocomplete="off">
                    </div>
                        <%--个人简介--%>
                    <div style="border-bottom: 1px solid #F1F1F1"></div>
                    <div class="uk-margin-large-top uk-margin-large-bottom">
                        <span class="uk-text-bold uk-margin-large-right" style="color:#007FFF">介绍</span><input
                            class="uk-form-large" type="text" name="introduce" value="${userinfo.introduce}" placeholder="请填写你的技能"
                            style="outline: none;border: 0" autocomplete="off">
                    </div>
                    <input type="submit" class="uk-button uk-button-large uk-width-1-1 uk-button-success" >
                </form>
            </div>
        </div>
    </div>
</body>
</html>
