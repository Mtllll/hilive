<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/12
  Time: 17:08
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
<form method="post" action="${pageContext.request.contextPath}/do_transmit">
说点什么吧：<textarea rows="10" cols="20" name="guide"></textarea>
    <input type="hidden" value="${article.id}" name="article_id">
<input type="submit" value="确认转发">

    <hr>
   <div>${article.title}</div>
    <div>${article.content}</div>
</form>
</body>
</html>
