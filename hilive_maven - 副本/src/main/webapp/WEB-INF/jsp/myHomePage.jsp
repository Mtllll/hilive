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
    <link href="${pageContext.request.contextPath}/assets/uikit/css/components/form-file.almost-flat.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <meta name="viewport"
          content="width=device-width,user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="${pageContext.request.contextPath}/assets/uikit/css/uikit.almost-flat.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/uikit/css/components/form-file.almost-flat.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
    <title>Title</title>
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

        //头像ajax
       function uploadfile() {
           var file=document.getElementById('pic');
           var form=new FormData();
           form.append('avatar',file.files[0]);//append键值对
           var req=new XMLHttpRequest();
           req.open('post','${pageContext.request.contextPath}/ajaxFile',true);

           req.send(form);
           req.onload=function () {
            var img=document.getElementById('img');
            img.src='${pageContext.request.contextPath}/upload/'+req.responseText;
            var nav_pic=document.getElementById('nav-avatar');
            nav_pic.src='${pageContext.request.contextPath}/upload/'+req.responseText;
           }
       }
        var sentence = ["你的人生格言是什么?", "你有哪些爱好?", "你的信仰是什么?", "你的武器库有哪些武(ji)器(shu)?"];
        window.onload = function () {

            //游记ajax
            $('#article').click(function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/ajax_view_article/"+${userinfo.id},
                    type:"get",
                    dataType:"json",
                    success:function (res) {
//                        $('.content').html('');
                        var html=template("trip",res);
                        $('.content').html(html);

                    }
                })
            })
            //收藏ajax
            $('#collection').click(function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/ajax_collection_article/"+${userinfo.id},
                    type:"get",
                    dataType:"json",
                    success:function (res) {

                        var html=template('collection_article',res);
                        $('.content').html(html);
                    }
                })
            });
            //帖子ajax
            $('#post').click(function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/viewPersonalPost/${userinfo.id}",
                    type: "get",
                    dataType: "json",
                    success: function (res) {

                        var html=template("postList",res);

                        $('.content').html(html);
                    }
                })
            });
            //关注ajax
            $('#follow').click(function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/ajax_follow/"+${userinfo.id},
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
                    url:"${pageContext.request.contextPath}/ajax_fans/"+${userinfo.id},
                    type:"get",
                    dataType:"json",
                    success:function (res) {

                        var html=template('fans_list',res);
                        $('.content').html(html);
                    }
                })
            });

            //当页面一加载就通过trigger触发post点击事件
            $('#post').trigger('click');
            //动态格言
            var index = 0;
            var ambition = document.getElementById('ambition');
            setInterval(function (args) {
                index = index % sentence.length;
                ambition.innerHTML = sentence[index++];
            }, 2000);

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
            }}
//            $('li').each(function (i,elem) {
//                $(elem).click(function () {
//                    $('li a').each(function (i,elem) {
//                        $(elem).css('color','white');
//                        $(elem).removeClass('addBorderBottom');
//                    })
//                    $(elem).find('a').css('color','#3780F7');
//                    $(elem).addClass('addBorderBottom');
//                })
//            })
//        }
    </script>
    <%@include file="common/js_css_header.jsp"%>
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
                        <div class="uk-form-file">
                            <c:choose>
                                <c:when test="${userinfo.avatar!=''}">
                                    <img src="${pageContext.request.contextPath}/upload/${userinfo.avatar}" class=" personelPic " id="img">
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/assets/image/default.jpg" class=" personelPic " id="img">
                                </c:otherwise>
                            </c:choose>
                            <input type="file" onchange="uploadfile()" id="pic">
                        </div>
                    </div>
                    <div class="uk-width-medium-3-5">
                        <ul class="uk-list   basicInfo">
                            <li class="name uk-text-bold uk-margin-bottom" style="font-size:26px">${userinfo.username}</li>
                            <li class="uk-margin-small-bottom"><a href="${pageContext.request.contextPath}/currentuser/edit_personalInfo" class="jobAndAmbition"><span class="uk-margin-right">+</span><span>你从事什么职业？</span></a>
                            </li>
                            <li class="uk-margin-bottom"><a href="${pageContext.request.contextPath}/currentuser/edit_personalInfo" class="jobAndAmbition">
                                <span class="uk-margin-right">+</span><span id="ambition">你的人生格言是什么？</span></a></li>
                        </ul>
                    </div>
                    <div class="uk-width-medium-1-5">

                        <div><a class="editPersonelInfo" href="${pageContext.request.contextPath}/currentuser/edit_personalInfo">编辑个人资料</a></div>
                    </div>
                </div>
            </div>

            <div class="dis">

            </div>
            <!--选项卡-->
            <div class="uk-grid-collapse">
                <div class="tagBarDiv" >
                    <ul class="TagBar uk-list" id="TagBar" style="margin: 0;border-bottom: 1px solid #F2F2F3">
                        <ul>
                            <li class="first" id="post"><a href="#" >帖子<span class="uk-margin-small-left">${userinfo.post_count}</span></a></li>
                            <li id="article"><a href="#" >游记<span class="uk-margin-small-left">${userinfo.article_count}</span></a></li>
                            <li id="collection"><a href="#">收藏<span class="uk-margin-small-left">${userinfo.collection_count}</span></a></li>
                            <li id="follow"><a href="#">关注<span class="uk-margin-small-left">${userinfo.follow_count}</span></a></li>
                            <li id="fans"><a href="#">粉丝<span class="uk-margin-small-left">${userinfo.fans_count}</span></a></li>
                            <li id="news"><a href="#">消息<span class="uk-margin-small-left">${userinfo.fans_count}</span></a></li>
                        </ul>
                    </ul>
                </div>
                <!--内容-->

                <div class="content">


                </div>
            </div>
        </div>



    </div>
</div>

<%--<h3><a href="${pageContext.request.contextPath}/myArticle">我的游记</a></h3>--%>
<%--<h3><a href="${pageContext.request.contextPath}/myTransmit">我转发的游记</a></h3>--%>
</body>
</html>
