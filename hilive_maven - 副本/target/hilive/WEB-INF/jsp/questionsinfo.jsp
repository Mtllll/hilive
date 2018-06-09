<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 18-4-12
  Time: 上午10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        .hands {
            color: red;
        }
    </style>
    <script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script>
        $(function () {
            $('#btn').click(function () {

                $.ajax({
                    url: "${pageContext.request.contextPath}/addanswer",
                    type: "get",
                    data: {question_id: $('#question_id').val(), content: $('#content').val()},
                    dataType: "json",
                    success: function (res) {
                        var html = template('test', res);
                        var cent = $('#lu').html();
                        $('#lu').html(html + cent);
                    }
                });
            });

        })
    </script>

    <script>
        window.onload = function () {
            var hand = document.getElementsByClassName('hand');
            var answerid = document.getElementById('answerid');
            var thumbs = document.getElementById('thumbs');
            for (var i = 0; i < hand.length; i++) {
                hand[i].onclick = function () {
                    var req = new XMLHttpRequest();
                    req.open("post", "${pageContext.request.contextPath}/agreencount", true);
                    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");//post请求需要设置HTTP头信息,否则发送数据有问题
                    req.send("id=" + answerid.value);
                    req.onload = function () {
                        var val = req.responseText;
                        if (val.indexOf("n") > -1) {

                            for (var j = 0; j < hand.length; j++) {
                                hand[j].style.display = 'none';
                            }
                            thumbs.innerHTML = '登陆后才可给评论点赞';
                        }
                        else {
                            alert(val);
                            alert(i);
                            var naem = hand[i].className;//取不到
                            alert(name);

//                                hand[i].innerHTML=val;
                        }
                    }
                }
            }

        }


    </script>
    <%@include file="common/js_css_header.jsp" %>
</head>
<body>

<%@include file="common/header.jsp" %>
<div class="uk-container uk-container-center">
    <h5>问答</h5>
    <div>
        <a href="${pageContext.request.contextPath}/addaskinfo">我要提问</a><br>
        <a href="#">我要回答</a>
    </div>
    <div>
        问题名:${mapTitle.title}
    </div>
    <div>
        <a href="#">类型:${mapTitle.classification}</a>
        <span>回答数:${mapTitle.answer_count}</span><span>浏览数:${mapTitle.browse_count}</span>
    </div>
    <p>内容:${mapTitle.topic_html_content}</p>
    <hr>
    <div>
        全部回答
    </div>
    <script type="text/html" id="test">
        <li>
            <span><a href="#">回答者名字：{{username}}</a></span>
            <div>
                <a href="#">回答者头像：<img src="${pageContext.request.contextPath}/{{avatar}}"></a>
            </div>
            <p>回答内容：{{content}}</p>
            <a href="#">回复</a><a class="uk-icon-thumbs-up hand">${list.agree_count}</a>
        </li>
    </script>
    <a href="${pageContext.request.contextPath}/login1" id="thumbs"></a>
    <ul id="lu">
        <c:forEach items="${list_answer}" var="list">
            <li>
                <a href="#">回答者头像<img src="${pageContext.request.contextPath}/${list.avatar}"></a>
                <div>回答者名字:${list.username}</div>
                <p>回答内容:${list.content}</p>
                <input type="hidden" name="id" value="${list.id}" id="answerid">

                <a href="#">回复</a> <a class="uk-icon-thumbs-up hand">${list.agree_count}</a>

            </li>
        </c:forEach>
    </ul>

    <h4>我来回答</h4>
    <c:choose>
        <c:when test="${n==null}">
            <span>先登录在回答</span> <a href="${pageContext.request.contextPath}/login2">点击登陆</a>

        </c:when>
        <c:otherwise>
            <form>
                <div>
                    <textarea rel="60" cols="10" name="content" id="content"></textarea>
                </div>
                <input type="hidden" name="question_id" value="${mapTitle.id}" id="question_id">
                <input type="button" value="确认回答" id="btn">
            </form>
        </c:otherwise>
    </c:choose>


</div>


</body>
</html>
