<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 18-4-8
  Time: 上午11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>写帖子</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/editor-md-master/css/editormd.css" />
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/editor-md-master/editormd.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/uikit/css/uikit.almost-flat.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/uikit/js/uikit.js"></script>
    <style>
        /*发表文章*/
        .turnonart {
            width: 336px;
            border: 1px solid black;
        }


        .turnonart .li1 {
            color: #949CA5;
            font-size: 20px;
            font-weight: bold;
        }

        .turnonart .li2 {
            color: #949CA5;
            font-size: 18px;
        }

        .turnonart li .app-submit {
            background-color: white;
            border: 1px solid #007BFF;
            color: #007BFF;
        }

        .turnonart li ul li a {
            color: #949494;
            background-color: #FFFFFF;
        }

        .turnonart li ul li a:hover {
            color: #007BFF;
            background-color: #F7FFFF;
        }

        .turnonart li ul li .app-cate {
            color: #007BFF;
            background-color: #F7FFFF;
        }
    </style>
    <script>
        $(function () {
            var testEditor = editormd({
                id: "test-editormd",
//                height: 840,
                height:"100%",
                width: "100%",
                placeholder: "Markdown编辑器",
                path: "${pageContext.request.contextPath}/assets/editor-md-master/lib/",
                toolbarIcons: function () {
                    // Or return editormd.toolbarModes[name]; // full, simple, mini
                    // Using "||" set icons align right.
                    return ["undo", "redo", "|", "watch", "fullscreen", "preview"]
                },
                //toolbar  : false,             // 关闭工具栏
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
                onload: function () {

                    this.on('paste', function () {
                        console.log(1);
                    });

                },
                onpreviewing : function() {
                    this.watch();
                    console.log("onpreviewing =>", this, this.id, this.settings);
                    // on previewing you can custom css .editormd-preview-active
                },

                onpreviewed : function() {
                    console.log("onpreviewed =>", this, this.id, this.settings);
                    this.unwatch();
                }
            });
        });
    </script>
    <%@include file="common/js_css_header.jsp"%>
</head>
<body>
<%@include file="common/header.jsp"%>
<div style="height: 10px"></div>
<form action="${pageContext.request.contextPath}/addPost" method="post" enctype="multipart/form-data" class="uk-form">
    <div class="uk-margin-left">
        <textarea rows="1" cols="40" name="title" class="uk-width-4-5 uk-margin-bottom" placeholder="输入帖子标题"></textarea>
        <input type="submit" value="发布帖子" class="uk-button uk-margin-small-left">
    </div>
    <div class="editormd" id="test-editormd">
        <textarea name="topic_markdown_content" id = "topic_markdown_content" class="editormd-markdown-textarea"></textarea><br>
    </div>
</form>

</body>
</html>
