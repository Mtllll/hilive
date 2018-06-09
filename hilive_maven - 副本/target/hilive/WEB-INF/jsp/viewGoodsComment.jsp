<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 18-4-9
  Time: 下午7:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">--%>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/uikit/css/uikit.almost-flat.css">
    <script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script>
        function addComment() {
            var req = new XMLHttpRequest();
            req.open('post','${pageContext.request.contextPath}/add_comment',true);
            req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            req.send('goodsInfo_id='+$('#aid').val()+'&price_from='+$('#price_from').val()
                +'&shortcoming='+$('#shortcoming').val()+'&virtues='+$('#virtues').val()
                +'&general='+$('#general').val()+'&score='+$('#score').val());
            req.onload=function () {
                var goodsComment=JSON.parse(req.responseText);
                var html =template('comment',goodsComment);
                var listComment =document.getElementById('listComment');
                var oldChild=document.getElementById('listComment').innerHTML;
                listComment.innerHTML=html+oldChild;
            }
        }
    </script>
    <%@include file="common/js_css_header.jsp"%>
</head>
<body>

<script type="text/html" id="comment">
    <li>  <p>推荐:{{score}}</p>
        <p>价格来源:{{price_from}}</p>
        <p>不足:{{shortcoming}}</p>
        <p>优点:{{virtues}}</p>
        <p>综合:{{general}}</p>
        <span>{{comment_time}}</span>
    </li>

</script>
<%@include file="common/header.jsp"%>
<h2>户外用品库</h2>
<h2>${goodsInfo.goods_name}</h2>
<img class="app-alive-img" src="${pageContext.request.contextPath}/upload/${goodsInfo.picture}">
<div>${goodsInfo.score}</div>
<h2>${goodsInfo.goods_name} 的简介</h2>
<div><h2>${goodsInfo.description}</h2></div>
<hr>
<h2>${goodsInfo.goods_name} 的点评</h2>

<ul id="listComment" class="uk-comment">
    <c:forEach items="${commentinfo}" var="comment">
    <li class="uk-comment-header">
        <img class="uk-comment-avatar app-alive-userImg" src="${pageContext.request.contextPath}/upload/${comment.avatar}">
        <h4 class="uk-comment-title">${goodsInfo.goods_name}</h4>
        <div class="uk-comment-body">
            <p>推荐:${comment.score}</p>
            <p>价格来源:${comment.price_from}</p>
            <p>不足:${comment.shortcoming}</p>
            <p>优点:${comment.virtues}</p>
            <p>综合:${comment.general}</p>
        </div>
    </li>
        </c:forEach>

        <%--<c:forEach items="${commentinfo}" var="comment">--%>
        <%--<li>--%>
            <%--<img class="app-alive-userImg" src="${pageContext.request.contextPath}/upload/${comment.avatar}">--%>
            <%--<p>${comment.username}</p>--%>
            <%--<p>推荐:${comment.score}</p>--%>
            <%--<p>价格来源:${comment.price_from}</p>--%>
            <%--<p>不足:${comment.shortcoming}</p>--%>
            <%--<p>优点:${comment.virtues}</p>--%>
            <%--<p>综合:${comment.general}</p>--%>
            <%--<span>${comment.comment_time}</span>--%>
            <%--<span>${goodsInfo.goods_name}</span>--%>
        <%--</li>--%>
    <%--</c:forEach>--%>

</ul>
<hr>
<h2>写点评</h2>
<c:choose>
    <c:when test="${userinfo ==null}">
        要评论请先<a href="${pageContext.request.contextPath}/login1">登陆</a>
    </c:when>
    <c:otherwise>
        <div>评论</div>
        <form action="#">
            <input type="hidden" name="goodsInfo_id" value="${goodsInfo.id}" id="aid">
            <div>推荐<input type="text" id="score" name="score"></div>
            <div> 价格来源<textarea rel="4" cols="80" id="price_from" name="price_from" placeholder="请写明自己从哪里得到的，入手时间，购买价格"></textarea></div>
            <div>不足<textarea rel="4" cols="80" id="shortcoming" name="shortcoming" placeholder="请结合自己使用一段时间后的感受详细说明该装备本身的缺点，价格知名度不是装备本身的缺点"></textarea></div>
            <div>优点<textarea rel="4" cols="80"id="virtues" name="virtues" placeholder="请结合自己的使用感受说明该装备的优点"></textarea></div>
            <div>综合<textarea rel="4" cols="80" id="general" name="general" placeholder="请结合自己的使用感受综合对装备进行客观评价"></textarea></div>
            <div>图片:最多可以上传三张图片</div>
            <div>验证码:</div>
            <div> <input type="button" value="发布" onclick="addComment()" ></div>
        </form>
    </c:otherwise>
</c:choose>

</body>
</html>
