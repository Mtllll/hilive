<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 18-4-10
  Time: 下午3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>问答</title>
    <style>
        .app-backpic{
            background-image: url("${pageContext.request.contextPath}/assets/image/motens.jpg");
            background-size:100% 100%;
            background-repeat:no-repeat;
        }
            .active{
                padding: 10px 20px;
                color: white;
                background-color: #4A7394;
                border-radius: 5px;
            }
            .active:hover{
                color: white;

            }
        .app-title{
            color: blue;
            font-size: 18px;
            font-weight: bold;
        }
            .app-questionpage{
                opacity: 0.6;
                width: 700px;
                background-color: gainsboro;
                /*border: 1px solid red;*/
            }
        .app-panl{
            opacity: 0.7;
            color: honeydew;
            font-weight: bold;
            font-size: 20px;
            width: 668px;
            border: 1px solid white;
            background-color: white;
        }
        .opty{
            opacity: 0.8;
        }

    </style>
    <%@include file="common/js_css_header.jsp"%>
</head>
<body class="app-backpic">
<%@include file="common/header.jsp"%>
<div class="uk-container uk-container-center ">
    <div class="uk-panel uk-panel-header">

        <ul class="uk-subnav">
            <li><h4 style="font-weight: bold">问答</h4></li>
        </ul>

    </div>

<%--<div class="uk-panel uk-panel-box-primary uk-text-center uk-grid">--%>
   <div class="uk-grid opty">
       <div class="uk-width-2-3 uk-panel">
           <form action="${pageContext.request.contextPath}/serchquestion" method="post" class=" uk-form uk-form-icon uk-icon-small">

                   <span class="uk-icon-search "></span>

               <input type="text" name="title" placeholder="搜搜你想问的问题" class="uk-form-danger">
               <span class="uk-icon-share "></span>
               <input type="submit" value="去搜索">
           </form>
       </div>

       <div class="uk-width-1-3"> <a href="${pageContext.request.contextPath}/addaskinfo" class="uk-icon-plus-square active">我要提问</a> <span style="color: red">${error}</span></div>

 </div>



<%--</div>--%>
<div class="uk-panel uk-panel-box app-panl">最新问题:</div>
    <div class="uk-panel app-questionpage">

        <ul style="list-style: none">
            <c:forEach items="${list_questions}" var="list">
                <li class="uk-margin-small-top">
                    <div class="app-title">
                        <a href="${pageContext.request.contextPath}/readonequestion/${list.title}">${list.title}</a>
                    </div>
                    <div>
                        <span>时间：${list.createtime}</span>
                        <span class="uk-margin-small-left">回答数：${list.answer_count}</span>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
</body>
</html>
