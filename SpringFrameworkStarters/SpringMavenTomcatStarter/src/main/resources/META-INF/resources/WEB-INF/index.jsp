<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head></head>
<body>
<h1>Hello!</h1>
<p>The server's current time is:</p>
<p><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${now}"/></p>
</body>
</html>