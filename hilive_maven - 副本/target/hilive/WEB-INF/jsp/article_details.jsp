<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/10
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <title>Title</title>
    <script src="${pageContext.request.contextPath}/assets/wangEditor-3.1.0/release/wangEditor.js"></script>
    <link href="${pageContext.request.contextPath}/assets/uikit/css/uikit.almost-flat.css">
    <script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <%@include file="common/js_css_header.jsp"%>
    <script>
        //        加载页面时查找当前用户是否对当前文章点过赞，变颜色
        $(function () {

            var s = document.getElementById('praise');

            $.ajax({
                url: "${pageContext.request.contextPath}/is_praise/${article_details.id}",
                type: "get",
                dataType: "json",
                success: function (res) {

                    if (res == 1) {
                        s.style.backgroundColor = 'red';
                    }
                    else {
                        s.style.backgroundColor = 'white';
                    }
                }
            });

            //赞加一，减一
            $('#praise').click(function () {
                var s = document.getElementById('praise');
                $.ajax({
                    url: "${pageContext.request.contextPath}/praise/${article_details.id}",
                    type: "get",
                    dataType: "text",
                    success: function (res) {
                        var praise = document.getElementById('praise');
                        if(res==3)
                        {

                        }
                        if (res == 1) {
                            s.style.backgroundColor = 'red';
                            praise.innerHTML = parseInt(praise.innerHTML) + 1;
                        }
                        else {
                            s.style.backgroundColor = 'white';
                            praise.innerHTML = parseInt(praise.innerHTML) - 1;
                        }
                    }
                });

            })
//评论
                $('#comment').click(function () {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/comment",
                        type:"post",
                        data:{content:editor.txt.text(),article_id:${article_details.id}},
                        dataType:"text",
                        success:function (res) {
                            var comment=JSON.parse(res);
                            comment.name='${userinfo.username}';
                            comment.avatar='${userinfo.avatar}';
                            var html=template('aaa',comment);
                            var h=$('#ul').html();
                            $('#ul').html(html+h);
                        }
                    })
                })
//富文本
            var E=window.wangEditor;
            var editor=new E('#comment_editor');
            editor.create();
            $('#comment_editor').attr('style','height:auto;')

})
    </script>
    <style>
        #praise {
            cursor: pointer;
            padding: 0px 10px;
            border: 1px solid black;
        }
    </style>
</head>
<body style="background-color:#F4F5F5">
<%@include file="common/header.jsp"%>

<%--正文--%>
<div class="uk-grid uk-container-center uk-container">
    <div class="uk-width-medium-2-3 uk-panel-box-secondary uk-panel-box uk-panel" style="border: 0">
        <div class="uk-text-bold uk-text-large uk-margin-bottom">${article_details.title}</div>
        <div class="uk-margin-large-bottom">
            <span style="color:#B9BACD;">作者:</span><a href="${pageContext.request.contextPath}/otheruser/${article_details.userid}" class="uk-text-bold  uk-margin-left" style="color: #B71ED7">${article_details.username}</a>
            <span class="uk-margin-left" style="color: #B9BACD">${article_details.createtime}</span>
        </div>
        <div id="" class="uk-margin-large-bottom">
            ${article_details.topic_html_content}
        </div>
                <c:choose>
                    <c:when test="${userinfo!=null}">
                        <span style="height: 8px;border-left: 2px solid #8CC14C " class="uk-margin-right uk-text-success">

        </span>
                        <span class="uk-text-bold uk-text-large">评论区</span>
                        <div id="comment_editor" style="width: 90%;height: 100px" class="uk-margin-bottom uk-margin-large-top">
                            <p>文明评论</p>
                        </div>
                        <input type="button" value="提交评论" class="uk-button uk-button-large uk-button-success uk-width-1-1" id="comment" style="margin-bottom: 50px">

        </c:when>
        <c:otherwise>
            <div class="uk-text-center uk-margin-large-bottom">
                <a href="${pageContext.request.contextPath}/login1" class="uk-text-large uk-text-bold" style="text-decoration: none">评论请先登录</a>
            </div>
        </c:otherwise>
        </c:choose>

        <span style="height: 8px;border-left: 2px solid #8CC14C " class="uk-margin-right uk-text-success">

        </span>
        <span class="uk-text-bold uk-text-large">评论列表</span>
        <%--//模板评论--%>
        <script type="text/html" id="aaa">
            <li>
                <article class="uk-comment">
                    <header class="uk-comment-header">
                        <img class="uk-comment-avatar" src="${pageContext.request.contextPath}/upload/{{avatar}}" style="height: 30px;width: 30px;border-radius: 50%">
                        <h4 class="uk-comment-title">{{name}}</h4>
                        <div class="uk-comment-meta">{{createtime}}</div>
                    </header>
                    <div class="uk-comment-body">{{content}}</div>
                </article>
            </li>
        </script>
        <ul id="ul" style="list-style:none">

        </ul>

        <c:forEach items="${currentComment}" var="a">
            <div style="margin-top: 50px">


            <li>
                <article class="uk-comment">
                    <header class="uk-comment-header">
                        <img class="uk-comment-avatar" src="${pageContext.request.contextPath}/upload/${a.avatar}" style="height: 30px;width: 30px;border-radius: 50%">
                        <h4 class="uk-comment-title">${a.username}</h4>
                        <div class="uk-comment-meta">${a.createtime}</div>
                    </header>
                    <div class="uk-comment-body">${a.content}</div>
                </article>
            </li>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
