<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 18-4-8
  Time: 上午11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发布户外用品库</title>
    <style>
        input{
            margin-top: 10px;
        }
        select{
            margin-top: 10px;
        }
    </style>
    <%@include file="common/js_css_header.jsp"%>
</head>
<body>
<h4>发布户外用品库</h4>
<form action="${pageContext.request.contextPath}/add_Goods" method="post" enctype="multipart/form-data">
    <input type="text" placeholder="户外用品库名称" name="goods_name"><br>
    <input type="file" name="picture2" ><br>
    <select name="brand">
        <option>古驰</option>
        <option>宝马</option>
        <option>阿玛尼</option>
        <option>迪奥</option>
    </select><br>
    <select name="goods_type">
        <option>袜子</option>
        <option>背心</option>
        <option>裤衩子</option>
        <option>鞋</option>
    </select><br>
    <input type="text" name="price" placeholder="参考价格"><br>
    评分：<input type="text" name="score">
    <br>
    <textarea rows="10"cols="40" name="description"></textarea><br>
    <input type="submit" value="发布">
</form>
</body>
</html>
