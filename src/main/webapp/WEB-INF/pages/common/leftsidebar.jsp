<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="panel-group col-sm-2" id="hrms_sidebar_left" role="tablist" aria-multiselectable="true">
    <ul class="nav nav-pills nav-stacked emp_sidebar">
        <li role="presentation" class="active">
            <a href="#" data-toggle="collapse" data-target="#collapse_emp">
                <span class="glyphicon glyphicon-user" aria-hidden="true">实验内容</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_emp">
                <li role="presentation"><a href="#" class="list_buildings">机构</a></li>
                <li role="presentation"><a href="#" role="button" class="building_canteen">角色管理</a></li>
                <li role="presentation"><a href="#" class="building_studing">用户管理</a></li>
            </ul>
        </li>
    </ul>

</div><!-- /.panel-group，#hrms_sidebar_left -->

<script type="text/javascript">
    //跳转到机构页面
    $(".list_buildings").click(function () {
        $(this).attr("href", "${pageContext.request.contextPath}/building/toBuildingPage");
    });
    //跳转到角色管理页面
    $(".building_canteen").click(function () {
        if("${sessionScope.user.role.role_name}"!="校长"){
            alert("请以校长身份登录");
            return false;
        }
        $(this).attr("href", "${pageContext.request.contextPath}/roles/getAllRoles");
    });
    //跳转到用户管理页面
    $(".building_studing").click(function () {
        if("${sessionScope.user.role.role_name}"!="校长"){
            alert("请以校长身份登录");
            return false;
        }
        $(this).attr("href", "${pageContext.request.contextPath}/user/getAllUsers");
    });

</script>
</body>
</html>
