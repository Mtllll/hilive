<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 18-4-4
  Time: 下午2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>首页</title>
    <%@include file="common/js_css_header.jsp"%>
</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/image/首页背景图2.jpg');background-repeat: no-repeat;background-size: cover">
<%@include file="common/header.jsp"%>
<div class="uk-width-1-1">
    <img src="${pageContext.request.contextPath}/assets/image/蓝色透明背景渐变logo.png" class="uk-align-center">
</div>
<img src="${pageContext.request.contextPath}/assets/image/qrcode.dib" style="float: right">
<div class="uk-width-medium-1-1 uk-text-center" style="color: #3E73C1;font-size: 36px;font-family: '微软雅黑', Arial">

        一个体验生活，超越自我，集户外、旅行与一体的轻量级新生代网站

</div>

<%--<ul>--%>
    <%--<li><a href="${pageContext.request.contextPath}/forum">户外大厅</a></li>--%>
    <%--<li><a href="${pageContext.request.contextPath}/viewGoods">口碑</a></li>--%>
    <%--<li><a href="#">游记</a></li>--%>
<%--</ul>--%>
<%--<ul class="ul">--%>
    <%--<li>--%>
        <%--<form action="#" method="post">--%>
            <%--<input type="text">--%>
            <%--<input type="submit" value="搜索">--%>
        <%--</form>--%>
    <%--</li>--%>
    <%--<c:choose>--%>
        <%--<c:when test="${userinfo!=null}">--%>

            <%--欢迎你 <span><img src="${pageContext.request.contextPath}/upload/${avatar}"></span>--%>
            <%--<a href="${pageContext.request.contextPath}/currentuser/edit_personalInfo">${userinfo.username}</a>--%>
        <%--</c:when>--%>
        <%--<c:otherwise>--%>
            <%--<li><a href="#">登录</a></li>--%>
            <%--<li><a href="reg">注册</a></li>--%>
        <%--</c:otherwise>--%>
    <%--</c:choose>--%>

<%--</ul>--%>
<%--<div class="div">--%>
    <%--<div>--%>
        <%--<a href="#"><img src="pic/u=555935912,2358910708&fm=27&gp=0.jpg"></a>--%>
        <%--<div class="div1">--%>
            <%--<div class="div1-1">--%>
                <%--<a href="#">文章题目</a>--%>
            <%--</div>--%>
            <%--<div class="div1-1">--%>
                <%--文章内容文章内容文章内容文章内容文章内容文章内容--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div>--%>
        <%--<a href="#"><img src="pic/u=813104884,605366009&fm=27&gp=0.jpg"></a>--%>
        <%--<div class="div1">--%>
            <%--<div class="div1-1">--%>
                <%--<a href="#">文章题目</a>--%>
            <%--</div>--%>
            <%--<div class="div1-1">--%>
                <%--文章内容文章内容文章内容文章内容文章内容文章内容--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div>--%>
        <%--<a href="#"><img src="pic/u=1424111904,1980194338&fm=27&gp=0.jpg"></a>--%>
        <%--<div class="div1">--%>
            <%--<div class="div1-1">--%>
                <%--<a href="#">文章题目</a>--%>
            <%--</div>--%>
            <%--<div class="div1-1">--%>
                <%--文章内容文章内容文章内容文章内容文章内容文章内容--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div>--%>
        <%--<a href="#"><img src="pic/u=2809576112,626361756&fm=27&gp=0.jpg"></a>--%>
        <%--<div class="div1">--%>
            <%--<div class="div1-1">--%>
                <%--<a href="#">文章题目</a>--%>
            <%--</div>--%>
            <%--<div class="div1-1">--%>
                <%--文章内容文章内容文章内容文章内容文章内容文章内容--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div>--%>
        <%--<a href="#"><img src="pic/下载.jpg"></a>--%>
        <%--<div class="div1">--%>
            <%--<div class="div1-1">--%>
                <%--<a href="#">文章题目</a>--%>
            <%--</div>--%>
            <%--<div class="div1-1">--%>
                <%--文章内容文章内容文章内容文章内容文章内容文章内容--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>

</div>
</body>
</html>
