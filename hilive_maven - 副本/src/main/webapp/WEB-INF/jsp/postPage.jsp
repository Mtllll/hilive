<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 18-4-8
  Time: 上午11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>帖子详情</title>
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
    <link href="${pageContext.request.contextPath}/assets/uikit/css/uikit.almost-flat.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/uikit/js/uikit.js"></script>
    <script src="${pageContext.request.contextPath}/assets/wangEditor-3.1.0/release/wangEditor.js"></script>
    <style>
        .app-username{
            color: #0a001f;
        }
        .app-username:hover{
            color: #00a8e6;
            text-decoration: none;
        }
    </style>
    <%@include file="common/js_css_header.jsp"%>
</head>
<script>
    function textArea1() {
        $(this).hide();
//        $(this).next('div').show();
//        $('#secondResponsePost').hide();
//        $('#appear').show();
    }
//    二次回帖
    function secondSubmit() {
        $.ajax({
            url:"${pageContext.request.contextPath}/addSecondResponsepost",
            type:"post",
            data:{second_responsepost_content:$('#second_responsepost_content').val(),
                second_responsepost_userid:$('#second_responsepost_userid').val(),
                responsepost_id:$('#responsepostID').val()},
            dataType:"json",
            success:function (res) {
                res.name='${userinfo.username}';
                var html=template("secondResponse",res);
                var h=$('#secondResponseList').html();
                $('#secondResponseList').html(html+h);
            }
        })
        $('#appear').hide();
        $('#secondResponsePost').show();

    }
    $(function () {
        $('#submit').click(function () {

            var req = new XMLHttpRequest();
            req.open('post','${pageContext.request.contextPath}/addResponsepost',true);
            req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            req.send("postid="+$('#pid').val()+"&responsecontent="+$('#responseArea').val());
//            alert($('#pid').val());
//            alert($('#responseArea').val());

            req.onload=function () {
//                alert(req.responseText);
                var responsepost=JSON.parse(req.responseText);
                var time =timestampToTime(responsepost.responsetime);
                responsepost.responsetime=time;
                responsepost.deleteSrc="${pageContext.request.contextPath}/delete_comment/"+responsepost.id;
//                var date=new Date();
//                date.setTime(responsepost.createtime);
                var html = template('text',responsepost);
                var input = document.getElementById('responsepostList');
                var oldChild =input.innerHTML;
                input.innerHTML=oldChild+html;
            }
         })
    })

</script>
<script type="text/html" id="secondResponse">
    <li>
        <div>
            {{second_responsepost_content}}
        </div>
        <span>
            时间：{{second_responsepost_createtime}}来自：{{name}}
        </span>
    </li>
</script>
<script type="text/html" id="text">
    <%--<li>--%>
        <%--<div>--%>
            <%--{{responsecontent}}--%>
        <%--</div>--%>
        <%--<div>--%>
            <%--<img class="avatar" src="${pageContext.request.contextPath}/upload/${userinfo.avatar}" width="40" height="40">--%>
            <%--<span>${userinfo.username}</span>--%>
            <%--<span>{{responsetime}}</span>--%>
        <%--</div>--%>
    <%--</li>--%>
    <li>
        <div class="uk-container" style="padding-right: 0">
            <div class="uk-grid">
                <div class="uk-width-1-5" style="background-color: #F0F0F0" >
                    <div style="padding: 10px">
                        <a class="app-username" style="margin-left: 24px" href="${pageContext.request.contextPath}/otheruser/${userinfo.id}">${userinfo.username}</a><br>
                        <a href="${pageContext.request.contextPath}/otheruser/${userinfo.id}">
                            <img class="avatar" src="${pageContext.request.contextPath}/upload/${userinfo.avatar}" width="80" height="80"><br>
                        </a>
                        <a href="{{deleteSrc}}">删除</a>
                    </div>
                </div>
                <div class="uk-width-4-5" style="padding: 0;background-color: #FFFFFF">
                    <div style="height: 40px">
                        <div style="margin: 10px 15px;color:#949494;float: left">发表于 {{responsetime}}</div>
                        <div style="margin: 10px 15px;color:#949494;float: right">楼</div>
                    </div>
                    <div style="background-color: #E2E2E2;height: 1px"></div>
                    <div style="margin:15px">{{responsecontent}}</div>
                </div>
            </div>
        </div>
    </li>
    <div class="uk-width-1-1" style="height:8px;background-color: #C5C5C5"></div>
</script>

