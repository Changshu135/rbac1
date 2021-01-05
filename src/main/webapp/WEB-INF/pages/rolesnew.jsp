<%--
  Created by IntelliJ IDEA.
  User: Changshu
  Date: 2020/12/30
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色添加</title>
</head>
<body>
<div class="modal fade roles-add-modal" tabindex="-1" role="dialog" aria-labelledby="roles-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">角色添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_emp_form">
                    <label for="add_role_name" class="col-sm-2 control-label">角色名称:</label>
                    <input type="text" name="roles_name" class="form-control input_roles_name" id="add_role_name"/>
                    <label for="add_role_desc" class="col-sm-2 control-label">角色描述:</label>
                    <input type="text" name="role_desc" class="form-control input_roles_desc" id="add_role_desc"/>
                    <div style="display:block" id="add_sub_role_ids">
                        <c:forEach items="${roles}" var="role">
                            <c:if test="${role.role_name!='校长'}">
                                <div class="checkbox" >
                                    <label><input name="check_role_ids" type="checkbox" value="${role.role_id}">
                                            ${role.role_name}
                                    </label>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary emp_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">

    function search(){
        var role_ids=[];
        $("input[name='check_role_ids']:checked").each(function(){
            role_ids.push($(this).val());
        });

        return role_ids;
    }

    $(".emp_add_btn").click(function () {


        $('.roles-add-modal').modal({
            backdrop:static,
            keyboard:true
        });
    });

    $(".emp_save_btn").click(function () {

        var role_ids=search();
        var roles_name=$('.input_roles_name').val();
        var role_desc=$('.input_roles_desc').val();
        $.ajax({
            url:"${pageContext.request.contextPath}/roles/insertOneRole",
            type:"POST",
            traditional: true,//这里设置为true
            data:{"role_ids":role_ids,"roles_name":roles_name,"role_desc":role_desc},
            success:function (result) {
                if (result.code == 100) {
                    window.location.href = "${pageContext.request.contextPath}/roles/getAllRoles";
                }
            }

        });
    });
</script>
</body>
</html>
