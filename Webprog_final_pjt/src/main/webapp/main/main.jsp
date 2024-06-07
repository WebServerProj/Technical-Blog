<%@page import="jakarta.websocket.OnError"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Magazine"%>
<%@ page import="dao.MagazineRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>

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
					<!-- Flex container 생성 및 요소 간 간격 설정 -->
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

	<!-- Search Bar -->
	<div class="container mt-3">
		<form action="../search/search_result.jsp" method="get" class="d-flex">
			<input class="form-control me-2" type="search" placeholder="Search"
				aria-label="Search" name="query">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
	</div>

	<!-- Main Content -->
	<!-- 지금 css에서 하나하나 블록으로 들어가고 있어서 이걸 인라인 요소처럼 바꿔야 제대로 데이터가 뿌려질 것 같다. -->
	<%@ include file="../DBconn/dbconn.jsp"%>
	<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM WRITEDATA";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while (rs.next()) {
	%>
	<div class="row align-items-md-stretch text-center">
		<div class="col-md-4">
			<div class="h-100 p-2">
				<img src="../resources/img/<%=rs.getString("MAGAZINEID")%>.jpg"
					onerror="../resources/images/error.png" class="img-fluid"
					style="width: 250; height: 350">
				<h5>
					<b><%=rs.getString("magTitle")%></b>
				</h5>
				<p>
					<%=rs.getString("magContent").substring(0, 20)%>...
				</p>
				<p><%=rs.getString("clientId")%>
					<a href="../Mag_info/Mag.jsp?id=<%=rs.getString("MAGAZINEID")%>"
						class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
				<p>
					by
					<%=rs.getString("clientId")%></p>
			</div>
		</div>
		<%
		}
		if (rs != null)
		rs.close();
		if (pstmt != null)
		pstmt.close();
		if (conn != null)
		conn.close();
		%>
	</div>
</body>
</html>