<body style="background-image: url('../../assets/image/bike.jpg');background-repeat: no-repeat;background-size: cover">
<%@include file="common/header.jsp"%>
<div class="uk-grid">
    <div class="uk-width-1-6"></div>
    <div class="uk-width-4-6">
        <div class="uk-width-1-1" style="height:2px;background-color: #E2E2E2"></div>
        <div class="uk-panel-teaser" style="background-color: #F7F7F7;height: 50px;margin-bottom: 2px">
            <h3 style="float: left;margin-top: 14px;margin-left: 10px">${postView.title}</h3>
            <div style="float: right;margin-top: 14px;margin-right: 10px">
                <span>查看数：${postView.viewcount}</span>
                <span>回复数：${postView.responsecount}</span>
            </div>
        </div>
        <div class="uk-width-1-1" style="height:1px;background-color: #E2E2E2"></div>
        <div class="uk-container" style="padding-right: 0;margin-right: 0">
            <div class="uk-grid">
                <div class="uk-width-1-5" style="background-color: #F0F0F0" >
                    <div style="padding: 10px">
                        <a class="app-username" style="margin-left: 24px" href="${pageContext.request.contextPath}/otheruser/${postView.authorid}">${postView.username}</a><br>
                        <a href="${pageContext.request.contextPath}/otheruser/${postView.authorid}">
                            <img class="avatar" src="${pageContext.request.contextPath}/upload/${postView.avatar}" width="80" height="80"><br>
                        </a>
                        <c:if test="${postView.username==userinfo.username}">
                            <a href="${pageContext.request.contextPath}/deletePost/${postView.id}">删除帖子</a>
                        </c:if>
                    </div>
                </div>
                <div class="uk-width-4-5" style="padding: 0;background-color: #FFFFFF">
                    <div style="height: 40px">
                        <div style="margin: 10px 15px;color:#949494;float: left">发表于 ${postView.publishtime}</div>
                        <div style="margin: 10px 15px;color:#949494;float: right">1楼</div>
                    </div>
                    <div style="background-color: #E2E2E2;height: 1px"></div>
                    <div style="margin:15px">${postView.topic_html_content}</div>
                </div>
            </div>
        </div>
        <div class="uk-width-1-1" style="height:8px;background-color: #C5C5C5"></div>
        <%--所有回帖--%>
        <ul id="responsepostList" style="list-style: none;padding:0;margin: 0">
            <c:forEach items="${responsepostList}" var="responsepost">
                <li>
                    <input name="responsepostID" type="text" hidden="hidden" value="${responsepost.id}">
                    <div class="uk-container" style="padding-right: 0">
                        <div class="uk-grid">
                            <div class="uk-width-1-5" style="background-color: #F0F0F0" >
                                <div style="padding: 10px">
                                    <a class="app-username" style="margin-left: 24px" href="${pageContext.request.contextPath}/otheruser/${responsepost.responseuserid}">${responsepost.username}</a><br>
                                    <a  href="${pageContext.request.contextPath}/otheruser/${responsepost.responseuserid}">
                                        <img class="avatar" src="${pageContext.request.contextPath}/upload/${responsepost.avatar}" width="80" height="80"><br>
                                    </a>
                                    <c:if test="${responsepost.username==userinfo.username}">
                                        <a href="${pageContext.request.contextPath}/delete_comment/${responsepost.id}">删除</a>
                                    </c:if>
                                </div>
                            </div>
                            <div class="uk-width-4-5" style="padding: 0;background-color: #FFFFFF">
                                <div style="height: 40px">
                                    <div style="margin: 10px 15px;color:#949494;float: left">发表于 ${responsepost.responsetime}</div>
                                    <div style="margin: 10px 15px;color:#949494;float: right" id="floor">${responsepostList.indexOf(responsepost)+2}楼</div>
                                </div>
                                <div style="background-color: #E2E2E2;height: 1px"></div>
                                <div style="margin:15px">${responsepost.responsecontent}</div>
                                <%--<div style="background-color: #E2E2E2;height: 1px"></div>--%>
                                <%--所有二次回帖--%>
                                <div>
                                    <ul id="secondResponseList">
                                        <c:forEach items="${allSecondResponse.get(responsepost.id)}" var="secondResponseById">
                                            <li>
                                                <div>
                                                    ${secondResponseById.second_responsepost_content}
                                                </div>
                                                <span>
                                                    时间：${secondResponseById.second_responsepost_createtime}来自：${secondResponseById.username}
                                                </span>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <%--二次回帖区--%>
                                <%--</div>--%>
                                <%--<button id="secondResponsePost" onclick="textArea1()">回复</button>--%>
                                <%--<div id="appear" hidden="hidden">--%>
                                    <%--<form action="#">--%>
                                        <%--<input type="text" value="${responsepost.responseuserid}" id="second_responsepost_userid" hidden="hidden">--%>
                                        <%--<textarea rows="8" cols="100" id="second_responsepost_content" placeholder="输入您的评论"></textarea>--%>
                                        <%--<input type="button" value="回复" onclick="secondSubmit()">--%>
                                    <%--</form>--%>
                                <%--</div>--%>
                            </div>
                        </div>
                    </div>
                </li>
                <div class="uk-width-1-1" style="height:8px;background-color: #C5C5C5"></div>
            </c:forEach>
        </ul>
        <%--回帖区--%>
        <div class="uk-container" style="padding-right: 0">
            <div class="uk-grid">
                <div class="uk-width-1-5" style="background-color: #F0F0F0" >
                    <div style="padding: 10px">
                        <c:choose>
                            <c:when test="${userinfo==null}">
                                <div>
                                    回帖请先<a class="uk-button uk-button-danger" href="${pageContext.request.contextPath}/login1">登录</a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <a class="app-username" style="margin-left: 24px" href="${pageContext.request.contextPath}/currentuser/otheruser/${userinfo.id}">${userinfo.username}</a><br>
                                <a href="${pageContext.request.contextPath}/currentuser/otheruser/${userinfo.id}">
                                    <img class="avatar" src="${pageContext.request.contextPath}/upload/${userinfo.avatar}" width="80" height="80"><br>
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <%--回帖主要部分--%>
                <div class="uk-width-4-5" style="padding: 0;background-color: #FFFFFF">
                    <div class="uk-panel"></div>
                    <div style="background-color: #E2E2E2;height: 1px"></div>
                    <div style="margin:15px">
                        <c:choose>
                            <c:when test="${userinfo==null}">

                            </c:when>
                            <c:otherwise>
                                <form class="uk-form" action="#">
                                    <input type="hidden" name="postid" value="${postView.id}" id="pid">
                                    <textarea name="content" rows="5" cols="100" id="responseArea"></textarea>
                                    <input style="vertical-align: bottom" class="uk-button uk-button-success" type="button" value="回帖" id="submit">
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="uk-width-1-6"></div>
</div>
<div style="height: 200px"></div>
</body>
</html>