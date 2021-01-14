<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html dir="ltr" lang="en">
<head>
    <title>Welcome To Spring Boot War Template</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible"/>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
    <link href="" rel="stylesheet" type="text/css"/>
</head>
<body>
<div>
<h1>Welcome To Spring Boot War Template from /WEB-INF/index.jsp</h1>
</div>
<div>
    <p>${requestScope.returnMsg}</p>
</div>
<div>
    <p>Direct from fmt:message is : <fmt:message key="global.welcome"/></p>
</div>
<script src="" type="text/javascript"></script>
<script type="text/javascript">
</script>
</body>
</html>
