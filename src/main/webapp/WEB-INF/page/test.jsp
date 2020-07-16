<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: CYS
  Date: 2020/7/7
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src = "<%=request.getContextPath()%>/res/jquery-1.12.4.js"></script>
    <script type="text/javascript">

        function add() {
            $.ajax({
                url:"<%=request.getContextPath()%>/user/",
                dataType:"json",
                type:"post",
                data: {
                    "_method": "POST","userName":"putput",
                },success: function (data) {
                    alert(data.msg);
                }
            });
        }
        function upd() {
            $.ajax({
                url:"<%=request.getContextPath()%>/user/",
                dataType:"json",
                contentType: "application/json;charset=utf-8",
                type:"PUT",
                data: JSON.stringify({
                    "id": 11,"userName":"aus",

                }),success: function (data) {
                    alert(data.msg);
                }
            });
        }
        function del() {
            $.ajax({
                url:"<%=request.getContextPath()%>/user/",
                dataType:"json",
                contentType: "application/json;charset=utf-8",
                type:"DELETE",
                data: JSON.stringify({
                    "id": 14,

                }),
                success: function (data) {
                    alert(data.msg);
                }
            });
        }
        function test() {
            $.get("<%=request.getContextPath()%>/user/test",
                function (data) {
                    if(data.code != 200){
                        alert(data.msg);
                        return;
                    }
                    alert(data.msg);
                })
        }
        $(function () {
            $("#upload").click(function () {
                var formData = new FormData($('#uploadForm')[0]);
                $.ajax({
                    type : "post",
                    url: "<%=request.getContextPath()%>/user/upload",
                    data: formData,
                    cache: false,
                    processData: false,
                    contentType: false,
                }).success(function (data) {
                    alert(data);
                }).error(function () {
                    alert("失败");
                });
            });
        });

    </script>
</head>

<body style="text-align: center">
    <form id="uploadForm" enctype="multipart/form-data">
        文件:<input id="file" type="file" name="file">
    </form>
    <button id="upload">上传文件</button>
    <input type="button" value="修改" onclick="upd()" />
    <input type="button" value="增加" onclick="add()" />
    <input type="button" value="删除" onclick="del()" />
    <input type="button" value="跨域测试" onclick="test()" />
</body>
</html>
