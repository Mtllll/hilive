<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 18-4-10
  Time: 下午9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script>
        window.onload=function () {

            $("#btn").click(function () {

                $.ajax({
                url:"${pageContext.request.contextPath}/addanswer",
                type:"get",
                    data:{question_id:$('#question_id').val(),content:$('#content').val()},
                dataType:"json",
                success:function(res){
                    var html =template('test',res);
                    var cent=$('#lu').html();
                    $('#lu').html(html+cent) ;
                    }
                });
            });
        }
    </script>
    <%@include file="common/js_css_header.jsp"%>

</head>
<body>
<script type="text/html" id="test">
    <li>
        <span><a href="#">{{username}}</a></span>
        <div>
            <a href="#"><img src="${pageContext.request.contextPath}/{{avatar }}"></a>
        </div>
        <p>{{content}}</p>
    </li>

</script>
<%@include file="common/header.jsp"%>
<div class="uk-container uk-container-center">
    <h2><a href="#">户外大厅</a></h2>
    <div>
        <a href="#">回复</a>
    </div>
    <div>
        <a href="#">${map.classification}</a><span>${map.title}</span>
        <p>${map.topic_html_content}</p>
        <a href="#">回复</a><a href="#">编辑</a>
        <div>
            <span><a href="#">查看数:${map.browse_count}</a></span>
            <span><a href="#">回答数:${map.answer_count}</a></span>
            <span><a href="#">收藏数:${map.share_count}</a></span>
            <div><a href="#">提问用户名:${map.username}</a></div>
            <div><a href="#">提问用户头像<img src="${pageContext.request.contextPath}/${map.avatar}"></a></div>
            <div><a href="#">提问用户发帖数：${map.post_count}</a></div>
            <div><a href="#">提问用户发在线时间:${map.online_time}</a></div>
            <div><span>提问用户注册时间:${map.createtime}</span></div>
        </div>
        <form>
            <a href="#">登录用户头像<img src="${pageContext.request.contextPath}/${map.avatar}"></a>
            <input type="hidden" value="${map.id}" name="question_id" id="question_id">
            <input type="text" name="content" id="content" placeholder="评论内容">
            <input type="button" value="快速回复" id="btn">
        </form>
    </div>
    <ul id="lu">

    </ul>
</div>





</body>
</html>
