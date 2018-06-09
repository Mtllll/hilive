<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 18-4-9
  Time: 下午3:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>户外搜索资料</title>
    <link href="${pageContext.request.contextPath}/assets/uikit/css/uikit.almost-flat.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit/js/uikit.js"></script>
</head>
<script>
    window.onload = function () {

        var oBody = document.getElementById("time");

        setInterval(fnTime, 1000);

        fnTime();

        function fnTime() {

            var myTime = new Date();


            var iYear = myTime.getFullYear();
            var iMonth = myTime.getMonth() + 1;
            var iDate = myTime.getDate();
            var iWeek = myTime.getDay();
            var iHours = myTime.getHours();
            var iMin = myTime.getMinutes();
            var iSec = myTime.getSeconds();
            var str = '';

            if (iWeek === 0) iWeek = '星期日';
            if (iWeek === 1) iWeek = '星期一';
            if (iWeek === 2) iWeek = '星期二';
            if (iWeek === 3) iWeek = '星期三';
            if (iWeek === 4) iWeek = '星期四';
            if (iWeek === 5) iWeek = '星期五';
            if (iWeek === 6) iWeek = '星期六';

            str = iYear + '年' + iMonth + '月' + iDate + '日 ' + iWeek + ' ' + toTwo(iHours) + ' : ' + toTwo(iMin) + ' : ' + toTwo(iSec);

            oBody.innerHTML = str;

        }
    };


    function toTwo(n) {
        return n < 10 ? '0' + n : '' + n;
    }
    function goBaidu() {
        var form = document.getElementById('search');
        form.action = '${pageContext.request.contextPath}/serachsubmit1';
        form.submit();
        return false;
        <%--var url = document.getElementById('title');--%>
        <%--var req = new XMLHttpRequest();--%>
        <%--req.open('get','${pageContext.request.contextPath}/baidu/'+url.value,true);--%>
        <%--req.send();--%>
    }
    function golocal() {
        var form = document.getElementById('search');
        form.action = '${pageContext.request.contextPath}/gobaidu';
        form.submit();
        return false;
        <%--var url = document.getElementById('title');--%>
        <%--var req = new XMLHttpRequest();--%>
        <%--req.open('get','${pageContext.request.contextPath}/baidu/'+url.value,true);--%>
        <%--req.send();--%>
    }


    //        function forum() {
    //            var ul1 = document.getElementById('ulBBs');
    //                 ul1.style.display= 'none';
    //                 alert("123")
    //        }

    $(function () {
        $('#forum').click(function () {
//            var index = $(this).index('a');
            $('#searchdiv1')/*.eq(index - 1)*/.css('display', 'block')/*.siblings('div').css('display', 'none');*/
            $('#searchdiv2').css('display', 'none')
        })

        $('#SwimRemember').click(function () {
//            var index = $(this).index('a');
            $('#searchdiv2')/*.eq(index - 1)*/.css('display', 'block')/*.siblings('div').css('display', 'none');*/
            $('#searchdiv1').css('display', 'none')
        })
    })




</script>

<style>
    div.test {
        white-space: nowrap;
        width: 500px;
        height: 60px;
        overflow: hidden;
        /*border:1px solid #000000;*/
        text-overflow: ellipsis;
    }

    .app-search-heard {
        padding-left: 350px;
        margin-top: 30px;
    }

    .uk-navbar {
        background-color: transparent;
        border: 0;
    }

    .app-search-input {
        width: 300px;
        height: 40px;
        margin-right: 20px;

    }

    .app-search-input1 {
        margin-left: 10px;
    }

    .app-forum {
        display: none;
    }
</style>
<body>


<header class="app-header">
    <div class="uk-container uk-container-center">
        <nav class="uk-navbar app-navbar">
            <a href="${pageContext.request.contextPath}/" class="uk-navbar-brand">

                <img src="${pageContext.request.contextPath}/assets/image/蓝色透明背景logo.png" width="150">
            </a>
            <%--${pageContext.request.contextPath}/serachsubmit--%>
            <form action="#" method="post" class="app-search-heard" id="search" >


                <div class="uk-form-icon">
                    <i class="uk-icon-search"></i>
                    <input type="text" name="title" id="title"  <%--value="请输入想要查找的内容" onclick="this.value=''" --%>
                           placeholder="请输入想要查找的内容" class="app-search-input uk-form-large">
                </div>

                <input  type="submit" value="搜     索" class="uk-button uk-button-large" onclick="goBaidu()" id="inputsearch">
                <input type="submit" value="搜索全网" class="app-search-input1 uk-button uk-button-large" onclick="golocal()">

            </form>

            <div class="uk-navbar-content uk-navbar-flip">

                <div class="uk-navbar-content uk-navbar-flip uk-button-dropdown" data-uk-dropdown="{mode:'click'}">

                    <div class="uk-button-group">
                        <h4 id="time" style="font-family: 幼圆 "></h4>
                    </div>

                </div>
            </div>
        </nav>
    </div>
</header>


<hr>


<%--<h3>搜索结果：</h3>--%>

<%--<p>${error}</p>--%>
<%--<div id="a" class="uk-tab-center">--%>
    <%--<ul class="uk-tab" data-uk-tab> <a href="#" id="forum">户外论坛</a></ul>--%>
    <%--<ul class="uk-tab" data-uk-tab> <a href="#" id="SwimRemember">游记</a></ul>--%>
<%--</div>--%>


