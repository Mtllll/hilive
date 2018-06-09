<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/8
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport"
          content="width=device-width,user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="${pageContext.request.contextPath}/assets/uikit/css/uikit.almost-flat.css" rel="stylesheet">
    <title>Title</title>
    <%@include file="common/js_css_header.jsp"%>
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.4.min.js"></script>
    <style>
        .myHomePage_body{
            background-color: #F4F5F5;
        }

        .myHomePage .dis {
            height: 20px;
        }

        .myHomePage a {
            font-size: 16px;
        }

        .myHomePage .personelPic {
            height: 90px;
            width: 90px;
            border-radius: 100%;
        }

        .myHomePage .personelInfo .jobAndAmbition {
            text-decoration: none;
            color: #4A68AD;
            font-size: 15px;
        }

        .myHomePage .personelInfo .icon a {
            font-size: 18px;
        }

        .myHomePage .personelInfo .editPersonelInfo {
            color: #3780F7;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #3780F7;
            border-radius: 6px;
            text-decoration: none;
            background-color: white;
            outline:none;
            cursor:pointer;
        }

        .myHomePage .collectionAndTag a {
            border-bottom: 1px solid #EDEDEE;
        }

        .myHomePage .collectionAndTag .uk-panel {
            border-radius: 0;
            border: 0;
        }

        .myHomePage .collectionAndTag .uk-panel:hover {
            background-color: #F4F5F5;
        }

        .myHomePage .fans .uk-panel {
            border: 0;
        }

        .myHomePage .fans .uk-panel:hover {
            background-color: white;
        }

        .myHomePage .TagBar li {
            padding: 20px;
            display: inline-block;

        }

        .myHomePage .TagBar li a {

            text-decoration: none;
            color: black;
        }

        .myHomePage .TagBar {
            background: white;
        }
        .myHomePage .TagBar .first{
            border-bottom: 2px solid #3780F7;
        }
        .myHomePage .TagBar .first a{
            color:#3780F7;
        }

        .addBorderBottom {
            border-bottom: 2px solid #3780F7;
        }

        .myHomePage .uk-panel-box {
            border: 0;
        }
        .myHomePage .content a{
            border-bottom: 1px solid #F2F2F3;
        }
    </style>
    <script>

            $(function () {
                //游记ajax
                $('#article').click(function () {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/ajax_view_article/"+${otheruserinfo.id},
                        type:"get",
                        dataType:"json",
                        success:function (res) {

                            var html=template("trip",res);
                            $('.content').html(html);

                        }
                    })
                })

//                帖子ajax
                $('#post').click(function () {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/viewPersonalPost/${otheruserinfo.id}",
                        type:"get",
                        dataType:"json",
                        success:function (res) {
                            var html=template("postList",res);
                            $('.content').html(html);
                        }

                    })
                })
                $('#post').trigger('click');
                //收藏ajax
                $('#collection').click(function () {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/ajax_collection_article/"+${otheruserinfo.id},
                        type:"get",
                        dataType:"json",
                        success:function (res) {

                            var html=template('collection_article',res);
                            $('.content').html(html);
                        }
                    })
                });
                //关注ajax
                $('#follow2').click(function () {
                    $.ajax({

                        url:"${pageContext.request.contextPath}/ajax_follow/"+${otheruserinfo.id},
                        type:"get",
                        dataType:"json",
                        success:function (res) {

                            var html=template('follow_list',res);
                            $('.content').html(html);
                        }
                    })
                });
                //粉丝ajax
                $('#fans').click(function () {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/ajax_fans/"+${otheruserinfo.id},
                        type:"get",
                        dataType:"json",
                        success:function (res) {

                            var html=template('fans_list',res);
                            $('.content').html(html);
                        }
                    })
                });

                //             选项卡处
                var TagBarLis = document.getElementById('TagBar').getElementsByTagName('li');
                var TagBarAs = document.getElementById('TagBar').getElementsByTagName('a');
                for (var i = 0; i < TagBarLis.length; i++) {
                    TagBarLis[i].onclick = function (ev2) {
                        for (var i = 0; i < TagBarAs.length; i++) {
                            TagBarAs[i].style.color = 'black';
                        }
                        for (var i = 0; i < TagBarLis.length; i++) {
                            TagBarLis[i].className = '';
                        }
                        this.getElementsByTagName('a')[0].style.color = '#3780F7';
                        this.className = 'addBorderBottom';
                    }
                }
                $('#follow').click(function () {
                    if(${userinfo==null})
                    {
                        top.location="${pageContext.request.contextPath}/login1";
                    }
                    else {
                        if(this.value=="关注")
                        {
                            $.ajax({
                                url:"${pageContext.request.contextPath}/follow/${otheruserinfo.id}",
                                type:"get",
                                dataType:"json",
                                success:function (res) {

                                }
                            })
                            $(this).val("取消关注");
                        }
                        else
                        {
                            $.ajax({
                                url:"${pageContext.request.contextPath}/noFollow/${otheruserinfo.id}",
                                type:"get",
                                dataType:"json",
                                success:function (res) {

                                }
                            })
                            $(this).val("关注");
                        }
                    }
                })
            })
    </script>
