<%--
  Created by IntelliJ IDEA.
  User: Changshu
  Date: 2020/12/27
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>查询了所有的角色信息</h3>
<c:forEach items="${list}" var="user">
    ${user.realName}+${user.role.role_name}+${user.role.sub_rid}<br>
</c:forEach>
</body>
</html>


