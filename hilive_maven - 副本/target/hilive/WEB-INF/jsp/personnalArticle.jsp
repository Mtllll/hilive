<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/12
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <%@include file="common/js_css_header.jsp"%>
</head>
<body>

<c:forEach items="${personnalArticle}" var="p">
    <li>
        <h2>
            <a href="details/${p.id}">${p.title}</a>
        </h2>
        <div>
                ${p.content}
        </div>
        <div>
            <span> ${p.createtime}</span><span>${p.username}</span><br>
            点赞数：<span> ${p.praise_count}</span>
            关注数：<span> ${p.follow_count}</span>
            转发数：<span> ${p.share_count}</span>
        </div>

    </li>
</c:forEach>
</body>
</html>
