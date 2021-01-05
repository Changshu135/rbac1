<%--
  Created by IntelliJ IDEA.
  User: Changshu
  Date: 2020/12/27
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8" />
<title>登录界面</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">
<script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

</head>
<body>
<!-- 登录表单 -->
<div class="container">
    <div class="row">
        <div class="login-panel panel panel-default" style="margin: 280px 380px">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center;">用户登录</h3>
            </div>
            <div class="panel-body">
                <form role="form" action="#" method="post" id="login_form">
                    <fieldset>
                        <div class="form-group">
                            <input class="form-control" placeholder="用户名:" name="username" autofocus>
                            <span id="helpBlock_username" class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="密码:" name="password" type="password" value="">
                            <span id="helpBlock_password" class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <a href="javascript:void(0)" class="btn btn-lg btn-success btn-block" id='login_btn'>登录</a>

                        </div>
                    </fieldset>
                </form>

            </div>
        </div>

    </div>

</div>

<script type="text/javascript">
    $(function () {
        $("#login_btn").click(function () {
            $.ajax({
                //url:"http://localhost:8080/rbac1_war/user/checkLogin",
                url:"${pageContext.request.contextPath}/user/checkLogin",
                method:"POST",
                data:$("#login_form").serialize(),
                success:function (result) {
                    if (result.code == 100) {
                        window.location.href = "${pageContext.request.contextPath}/user/main";
                    } else {
                        alert(result.extendInfo.Login_Error);
                    }
                }
            });
        });
    });
</script>
</body>
</html>
