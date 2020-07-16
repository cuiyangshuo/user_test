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
        $(function(){
            search();
        })
        function search(){
            $.post("<%=request.getContextPath()%>/user/list",
                $("#fm").serialize(),
                function(data){
                    if(data.code != 200){
                        alert(data.mag);
                    }
                    var pageHtml ="";
                    var html="";
                    var userList = data.data.userList;
                    for(var i = 0; i <userList.length; i++){
                        var user = userList[i];
                        html +="<tr>";
                        html +="<td>"+user.userName+"</td>";
                        html +="<td>"+user.userPwd+"</td>";
                        html +="<td>"+user.age+"</td>";
                        if (user.sex ==1){
                            html +="<td>男</td>";
                        } else if (user.sex == 2){
                            html +="<td>女</td>";
                        }
                        if(user.hobbys == 1){
                            html +="<td>吃饭</td>";
                        } else if(user.hobbys == 2){
                            html +="<td>睡觉</td>";
                        } else if(user.hobbys == 3){
                            html +="<td>打游戏</td>";
                        } else if(user.hobbys == 4){
                            html +="<td>上网</td>";
                        }
                        html +="<td>"
                        html +="<input type = 'button'  value = '删除' onclick = 'del("+user.id+")'/>" +
                                 "<input type = 'button'  value = '修改' onclick = 'upd("+user.id+")'/>" +
                            "</td>";
                        html +="</td>"
                        html +="</tr>"
                    }
                    $("#tbd").html(html);
                        pageHtml +="<input type = 'button' value = '上一页' onclick = 'page(0,"+data.data.pages+")'/>";
                        pageHtml +="<input type = 'button' value = '下一页' onclick = 'page(1,"+data.data.pages+")'/>";
                    $("#pageDiv").html(pageHtml);

                });
           }
           function add() {
            location.href = "<%=request.getContextPath()%>/user/toAdd";

           }
        function upd(id) {
            location.href = "<%=request.getContextPath()%>/user/toUpd?id="+id;

        }
           function del(id) {
                $.post("<%=request.getContextPath()%>/user/delete",
                    {"id":id},
                    function (data) {
                    if (data.code != 200){
                        alert(data.msg);
                        return;
                    }
                    location.href = "<%=request.getContextPath()%>/user/toShow";
                })
           }
           function selectUser() {
                search();
           }
        function page(temp,pages) {
            var page = $("#pageNo").val();
            if (temp == 0) {
                if (parseInt(page) - 1 < 1) {
                    alert("已是首页");
                    return;
                }
                $("#pageNo").val(parseInt(page) - 1);
            }
            if (temp == 1) {
                if (parseInt(page) + 1 > pages) {
                    alert("已经尾页了");
                    return;
                }
                $("#pageNo").val(parseInt(page) + 1);
            }
            search();
        }
    </script>
</head>

<body style="text-align:center">
<form id = "fm">
    <input type="hidden" name="pageNo" value = "1" id = "pageNo"/>
    用户名：<input type="text" name="userName" /><br/>
    年龄：<input type="text" name="startAge" />~<input type="text" name="endAge" /><br/>
    性别：
    男<input type="radio" name = "sex" value="1"/>
    女<input type="radio" name = "sex" value="2"/><br/>
    爱好：
        吃饭<input type="checkbox" name = "hobbys" value="1"/>
        睡觉<input type="checkbox" name = "hobbys" value="2"/>
        打游戏<input type="checkbox" name = "hobbys" value="3"/>
        上网<input type="checkbox" name = "hobbys" value="4"/>
    <input type="button" value="查询" onclick="selectUser()">
</form>
<input type = "button" value = "增加" onclick = "add()"/>
    <table align="center">

            <tr>
               <th>姓名</th>
               <th>密码</th>
               <th>年龄</th>
               <th>性别</th>
               <th>爱好</th>
               <th>操作</th>
            </tr>

        <tbody id = "tbd">
        </tbody>
    </table>
<div id = "pageDiv">
</div>
</body>
</html>
