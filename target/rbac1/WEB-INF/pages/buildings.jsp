<%--
  Created by IntelliJ IDEA.
  User: Changshu
  Date: 2020/12/28
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>建筑页面</title>
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
                        <li><a href="#">机构列表</a></li>
                    </ol>
                </div>

                <!-- Table -->
                <table class="table table-bordered table-hover" id="dept_table">
                    <thead>
                    <th>机构编号</th>
                    <th>机构名称</th>
                    <th>机构描述</th>
                    <th>状态</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${buildings}" var="building">
                        <tr>
                            <td>${building.building_id}</td>
                            <td>${building.building_name}</td>
                            <td>${building.building_desc}</td>
                            <c:if test="${building.open}">
                                <td>开启</td>
                            </c:if>
                            <c:if test="${building.open==false}">
                                <td>关闭</td>
                            </c:if>
                            <td>
                                <c:if test="${building.open}">
                                    <a href="#" role="button" class="btn btn-primary dept_in_btn">进入</a>
                                    <a href="#" role="button" class="btn btn-info dept_use_btn">使用</a>
                                    <a href="#" role="button" class="btn btn-danger dept_close_btn">关闭</a>
                                </c:if>
                                <c:if test="${building.open==false}">
                                    <a href="#" role="button" class="btn btn-success dept_open_btn">开启</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:if test="${sessionScope.user.role.role_name.contains('校长')}">
                    <div class="panel-body">
                    <nav aria-label="Page navigation" class="pull-right">
                    <a href="#" role="button" class="btn btn-primary dept_edit_btn" data-toggle="modal" data-target=".emp-add-modal">新增</a>
                    </nav>
                    </div><!--panel-body end-->
                </c:if>

            </div> <!-- panel-success end-->

        </div>  <!-- col-sm-10 end-->
    </div> <!--dept_body end-->
</div>  <!--hrms_dept_container end-->

<%@ include file="buildingsnew.jsp"%>

<script type="text/javascript">
    <!--进入-->
    $(".dept_in_btn").click(function () {
        var bId=$(this).parent().parent().find("td:eq(0)").text();
        var building_name=$(this).parent().parent().find("td:eq(1)").text();
        var roles_id=${sessionScope.user.role.role_id}
        $.ajax({
            url:"${pageContext.request.contextPath}/building/isPermitted",
            dataType: "json",
            type:"POST",
            data: { roles_id: roles_id, building_id: bId,rights_name:"进入" },
            success:function (result) {
                if (result.code == 100){
                    alert("进入【"+building_name+"】成功！");
                }else {
                    alert("您没有权限进入【"+building_name+"】");
                }
            }
        });
    });


    <!--使用-->
    $(".dept_use_btn").click(function () {
        var bId=$(this).parent().parent().find("td:eq(0)").text();
        var building_name=$(this).parent().parent().find("td:eq(1)").text();
        var roles_id=${sessionScope.user.role.role_id}
            $.ajax({
                url:"${pageContext.request.contextPath}/building/isPermitted",
                dataType: "json",
                type:"POST",
                data: { roles_id: roles_id, building_id: bId,rights_name:"使用" },
                success:function (result) {
                    if (result.code == 100){
                        alert("使用【"+building_name+"】成功！");
                    }else {
                        alert("您没有权限使用【"+building_name+"】");
                    }
                }
            });
    });

    <!--关闭-->
    $(".dept_close_btn").click(function () {
        var bId=$(this).parent().parent().find("td:eq(0)").text();
        var building_name=$(this).parent().parent().find("td:eq(1)").text();
        var roles_id=${sessionScope.user.role.role_id}
            $.ajax({
                url:"${pageContext.request.contextPath}/building/switchOpen",
                dataType: "json",
                type:"POST",
                data: { roles_id: roles_id, building_id: bId,rights_name:"关闭" },
                success:function (result) {
                    if (result.code == 100){
                        window.location.href = "${pageContext.request.contextPath}/building/toBuildingPage";
                    }else {
                        alert("您没有权限关闭【"+building_name+"】");
                    }
                }
            });
    });

    <!--开启-->
    $(".dept_open_btn").click(function () {
        var bId=$(this).parent().parent().find("td:eq(0)").text();
        var building_name=$(this).parent().parent().find("td:eq(1)").text();
        var roles_id=${sessionScope.user.role.role_id}
            $.ajax({
                url:"${pageContext.request.contextPath}/building/switchOpen",
                dataType: "json",
                type:"POST",
                data: { roles_id: roles_id, building_id: bId,rights_name:"关闭" },
                success:function (result) {
                    if (result.code == 100){
                        window.location.href = "${pageContext.request.contextPath}/building/toBuildingPage";
                    }else {
                        alert("您没有权限开启【"+building_name+"】");
                    }
                }
            });
    });


</script>


</body>
</html>
