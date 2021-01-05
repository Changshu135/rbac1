<%--
  Created by IntelliJ IDEA.
  User: Changshu
  Date: 2020/12/28
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>机构添加</title>
</head>
<body>
<div class="modal fade emp-add-modal" tabindex="-1" role="dialog" aria-labelledby="emp-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">机构新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_emp_form">
                    <div class="form-group">
                        <label for="add_inputName" class="col-sm-2 control-label">机构名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="building_name" class="form-control" id="add_inputName" placeholder="如：第一教学楼"/>
                            <span id="helpBlock_add_inputName" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputName" class="col-sm-2 control-label">机构描述</label>
                        <div class="col-sm-8">
                            <input type="text" name="building_desc" class="form-control" id="add_desc" placeholder="如：供师生学习">
                            <span id="helpBlock_add_desc" class="help-block"></span>
                        </div>
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
            url:"${pageContext.request.contextPath}/building/insertOne",
            dataType: "json",
            type:"POST",
            data:$(".add_emp_form").serialize(),
            success:function (result) {
                if (result.code == 100) {
                    window.location.href = "${pageContext.request.contextPath}/building/toBuildingPage";
                }
            }

        });
    });
</script>
</body>
</html>

