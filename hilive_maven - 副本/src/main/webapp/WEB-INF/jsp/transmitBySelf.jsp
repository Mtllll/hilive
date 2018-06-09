<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/12
  Time: 20:23
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
<c:forEach items="#{transmitBySelf}" var="t">
    <li>
        <span style="color: rebeccapurple">
            ${t.guide}
        </span>
        <hr>
        <h4><a href="${pageContext.request.contextPath}/details/${t.id}">${t.title}</a></h4>
        <div>${t.content}</div>
        <div>来源：${t.username}</div>
        <div>
            转发时间：${t.createtime}
        </div>
    </li>
</c:forEach>
</body>
</html>
