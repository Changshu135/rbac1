<%--
  Created by IntelliJ IDEA.
  User: Changshu
  Date: 2020/12/29
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>角色页面</title>
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
                        <li><a href="#">角色列表</a></li>
                    </ol>
                </div>

                <!-- Table -->
                <table class="table table-bordered table-hover" id="dept_table">
                    <thead>
                    <th>角色编号</th>
                    <th>角色名称</th>
                    <th>角色描述</th>
                    <th>直接下属角色</th>
                    <th>权限管理</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${roles}" var="role">
                        <tr>
                            <td>${role.role_id}</td>
                            <td>${role.role_name}</td>
                            <td>${role.role_desc}</td>
                            <td>${role.sub_rid}</td>
                            <td>
                                <!--<a href="#" role="button" class="btn btn-primary dept_in_btn" data-toggle="modal" data-target=".emp-add-modal">进入</a>
                                <a href="#" role="button" class="btn btn-info dept_use_btn" data-toggle="modal" data-target=".emp-add-modal">使用</a>
                                <a href="#" role="button" class="btn btn-danger dept_close_btn" data-toggle="modal" data-target=".emp-add-modal">关闭</a>
                                <a href="#" role="button" class="btn btn-success dept_open_btn" data-toggle="modal" data-target=".emp-add-modal">设立</a>-->
                                <a href="#" role="button" class="btn btn-success dept_update_btn" data-toggle="modal" data-target=".emp-update-modal">修改角色</a>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                    <div class="panel-body">
                        <nav aria-label="Page navigation" class="pull-right">
                            <a href="#" role="button" class="btn btn-primary dept_edit_btn" data-toggle="modal" data-target=".roles-add-modal">新增</a>
                        </nav>
                    </div><!--panel-body end-->


            </div> <!-- panel-success end-->

        </div>  <!-- col-sm-10 end-->
    </div> <!--dept_body end-->
</div>  <!--hrms_dept_container end-->

<%@ include file="buildingrights.jsp"%>
<%@ include file="rolesnew.jsp"%>
<%@ include file="rolesupdate.jsp"%>


<script type="text/javascript">

    <!--进入-->
    $(".dept_in_btn").click(function () {
        var roles_id=$(this).parent().parent().find("td:eq(0)").text();
        $(".input_roles_id").attr("value",roles_id);
        $(".input_rights_name").attr("value",'进入');

    });
    <!--使用-->
    $(".dept_use_btn").click(function () {
        var roles_id=$(this).parent().parent().find("td:eq(0)").text();
        $(".input_roles_id").attr("value",roles_id);
        $(".input_rights_name").attr("value",'使用');
    });
    <!--关闭-->
    $(".dept_close_btn").click(function () {
        var roles_id=$(this).parent().parent().find("td:eq(0)").text();
        $(".input_roles_id").attr("value",roles_id);
        $(".input_rights_name").attr("value",'关闭');
    });
    <!--设立-->
    $(".dept_open_btn").click(function () {
        var roles_id=$(this).parent().parent().find("td:eq(0)").text();
        $(".input_roles_id").attr("value",roles_id);
        $(".input_rights_name").attr("value",'设立');
    });
    <!--新增-->
    $(".dept_edit_btn").click(function () {
        var roles_id=$(this).parent().parent().find("td:eq(0)").text();
        $(".input_roles_id").attr("value",roles_id);
        $(".input_rights_name").attr("value",'设立');
    });
    <!--修改-->
    $(".dept_update_btn").click(function () {
        var roles_id=$(this).parent().parent().find("td:eq(0)").text();
        var role_name=$(this).parent().parent().find("td:eq(1)").text();
        var role_desc=$(this).parent().parent().find("td:eq(2)").text();
<%--        ${sessionScope.put('session_roles_id', 'roles_id')};--%>
        $(".update_roles_id").attr("value",roles_id);
        $(".update_roles_name").attr("value",role_name);
        $(".update_roles_desc").attr("value",role_desc);
    });



</script>


</body>
</html>
