<%--
  Created by IntelliJ IDEA.
  User: Changshu
  Date: 2020/12/31
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色添加</title>
</head>
<body>
<div class="modal fade emp-update-modal" tabindex="-1" role="dialog" aria-labelledby="emp-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">用户修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_emp_form">
                    <input type="text" style="display: none" name="user_id" class="form-control update_user_id" id="update_user_id"/>
                    <div class="form-group">
                        <label for="update_inputUsername" class="col-sm-2 control-label">用户名:</label>
                        <div class="col-sm-8">
                            <input type="text" name="username" class="form-control update_inputUsername" id="update_inputUsername"/>
                            <span id="helpBlock_update_inputName" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_password" class="col-sm-2 control-label">密码:</label>
                        <div class="col-sm-8">
                            <input type="text" name="password" class="form-control update_password" id="update_password"/>
                            <span id="helpBlock_update_password" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_gender" class="col-sm-2 control-label">性别:</label>
                        <div class="col-sm-8" id="update_gender">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="optionsRadios3" value="男" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="optionsRadios4"  value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_realName" class="col-sm-2 control-label">真实姓名:</label>
                        <div class="col-sm-8">
                            <input type="text" name="realName" class="form-control update_realName" id="update_realName">
                            <span id="helpBlock_update_desc" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_roles" class="col-sm-2 control-label">角色:</label>
                        <select class="form-control select_update_roles" name="rid" id="update_roles">
                            <c:forEach items="${roles}" var="role">
                                <option value="${role.role_id}">${role.role_name}</option>
                            </c:forEach>
                        </select>
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


    $(".emp_add_btn").click(function () {


        $('.roles-add-modal').modal({
            backdrop:static,
            keyboard:true
        });
    });

    $(".emp_save_btn").click(function () {

        // var role_ids=search();
        // var role_id=$('.update_roles_id').val();
        // var roles_name=$('.update_roles_name').val();
        // var role_desc=$('.update_roles_desc').val();
        $.ajax({
            url:"${pageContext.request.contextPath}/user/updateOneUser",
            dataType: "json",
            type:"POST",
            data:$(".update_emp_form").serialize(),
            success:function (result) {
                if (result.code == 100) {
                    window.location.href = "${pageContext.request.contextPath}/user/getAllUsers";
                }
            }

        });
    });
</script>
</body>
</html>
