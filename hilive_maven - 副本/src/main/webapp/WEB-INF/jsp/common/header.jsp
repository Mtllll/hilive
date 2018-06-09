<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 2018/4/9
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--网站头部导航--%>
<header class="app-header aaa" style="background-color: #F9F9F9">
    <div class="uk-container uk-container-center">
        <nav class="uk-navbar app-navbar uk-visible-large" style="z-index: 99999999; height: 0px">
            <a href="/" class="uk-navbar-brand app-logo-a">
                <img class="logo" src="${pageContext.request.contextPath}/assets/image/蓝色透明背景logo无字.png">
            </a>
            <ul class="uk-navbar-nav">
                <li>
                    <a href="${pageContext.request.contextPath}/outDoorHall">
                        户外大厅
                    </a>
                </li>
                <%--<li>--%>
                    <%--<a href="${pageContext.request.contextPath}/viewGoods">--%>
                        <%--口碑--%>
                    <%--</a>--%>
                <%--</li>--%>
                <li>
                    <a href="${pageContext.request.contextPath}/view_article">
                        游记
                    </a>
                </li>
                <%--<li>--%>
                    <%--<a href="${pageContext.request.contextPath}/askanswer">--%>
                        <%--问答--%>
                    <%--</a>--%>
                <%--</li>--%>
                <li class="app-alive-search">
                    <form action="${pageContext.request.contextPath}/searchinfo" method="post" class="uk-form uk-margin-small-top">
                       <div class="uk-form-row uk-margin-top uk-margin-large-left">
                           <div class="uk-form-icon">
                               <i class="uk-icon-search "></i>
                               <input type="text" name="title" class="" placeholder="搜索 hilive">
                           </div>
                           <input class="uk-button " type="submit" value="搜索" >
                       </div>

                    </form>
                </li>

            </ul>


            <div class=" uk-navbar-flip">

                <div class="uk-navbar-content  uk-button-dropdown" data-uk-dropdown="{mode:'click'}">
                <c:choose>
                    <c:when test="${userinfo == null}">
                        <div class="uk-button-group">
                            <a href="${pageContext.request.contextPath}/reg" class="uk-button uk-button-primary uk-margin-right">免费注册</a>
                            <a href="${pageContext.request.contextPath}/login1" class="uk-button uk-button-primary uk-margin-right">立即登录</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="#" class="uk-thumbnail ">
                            <img class="uk-border-circle" src="${pageContext.request.contextPath}/upload/${userinfo.avatar}" width="32" height="32" id="nav-avatar">
                        </a>
                        <div class="uk-dropdown uk-dropdown-bottom">
                            <ul class="uk-nav uk-nav-dropdown">
                                <li><a href="${pageContext.request.contextPath}/currentuser/write_article"><i class="uk-icon-pencil uk-icon-justify "></i>写游记</a></li>
                                <li class="uk-nav-divider"></li>
                                <li><a href="${pageContext.request.contextPath}/currentuser/myHomePage"><i class="uk-icon-home uk-icon-justify "></i>我的主页</a></li>
                                <li><a href="#"><i class="uk-icon-heartbeat uk-icon-justify "></i>我的帖子</a></li>
                                <li class="uk-nav-divider"></li>
                                <li><a href="${pageContext.request.contextPath}/logout"><i class="uk-icon-leaf uk-icon-justify "></i>登出</a></li>
                            </ul>
                        </div>
                    </c:otherwise>
                </c:choose>
                </div>
            </div>
        </nav>
    </div>
</header>

<div class="app-height-65">

</div>

