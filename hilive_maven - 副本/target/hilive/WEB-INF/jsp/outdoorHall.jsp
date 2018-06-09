<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 18-4-8
  Time: 上午11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>户外大厅</title>
    <link href="${pageContext.request.contextPath}/assets/uikit/css/uikit.almost-flat.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/page/mricode.pagination.css" rel="stylesheet">
    <%@include file="common/js_css_header.jsp"%>
    <script>
//        trigger
        $(function () {
            $('#page').pagination(
                {
                    pageIndex:0,
                    pageSize:9,
//                    showInfo:true,
                    showJump:true,
//                    showPageSizes:true,
                    remote:{
                        url:'${pageContext.request.contextPath}/forum',
                        success:function (data) {
                            var html=template('list-item',data);
                            $('#content').html(html);
                        }
                    }
                }
            )
        })



    </script>
</head>
<body style="background-image: url('../../assets/image/bike.jpg');background-repeat: no-repeat;background-size: cover;height: 800px">
<%@include file="common/header.jsp"%>

<script type="text/html" id="list-item">
    {{each list as value index}}
    <tr style="font-size: 12px">
        <td style="font-size: 14px">
            <a href="${pageContext.request.contextPath}/viewPost/{{value.id}}">{{value.title}}</a>
        </td>
        <td>
            <a href="${pageContext.request.contextPath}/otheruser/{{value.authorid}}">{{value.username}}</a><br>
            <span style="color: #949494">{{value.publishtime}}</span>
        </td>
        <td>
            {{value.responsecount}}<br>
            <span style="color: #949494">{{value.viewcount}}</span>
        </td>
        <td>
            <a href="${pageContext.request.contextPath}/otheruser/{{value.lastresponseid}}">{{value.lastresponseusername}}</a><br>
            <span style="color: #949494">{{value.lastresponsetime}}</span>
        </td>
    </tr>
    {{/each}}
</script>

<div class="uk-container uk-container-center">
    <div class="uk-grid">
            <a style="margin-left: 50px" class="uk-button uk-button-success uk-button-large" href="${pageContext.request.contextPath}/currentuser/gotoAddPost">发帖子</a>
    </div>
</div>
<hr>
<div class="uk-container uk-container-center">
    <div class="uk-grid">
        <div class="uk-width-1-1">
            <div class="uk-panel uk-panel-box uk-panel-box-secondary">
                <table class="uk-table uk-table-hover uk-table-striped uk-table-condensed">
                    <thead>
                    <tr>
                        <td class="uk-width-5-10">户外大厅论坛 本版置顶</td>
                        <td class="uk-width-2-10">作者/发布时间</td>
                        <td class="uk-width-1-10">回复/查看</td>
                        <td class="uk-width-2-10">最后回复</td>
                    </tr>
                    </thead>
                    <tbody id="content">
                    <%--<c:forEach items="${postLst}" var="post">--%>
                        <%--<tr style="font-size: 12px">--%>
                            <%--<td style="font-size: 14px">--%>
                                <%--<a href="${pageContext.request.contextPath}/viewPost/${post.id}">${post.title}</a>--%>
                            <%--</td>--%>
                            <%--<td>--%>
                                <%--<a href="">${post.username}</a><br>--%>
                                <%--<span style="color: #949494">${post.publishtime}</span>--%>
                            <%--</td>--%>
                            <%--<td>--%>
                                <%--${post.responsecount}<br>--%>
                                    <%--<span style="color: #949494">${post.viewcount}</span>--%>
                            <%--</td>--%>
                            <%--<td>--%>
                                <%--<a href=""> ${post.lastresponseusername}</a><br>--%>
                                <%--<span style="color: #949494">${post.lastresponsetime}</span>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                    <%--</c:forEach>--%>
                    </tbody>
                </table>
                <%--分页--%>
                <div id="page" class="m-pagination">

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
