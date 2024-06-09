<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="jakarta.websocket.OnError"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../resources/css/custom.css">
<title>Menu</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.message">
	<!-- Header block -->
	<div class="Headerblock">
		<div class="item1">
			<a href="../main/main.jsp"><h1>velog</h1></a>
			<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			
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
						<button type="submit" class="btn btn-dark"><fmt:message key="logout" /></button>
					</form>
					<form action="../update/update_form.jsp" method="post">
						<button type="submit" class="btn btn-dark"><fmt:message key="information" /></button>
					</form>
					<form action="../add/addMagazine.jsp" method="post">
						<button type="submit" class="btn btn-dark"><fmt:message key="cre_art" /></button>
					</form>
					<form action="../checkMyMag/checkMag.jsp" method="post">
						<button type="submit" class="btn btn-dark"><fmt:message key="art_list" /></button>
					</form>
				</div>
				<%
				} else {
				%>
				<div class="d-flex gap-2">
					<form action="../login/login_form.jsp" method="post">
						<button type="submit" class="btn btn-dark"><fmt:message key="login" /></button>
					</form>
					<form action="../join/join_form.jsp" method="post">
						<button type="submit" class="btn btn-dark"><fmt:message key="join" /></button>
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

	<!-- Search Bar -->
	<div class="container mt-3">
		<form name="search" action="../search/search_process.jsp" method="post" class="d-flex" onsubmit="return checkSearch()">
			<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search_value">
			<button class="btn btn-outline-success" type="submit"><fmt:message key="search" /></button>
		</form>
	</div>
	<script type="text/javascript">
    function checkSearch() {
        var search = document.search;
        if (search.search_value.value.trim() === "") {
            alert("검색어를 입력해주세요!");
            return false; // 폼 제출을 막음
        }
        return true; // 폼 제출을 허용
    }
</script>
</fmt:bundle>

</body>
</html>
