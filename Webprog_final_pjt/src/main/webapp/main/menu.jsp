<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="jakarta.websocket.OnError"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../resources/css/custom.css">
<title>Magazine</title>
</head>
<body>
	<!-- Header block -->
	<div class="Headerblock">
		<div class="item1">
			<a href="./main.jsp"><h1>velog</h1></a>
		</div>
		<div class="Headerblock-inline">
			<div class="Header-button">
				<%
				String name = (String) session.getAttribute("name");
				if (name != null) {
				%>
<div class="d-flex gap-2"> 
    <span><%=name%>님</span>
    <form action="../login/logout_process.jsp" method="post">
        <button type="submit" class="btn btn-dark">Logout</button>
    </form>
    <form action="../update/update_form.jsp" method="post">
        <button type="submit" class="btn btn-dark">회원정보수정</button>
    </form>
    <form action="../add/addMagazine.jsp" method="post">
        <button type="submit" class="btn btn-dark">새글 작성</button>
    </form>
    <form action="../checkMyMag/checkMag.jsp" method="post">
		<button type="submit" class="btn btn-dark">내글 목록</button>
	</form>
</div>
				<%
				} else {
				%>
				<div class="d-flex gap-2">
				<form action="../login/login_form.jsp" method="post">
					<button type="submit" class="btn btn-dark">Login</button>
				</form>
								<form action="../join/join_form.jsp" method="post">
					<button type="submit" class="btn btn-dark">Join</button>
				</form>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
	
	<!-- Home Tab -->
	<div class="Home-Tab">
		<a id="Home-Tap-Icon"> <img src="../resources/img/trend.png"
			width="30px" height="30px"> <span>New</span>
		</a> <a> <img src="../resources/img/more_index.png" width="24px"
			height="24px">
		</a>
	</div>