<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 18-4-12
  Time: 下午6:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        .app-title{
            color: black;
            font-size: 18px;
            font-weight: bold;
        }
        .bodypic{
            background-image: url("${pageContext.request.contextPath}/assets/image/gieter.jpg");
            background-size:100% 100%;
            background-repeat:no-repeat;
        }
        .opty{
            opacity: 0.7;
        }
        .opty1{
            width: 600px;
            margin-left: 50px;
            opacity: 0.6;
        }

    </style>
    <%@include file="common/js_css_header.jsp"%>
</head>
<body class="bodypic">
<%@include file="common/header.jsp"%>
<div class="uk-panel uk-panel-box-primary uk-text-center opty">
    <form action="${pageContext.request.contextPath}/serchquestion" method="post" >
        <input type="text" name="title" placeholder="搜搜你想问的问题">
        <input type="submit" value="本站搜">
        <a href="http://www.baidu.com" class="uk-button uk-button-success uk-button-small">全网搜</a>

        </form>
    </form>
</div>


<h3 class="uk-margin-left" style="font-weight: bold">搜索结果:</h3>
<ul class="uk-panel uk-panel-box-secondary opty1">
    <c:choose>
    <c:when test="${questionsMap[0]==null}">
        <p>抱歉，没有找到与<span style="color: red">${title}</span>相关的结果。</p>
        <p> 建议您尝试变换检索词，或者去<a href="http://www.baidu.com">百度一下>></a></p>

    </c:when>
    <c:otherwise>
        <c:forEach items="${questionsMap}" var="questionsinfo">
<div class="uk-margin-small-top">
    <div class="app-title">
        <a href="${pageContext.request.contextPath}/readonequestion/${questionsinfo.title}">${questionsinfo.title}</a>
    </div>
    <div>
        ${questionsinfo.createtime}
    </div>
</div>

        </c:forEach>
    </c:otherwise>
    </c:choose>

</li>


</ul>
</body>
</html>
