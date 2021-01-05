<%--
  Created by IntelliJ IDEA.
  User: Changshu
  Date: 2020/12/31
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户页面</title>
</head>
<body>
<div class="hrms_dept_container">
    <!-- 导航栏-->
    <%@ include file="./common/head.jsp"%>
    <!-- 中间部分（左侧栏+表格内容） -->
    <div class="hrms_dept_body" style="position:relative; top:-15px;">
        <!-- 左侧栏 -->
        <%@ include file="./common/leftsidebar.jsp"%>
        <!--表格内容-->
        <div class="dept_info col-sm-10">
            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">用户列表</a></li>
                    </ol>
                </div>

                <!-- Table -->
                <table class="table table-bordered table-hover" id="dept_table">
                    <thead>
                    <th>用户编号</th>
                    <th>用户名</th>
                    <th>用户密码</th>
                    <th>用户性别</th>
                    <th>真实姓名</th>
                    <th>角色</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td>${user.user_id}</td>
                            <td>${user.username}</td>
                            <td>${user.password}</td>
                            <td>${user.gender}</td>
                            <td>${user.realName}</td>
                            <td>${user.role.role_name}</td>
                            <td>
                                <a href="#" role="button" class="btn btn-info dept_use_btn" data-toggle="modal" data-target=".emp-update-modal" >编辑</a>
                                <a href="#" role="button" class="btn btn-danger dept_close_btn">删除</a>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="panel-body">
                    <nav aria-label="Page navigation" class="pull-right">
                        <a href="#" role="button" class="btn btn-primary dept_edit_btn" data-toggle="modal" data-target=".emp-add-modal">新增</a>
                    </nav>
                </div><!--panel-body end-->

            </div> <!-- panel-success end-->

        </div>  <!-- col-sm-10 end-->
    </div> <!--dept_body end-->
</div>  <!--hrms_dept_container end-->

<%@ include file="usernew.jsp"%>
<%@ include file="usersupdate.jsp"%>

<script type="text/javascript">

    <!--编辑-->
    $(".dept_use_btn").click(function () {
        var user_id=$(this).parent().parent().find("td:eq(0)").text();
        var username=$(this).parent().parent().find("td:eq(1)").text();
        var password=$(this).parent().parent().find("td:eq(2)").text();
        var gender=$(this).parent().parent().find("td:eq(3)").text();
        var realName=$(this).parent().parent().find("td:eq(4)").text();
        // var role_name=$(this).parent().parent().find("td:eq(5)").text();
        // alert(user_id);
        $(".update_user_id").attr("value",user_id);
        $(".update_inputUsername").attr("value",username);
        $(".update_password").attr("value",password);
        $(".update_realName").attr("value",realName);

    });

    <!--删除-->
    $(".dept_close_btn").click(function () {
        var user_id=$(this).parent().parent().find("td:eq(0)").text();
            $.ajax({
                url:"${pageContext.request.contextPath}/user/deleteOneUser",
                dataType: "json",
                type:"GET",
                data: { "user_id": user_id},
                success:function (result) {
                    if (result.code == 100){
                        window.location.href = "${pageContext.request.contextPath}/user/getAllUsers";
                    }
                }
            });
    });

    <!--新增-->
    // $(".dept_open_btn").click(function () {
    //     var user_id=$(this).parent().parent().find("td:eq(0)").text();
    //     $(".update_user_id").attr("value",user_id);
    // });


</script>


</body>
</html>
