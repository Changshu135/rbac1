<%--
  Created by IntelliJ IDEA.
  User: Changshu
  Date: 2020/12/31
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户添加</title>
</head>
<body>
<div class="modal fade emp-add-modal" tabindex="-1" role="dialog" aria-labelledby="emp-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">用户添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_emp_form">
                    <div class="form-group">
                        <label for="add_inputUsername" class="col-sm-2 control-label">用户名:</label>
                        <div class="col-sm-8">
                            <input type="text" name="username" class="form-control" id="add_inputUsername"/>
                            <span id="helpBlock_add_inputName" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_password" class="col-sm-2 control-label">密码:</label>
                        <div class="col-sm-8">
                            <input type="text" name="password" class="form-control" id="add_password"/>
                            <span id="helpBlock_add_password" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_gender" class="col-sm-2 control-label">性别:</label>
                        <div class="col-sm-8" id="add_gender">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="optionsRadios3" value="男" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="optionsRadios4"  value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_realName" class="col-sm-2 control-label">真实姓名:</label>
                        <div class="col-sm-8">
                            <input type="text" name="realName" class="form-control" id="add_realName">
                            <span id="helpBlock_add_desc" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_roles" class="col-sm-2 control-label">角色:</label>
                        <select class="form-control" name="rid" id="add_roles">
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


        $('.emp-add-modal').modal({
            backdrop:static,
            keyboard:true
        });
    });

    $(".emp_save_btn").click(function () {

        $.ajax({
            url:"${pageContext.request.contextPath}/user/insertOneUser",
            dataType: "json",
            type:"POST",
            data:$(".add_emp_form").serialize(),
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
