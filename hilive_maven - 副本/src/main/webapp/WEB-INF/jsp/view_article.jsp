 <%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/10
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!DOCTYPE html>
<html>
<head>
    <link href="${pageContext.request.contextPath}/assets/uikit/css/uikit.almost-flat.css">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
    <script src="${pageContext.request.contextPath}/assets/layer/layer.js"></script>
    <title>Title</title>
    <script>

        $(function () {
         //加载前几篇文章
            $.ajax({
                url:'${pageContext.request.contextPath}/getMoreArticle/'+0,
                type:"get",
                dataType:"json",
                success:function (res) {
                        var html=template("ajax_article",res);
                        $('#all_article').html(html);
                }
            })
            //当视口高度和滚动高度等于文档高度时，再向服务器请求文章
            var last_send_id=0;
            var article_last_id=0;
            $(window).scroll(function () {
//                console.log($(document).height())
//                console.log(Math.round($(window).scrollTop()))
//                console.log($(window).height())
                var last_id=$('#all_article li:last-child').attr('id');

                if(parseInt($(window).scrollTop())+$(window).height()+1==$(document).height())
                {
                      layer.load();
                      if(last_send_id!=article_last_id)
                      {
                         if(last_send_id==last_id)
                    {
                       return;
                    }
                    last_send_id=last_id;

                              }

                    $.ajax({
                        url:'${pageContext.request.contextPath}/getMoreArticle/'+last_id,
                        type:"get",
                        dataType:"json",
                        success:function (res) {

                            if(res.length==0)
                            {
                                layer.msg('没有更多文章啦');
                                 article_last_id=last_id;
                            }
                            layer.closeAll('loading');
                            var html=template("ajax_article",res);
                            $('#all_article').html($('#all_article').html()+html);
                        }
                    })
                }

            });



            $('.isPraise').each(function (i,elem) {
                if($(elem).val()==1)
                {
                    $(elem).next().css('backgroundColor','red');

                }
            })

//            点赞
            $('.praise').each(function (i, elem) {
                $(elem).click(function () {
                    alert("aa");
                    if(${userinfo==null})
                    {
                        top.location = 'login1';
                    }
                    else {
                        $.ajax({
                        url: "${pageContext.request.contextPath}/praise/" + $(elem).next().val(),
                        type: "get",
                        datatype: "text",
                        success: function (res) {

                            if (res == 1) {
                                $(elem).find('span').html(parseInt($(elem).find('span').html()) + 1);
                                $(elem).css('backgroundColor', 'red');
                            }
                            if (res == 0){
                                $(elem).find('span').html(parseInt($(elem).find('span').html()) - 1);
                                $(elem).css('backgroundColor', 'white');
                            }
                        }
                    })}

                })

            })
//            收藏
            $('.collection').each(function (i, elem) {
                $(elem).click(function () {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/do_transmit/" + $(elem).next().val(),
                        type: "get",
                        datatype: "json",
                        success: function (res) {
                            if(res==0)
                            {
                                top.location = '${pageContext.request.contextPath}/login1';
                            }
                            if (res == 1) {
                                top.location = "${pageContext.request.contextPath}/currentuser/myHomePage";
                                $(elem).find('span').html(parseInt($(elem).find('span').html()) + 1);
                            }
                        }
                    })
                })

            })
        })


    </script>
    <style>
        li {
            list-style-type: none;
        }
    </style>
    <%@include file="common/js_css_header.jsp"%>
</head>
<body style="background-color: #F4F5F5">
<%@include file="common/header.jsp" %>
<script type="text/html" id="ajax_article">
    {{each}}
    <li id="{{$value.id}}">

        <div id="eachArticle" class=" uk-panel uk-panel-box uk-panel-box-secondary uk-panel-hover"
             style="border: 0">

            <div class="uk-grid uk-margin-top">

                <div class="uk-width-medium-2-10">
                    <a href="${pageContext.request.contextPath}/otheruser/{{$value.userid}}"><img
                            src="${pageContext.request.contextPath}/upload/{{$value.avatar}}"
                            style="width: 50px;height: 50px;border-radius: 50%"></a>

                </div>
                <div class="uk-width-medium-7-10 " style="margin-top: 2px">
                    <a href="${pageContext.request.contextPath}/details/{{$value.id}}"
                       class="uk-text-large uk-text-bold uk-margin-top uk-margin-right uk-text-truncate"
                       style="text-decoration: none;color:black">{{$value.id}}{{$value.title}}</a><span
                        style="color:#B9BACD">{{$value.createtime}}</span>
                </div>
            </div>

            <div class="uk-grid ">

                <div class="uk-width-medium-2-10 ">
                    <a href="${pageContext.request.contextPath}/otheruser/{{$value.userid}}"
                       class="uk-text-bold uk-margin-left"
                       style="text-decoration: none;color:#B71ED7">{{$value.username}}</a>
                </div>
                <div class="uk-width-medium-7-10 ">
                    <input type="hidden" value="{{$value.isPraise}}" class="isPraise">
                    <span class="uk-icon-heart uk-text-bold uk-text-small praise"
                          style="cursor:pointer;color: #B2BAC2;padding: 4px 10px;border: 1px solid #EDEEEF"><span
                            class="uk-text-bold uk-margin-small-left">{{$value.praise_count}}</span></span><input
                        type="hidden" value="{{$value.id}}">
                    <span class="uk-icon-file uk-text-bold  uk-text-small collection"
                          style="cursor:pointer;color: #B2BAC2;padding: 4px 10px;border: 1px solid #EDEEEF"> <span
                            class="uk-text-bold uk-margin-small-left">{{$value.share_count}}</span></span><input
                        type="hidden" value="{{$value.id}}">
                </div>
            </div>

        </div>

    </li>
    {{/each}}
</script>

<c:choose>
<c:when test="${allArticle.size()!=0}">
<div class="uk-grid uk-container uk-container-center">
    <div class="uk-width-medium-2-3">
        <ul style="text-decoration: none" id="all_article" >

        </ul>


    </div>
    <div class="uk-width-medium-1-3">
        <div class="uk-margin-top"><a href="${pageContext.request.contextPath}/currentuser/write_article "
                                      style="padding: 20px 50px;background-color: orangered;border-radius: 2em;color:white;text-decoration: none">写游记</a>
        </div>
    </div>

    </c:when>
    <c:otherwise>
    <h3>还没有用户贡献文章哦，快去写一篇吧</h3>
    <div class="uk-margin-top"><a href="${pageContext.request.contextPath}/currentuser/write_article "
                                  style="padding: 20px 50px;background-color: orangered;border-radius: 2em;color:white;text-decoration: none">写游记</a>
        </c:otherwise>
        </c:choose>



</body>
</html>