</head>
<body class="myHomePage_body">
<%@include file="common/header.jsp"%>
<%--//游记模板--%>
<script type="text/html" id="trip">
    {{each}}
    <a href="${pageContext.request.contextPath}/details/{{$value.id}}" class=" uk-panel-box-secondary uk-panel-box uk-panel ">
        <div class="uk-panel-hover uk-panel uk-panel-box  uk-text-bold">{{$value.title}}</div>
    </a>
    {{/each}}

</script>
<%--帖子模板--%>
<script type="text/html" id="postList">
    {{each}}
    <a href="${pageContext.request.contextPath}/viewPost/{{$value.id}}" class=" uk-panel-box-secondary uk-panel-box uk-panel ">
        <div class="uk-panel-hover uk-panel uk-panel-box  uk-text-bold">{{$value.title}}</div>
    </a>
    {{/each}}
</script>
<%--收藏模板--%>
<script type="text/html" id="collection_article">
    {{each}}
    <a href="${pageContext.request.contextPath}/details/{{$value.id}}" class=" uk-panel-box-secondary uk-panel-box uk-panel ">
        <div class="uk-panel-hover uk-panel uk-panel-box  uk-text-bold">{{$value.title}}</div>
    </a>
    {{/each}}
</script>
<%--关注模板--%>
<script type="text/html" id="follow_list">
    {{each}}
    <a href="${pageContext.request.contextPath}/otheruser/{{$value.id}}" class=" uk-panel-box-secondary uk-panel-box uk-panel ">
        <div class="uk-panel-hover uk-panel uk-panel-box  uk-text-bold">{{$value.username}}</div>
    </a>
    {{/each}}
</script>
<%--粉丝模板--%>
<script type="text/html" id="fans_list">
    {{each}}
    <a href="${pageContext.request.contextPath}/otheruser/{{$value.id}}" class=" uk-panel-box-secondary uk-panel-box uk-panel ">
        <div class="uk-panel-hover uk-panel uk-panel-box  uk-text-bold">{{$value.username}}</div>
    </a>
    {{/each}}
</script>
<div class="myHomePage">
    <div class="dis">
    </div>
    <div class="uk-grid uk-container-center uk-container ">
        <div class="uk-width-medium-3-4 ">
            <!--个人信息-->
            <div class="uk-panel uk-panel-box personelInfo uk-panel-box-secondary">
                <div class="uk-grid uk-text-center">
                    <div class="uk-width-medium-1-5">
                        <img src="${pageContext.request.contextPath}/upload/${otheruserinfo.avatar}" class=" personelPic ">
                    </div>
                    <div class="uk-width-medium-3-5">
                            <li class="name uk-text-bold uk-margin-bottom" style="font-size:26px">${otheruserinfo.username}</li>
                    </div>
                    <div class="uk-width-medium-1-5">
                        <div>
                            <%--<a href="" class="editPersonelInfo" id="follow1">关注</a>--%>
                            <input type="button" class="editPersonelInfo" value="${strFollow}" id="follow">
                        </div>
                    </div>
                </div>
            </div>

            <div class="dis">

            </div>
            <div class="uk-grid-collapse">
                <div class="tagBarDiv" >
                    <ul class="TagBar uk-list" id="TagBar" style="margin: 0;border-bottom: 1px solid #F2F2F3">
                        <ul>
                            <li class="first" id="post"><a href="#" >帖子<span class="uk-margin-small-left">${otheruserinfo.post_count}</span></a></li>
                            <li id="article"><a href="#" >游记<span class="uk-margin-small-left">${otheruserinfo.article_count}</span></a></li>
                            <li id="collection"><a href="#">收藏<span class="uk-margin-small-left">${otheruserinfo.collection_count}</span></a></li>
                            <li id="follow2"><a href="#">关注<span class="uk-margin-small-left">${otheruserinfo.follow_count}</span></a></li>
                            <li id="fans"><a href="#">粉丝<span class="uk-margin-small-left">${otheruserinfo.fans_count}</span></a></li>
                            <li id="news"><a href="#">消息<span class="uk-margin-small-left">${otheruserinfo.fans_count}</span></a></li>
                        </ul>
                    </ul>
                </div>
        </div>
            <div class="content">


            </div>


    </div>
</div>



</body>
</html>