<ul class="uk-tab uk-tab-right uk-width-medium-1-10 uk-animation-slide-right" style="float: left">
    <li ><a href="#" id="forum" class="uk-icon-tree ">户外论坛</a></li>
    <li><a href="#" id="SwimRemember" class="uk-icon-motorcycle ">游记</a></li>
</ul>

<%--<div class="uk-width-medium-1-1 uk-container-center">--%>
    <%--<ul class="uk-tab" data-uk-tab> <a href="#" id="forum">户外论坛</a></ul>--%>
    <%--<ul class="uk-tab" data-uk-tab> <a href="#" id="forum">户外论坛</a></ul>--%>

    <%----%>

<%--</div>--%>


<div class="uk-width-medium-2-3 uk-container-center uk-animation-fade" style="float: left;margin-left: 100px">



    <h3>文章内容</h3>

    <c:choose>


    <c:when test="${mapList==null}">

        <div id="searchdiv1">
    <c:forEach items="${postLst}" var="post">
        <li>
            <div style="position: relative">
                <a href="${pageContext.request.contextPath}/viewPost/${post.id}">${post.title}</a>
                <span  style="position: absolute;right: 0px">《<a href="${pageContext.request.contextPath}/outDoorHall" style="color: #7F0055">户外论坛</a>》</span>
            </div>
            <div>
                <span>${post.content}</span>
            </div>

            <div>
                <span>${post.publishtime}</span>
            </div>
        </li>

        <hr>
    </c:forEach>
</div>
        <div id="searchdiv2">
    <c:forEach items="${allArticle}" var="ar">
        <li >

               <div style="position: relative">
                   <a href="details/${ar.id}">${ar.title}</a>
                   <span  style="position: absolute;right: 0px">《<a href="${pageContext.request.contextPath}/view_article" style="color: #00aaaa">游记</a>》</span>
               </div>

            <div>
                    ${ar.content}
            </div>
            <div>
                <span> ${ar.createtime}</span>
            </div>

        </li>
        <hr>
    </c:forEach>

</div>

</c:when>


<c:otherwise>

<div id="searchdiv1">
    <c:forEach items="${mapList}" var="mapList">
        <c:choose>
            <c:when test="${mapList.bankuai_id==1}">




                <ul >
                    <li>
                        <div style="position: relative">
                            <a href="${pageContext.request.contextPath}/searchdetails/${mapList.bankuai_id}/${mapList.id}">${mapList.title}</a>
                            <span style="position: absolute;right: 0px">《<a href=href="${pageContext.request.contextPath}/outDoorHall" style="color: #7F0055">户外论坛</a>》</span>
                        </div>
                        <div>
                            <div class="test">${mapList.content}</div>
                        </div>
                        <input type="hidden" value="${mapList.id}" name="bankuai_id">
                        <div>
                            <span>${mapList.publishtime}</span>
                        </div>
                    </li>
                    <hr>
                </ul>
                    </c:when>
        </c:choose>
</c:forEach>
    </div>
    <div id="searchdiv2">
    <c:forEach items="${mapList}" var="mapList">
        <c:choose>

            <c:when test="${mapList.bankuai_id==2}">


                <ul >
                    <li>
                        <div style="position: relative">
                            <a href="${pageContext.request.contextPath}/searchdetails/${mapList.bankuai_id}/${mapList.id}">${mapList.title}</a>
                            <span  style="position: absolute;right: 0px">《<a href="${pageContext.request.contextPath}/view_article" style="color: #00aaaa">游记</a>》</span>
                        </div>
                        <div>
                            <div class="test">${mapList.content}</div>
                        </div>
                        <input type="hidden" value="${mapList.id}" name="bankuai_id">
                        <div>
                            <span>${mapList.publishtime}</span>
                        </div>
                    </li>
                    <hr>
                </ul>
                </div>
            </c:when>

        </c:choose>
</c:forEach>
</div>


</c:otherwise>
</c:choose>


<%--<c:choose>--%>
<%--<c:when test="${mapList.bankuang_id==}">--%>
<%--<ul id="comment_list1" >--%>
<%--<c:forEach items="${mapList}" var="mapList">--%>
<%--<li>--%>
<%--<div>--%>
<%--<a href="${pageContext.request.contextPath}/searchdetails/${mapList.bankuai_id}/${mapList.id}">${mapList.title}</a>--%>
<%--</div>--%>
<%--<div>--%>
<%--<div class="test">${mapList.content}</div>--%>
<%--</div>--%>
<%--<input type="hidden" value="${mapList.id}" name="bankuai_id">--%>
<%--<div>--%>
<%--<span>${mapList.publishtime}</span>--%>
<%--</div>--%>
<%--</li>--%>
<%--<hr>--%>
<%--</c:forEach>--%>
<%--</ul>--%>
<%--</c:when>--%>

<%--<c:when test="${mapList == null}">--%>
<%--<ul id="comment_list2" >--%>
<%--<c:forEach items="${mapList}" var="mapList">--%>
<%--<li>--%>
<%--<div>--%>
<%--<a href="${pageContext.request.contextPath}/searchdetails/${mapList.bankuai_id}/${mapList.id}">${mapList.title}</a>--%>
<%--</div>--%>
<%--<div>--%>
<%--<div class="test">${mapList.content}</div>--%>
<%--</div>--%>
<%--<input type="hidden" value="${mapList.id}" name="bankuai_id">--%>
<%--<div>--%>
<%--<span>${mapList.publishtime}</span>--%>
<%--</div>--%>
<%--</li>--%>
<%--<hr>--%>
<%--</c:forEach>--%>
<%--</ul>--%>
<%--</c:when>--%>
<%--</c:choose>--%>


</body>
</html>
