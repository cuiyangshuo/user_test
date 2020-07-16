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

        function update(){
            $.post("<%=request.getContextPath()%>/user/update",
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

<body>
    <form id = "fm">
        <input type="hidden" name="id" value = ${user.id} />
        姓名：<input type = "text" name = "userName" value =${user.userName} /><br/>
        密码：<input type = "text" name = "userPwd" value = ${user.userPwd} /><br/>
        年龄：<input type = "text" name = "age" value = ${user.age} /><br/>
        性别：
             <input type = "radio" name = "sex" value = "1" <c:if test="${user.sex == 1}">checked = checked</c:if>/>男
             <input type = "radio" name = "sex" value = "2" <c:if test="${user.sex == 2}">checked = checked</c:if>/>女<br/>
        爱好：

        <input type = "radio" name = "hobbys" value = "1" <c:if test="${user.hobbys == 1}">checked = checked</c:if>/>吃饭
        <input type = "radio" name = "hobbys" value = "2" <c:if test="${user.hobbys == 2}">checked = checked</c:if>/>睡觉
        <input type = "radio" name = "hobbys" value = "3" <c:if test="${user.hobbys == 3}">checked = checked</c:if>/>打游戏
        <input type = "radio" name = "hobbys" value = "4" <c:if test="${user.hobbys == 4}">checked = checked</c:if>/>上网<br/>
        <input type = "button" value = "提交" onclick="update()"/>
    </form>
</body>
</html>
