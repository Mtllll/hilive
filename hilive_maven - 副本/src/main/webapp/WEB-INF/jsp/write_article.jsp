<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/10
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="${pageContext.request.contextPath}/assets/uikit/css/uikit.almost-flat.css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/editor-md-master/css/editormd.css" />
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/editor-md-master/editormd.min.js"></script>
    <title>Title</title>
    <script>
        $(function () {

            var testEditor = editormd({
                id: "test-editormd",
                height: 640,
                width   : "90%",
                placeholder          : "文明社会，理性评论，支持Markdown",
                path: "${pageContext.request.contextPath}/assets/editor-md-master/lib/",
                toolbarIcons: function () {
                    // Or return editormd.toolbarModes[name]; // full, simple, mini
                    // Using "||" set icons align right.
                    return editormd.toolbarModes['simple'];
                },
//                toolbar  : false,             // 关闭工具栏
                codeFold: true,
                searchReplace: true,
                saveHTMLToTextarea: true,      // 保存 HTML 到 Textarea
                htmlDecode: "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
                emoji: true,
                taskList: true,
                tocm: true,          // Using [TOCM]
                tex: true,                      // 开启科学公式 TeX 语言支持，默认关闭
                //previewCodeHighlight : false,  // 关闭预览窗口的代码高亮，默认开启
                flowChart: true,                // 疑似 Sea.js与 Raphael.js 有冲突，必须先加载 Raphael.js ，Editor.md 才能在 Sea.js 下正常进行；
                sequenceDiagram: true,          // 同上
                //dialogLockScreen : false,      // 设置弹出层对话框不锁屏，全局通用，默认为 true
                //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为 true
                //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为 true
                //dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为 0.1
                //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为 #fff
                imageUpload: true,
                imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL: "{:url('api/uploader/uploadEditorImg?pic_type=10')}",
            });


            $("#submit").click(function () {
                var param = $("#article_form").serialize();
                $.post('${pageContext.request.contextPath}/save_topic', param)
                    .done(function (res) {
                        alert(res);
                        return false;//阻止默认行为
                    })
            })

        });
    </script>
    <%@include file="common/js_css_header.jsp"%>
</head>
<body>

<form action="${pageContext.request.contextPath}/do_write_article" method="post">
    <div class="uk-form-row" style="margin-left: 80px">
        <input type="text" name="title" class="uk-form-large" placeholder="请输入标题" style="border: 0;width: 100%;height: 40px;outline: none">
    </div>
        <div class="editormd" id="test-editormd">
        <textarea class="editormd-markdown-textarea" name="topic_markdown_content" id = "topic_markdown_content">${topic_markdown_content}</textarea>
    </div>
    <div class="uk-form-row uk-text-center">
        <input type="submit" class="uk-width-9-10 uk-text-bold uk-button-success uk-button-large uk-button ">
    </div>
</form>
</body>
</html>
