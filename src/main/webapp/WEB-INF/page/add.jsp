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

        function add(){
            $.post("<%=request.getContextPath()%>/user/insert",
                $("#fm").serialize(),
                function(data){
                if(data.code != 200){
                   alert(data.msg);
                   return;
                }
                location.href = "<%=request.getContextPath()%>/user/toShow";
            })

    }


    </script>
</head>

<body style="text-align: center">
    <form id = "fm">
        姓名：<input type = "text" name = "userName"/><br/>
        密码：<input type = "text" name = "userPwd"/><br/>
        年龄：<input type = "text" name = "age"/><br/>
        性别：
            男<input type = "radio" name = "sex" value="1"/>
            女<input type = "radio" name = "sex" value="2"/><br/>
        爱好：
        吃饭<input type = "radio" name = "hobbys" value="1"/>
        睡觉<input type = "radio" name = "hobbys" value="2"/>
        打游戏<input type = "radio" name = "hobbys" value="3"/>
        上网<input type = "radio" name = "hobbys" value="4"/><br/>
        <input type = "button" value = "提交" onclick="add()"/>
    </form>
</body>
</html>
