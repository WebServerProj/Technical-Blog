<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Logout</title>
</head>
<body>
<%
	session.invalidate();
	response.sendRedirect("../main/main.jsp");
	%>


</body>
</html>