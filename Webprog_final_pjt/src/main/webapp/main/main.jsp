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
<link href = "../resources/css/bootstrap.min.css" rel="stylesheet">
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"> -->
<link rel="stylesheet" href="../resources/css/custom.css">
<title>Magazine</title>
</head>
<body>
	<!-- Header block -->
	<div class="Headerblock">
		<div class="item1">
			<!-- 이름정해서 아이콘으로 바꾸고 누르면 옮기는걸로 바꾸기 -->
			<a href="./main.jsp"><h1>velog</h1></a>
		</div>
		<div class="Headerblock-inline">
			<form action="../checkMyMag/checkMag.jsp" method="post">
			<!-- 로그인이 되어있지 않을경우 새글 작성 페이지에서 js alert를 사용해 경고주는 코드 작성예정 -->
				<button type="submit" class="btn btn-dark">내글 목록</button>
			</form>
			<form action="../add/addMagazine.jsp" method="post">
			<!-- 로그인이 되어있지 않을경우 새글 작성 페이지에서 js alert를 사용해 경고주는 코드 작성예정 -->
				<button type="submit" class="btn btn-dark">새글 작성</button>
			</form>
			<!-- <div class="icon">
			<a href="../add/addMagazine.jsp"	>
				<img src="../resources/img/search.png" width="24px" height="24px">
			</a>
			</div> -->
			<div class="Header-button">
				<%
				String name = (String) session.getAttribute("name");
				if (name != null) {
				%>
				<h6><%=name%>님</h6>
				<form action="../login/logout_process.jsp" method="post">
					<button type="submit" class="btn btn-dark">Logout</button>
				</form>
				<%
				} else {
				%>
				<form action="../login/login_form.jsp" method="post">
					<button type="submit" class="btn btn-dark">Login</button>
				</form>
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

	<!-- Main Content -->
	<%@ include file="../DBconn/dbconn.jsp" %>
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM WRITEDATA";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()){
	%>

	<div class="row align-items-md-stretch text-center">
		<div class="col-md-4">
			<div class="h-100 p-2">
				<img src="../resources/img/<%=rs.getString("MAGAZINEID")%>.jpg"
					onerror="../resources/images/error.jpg" class="img-fluid" style ="width : 250; height:350">
				<h5>
					<b><%=rs.getString("magTitle")%></b>
				</h5>
				<p> <%=rs.getString("magContent").substring(0, 30)%>...
				</p>
				<p><%=rs.getString("clientId")%>
				<a href="./magazine.jsp?id=<%=rs.getString("clientId")%>"
					class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
				<p>
					by
					<%=rs.getString("clientId")%></p>
			</div>
		</div>
		<%
		}
		if (rs!=null)
			rs.close();
		if (pstmt!=null)
			pstmt.close();
		if(conn != null)
			conn.close();
		%>
	</div>
</body>
</html>
