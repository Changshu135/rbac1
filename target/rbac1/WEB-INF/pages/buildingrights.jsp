<%--
  Created by IntelliJ IDEA.
  User: Changshu
  Date: 2020/12/29
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>权限更新</title>
</head>
<body>
<div class="modal fade emp-add-modal" tabindex="-1" role="dialog" aria-labelledby="emp-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">权限更新</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_emp_form">
                    <div class="col-sm-8" style="display: none">
                        <input type="text" disabled name="rights_name" class="form-control input_rights_name" id="add_inputName"/>
                        <input type="text" disabled name="roles_id" class="form-control input_roles_id" id="add_roles_id"/>
                    </div>
                    <div class="form-group">
                        <c:forEach items="${buildings}" var="building">

                            <div class="checkbox">
                                <label><input name="check_building_ids" type="checkbox" value="${building.building_id}">${building.building_name}</label>
                            </div>
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
        // var building_ids="";
        //var building_ids=[];
        var building_ids=[];
        //var radios=$('checkbox[name=check_building_ids]').val();
        // var radios=$("input[name=check_building_ids]");
        $("input[name='check_building_ids']:checked").each(function(){
            building_ids.push($(this).val());
            // building_ids[i] =$(this).val();
        });

        return building_ids;
    }


    $(".emp_add_btn").click(function () {


        $('.emp-add-modal').modal({
            backdrop:static,
            keyboard:true
        });
    });

    $(".emp_save_btn").click(function () {
        var building_ids=search();
        var roles_id=$('.input_roles_id').val();
        var rights_name=$('.input_rights_name').val();
        $.ajax({
            url:"${pageContext.request.contextPath}/roles/updateBuildingRights",
            type:"POST",
            traditional: true,//这里设置为true
            data:{"roles_id":roles_id,"rights_name":rights_name,"building_ids":building_ids},
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

