<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 18-4-8
  Time: 下午7:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>Title</title>
    <link href="../../assets/uikit/css/uikit.almost-flat.css" rel="stylesheet">
    <link href="../../assets/css/style.css" rel="stylesheet">
    <link href="../../assets/css/reset.css" rel="stylesheet">
    <%@include file="common/js_css_header.jsp"%>
</head>
<body>

<%@include file="common/header.jsp"%>
<div class="uk-panel uk-panel-box uk-panel-box-primary">
    <span class="uk-alive-subnav ">户外用品库</span>
    <ul class="uk-subnav uk-alive-label uk-subnav-line uk-subnav-pill ">
        <li ><a href="#">户外品牌</a></li>
        <li class="uk-active"><a href="#">户外用品库</a></li>
        <li ><a href="#">滑雪场</a></li>
        <li ><a href="#">山峰</a></li>
        <li ><a href="#">线路</a></li>
        <li ><a href="#">户外俱乐部</a></li>
    </ul>
</div>
<a href="${pageContext.request.contextPath}/outdoorGoods">发布新装备</a>
<div class="uk-alive-body">
    <ul class="uk-grid uk-alive-goods">
    <c:forEach items="${goodsInfo}" var="goodsInfo">
        <li class="uk-width-1-4 uk-alive-details">
            <img class="app-alive-img" src="${pageContext.request.contextPath}/upload/${goodsInfo.picture}">
            <div><a href="#">${goodsInfo.brand}</a></div>
            <div>${goodsInfo.goods_name}</div>
            <div>${goodsInfo.score}</div>
            <a href="${pageContext.request.contextPath}/returnViewGoods/${goodsInfo.id}">点评</a>
        </li>
    </c:forEach>
</ul>
</div>

</body>
</html>
