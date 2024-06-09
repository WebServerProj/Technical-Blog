<%@page import="dto.Magazine"%>
<%@page import="dao.MagazineRepository"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
	<%@ include file="../main/menu.jsp"%>
	<%@ include file="../DBconn/dbconn.jsp"%>
	<%
	String id = request.getParameter("id");
	MagazineRepository dao = MagazineRepository.getInstance();
	Magazine mag = dao.getMagById(id);

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM WRITEDATA WHERE MAGAZINEID = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();

	boolean recordFound = false;  // 플래그 변수 초기화
	%>
	<div class="row align-items-md-stretch">
		<%
		try{
		while (rs.next()) {
			if (id.equals(rs.getString("MAGAZINEID"))) {
		%>
		<div class="col-md-5">
			<img src="../resources/img/<%=rs.getString("MAGFILE")%>"
				style="width: 70%">
		</div>
		<div class="col-md-6">
			<h3>
				<b><%=rs.getString("magTitle")%></b>
			</h3>
			<p>
				<b>태그</b> :
				<%=rs.getString("magTitle")%>
			<p>
				<b>저자</b> :
				<%=rs.getString("clientId")%>
			<p>
				<b>글 내용</b> :
				<%=rs.getString("magContent")%>
		</div>
		<%
				}
			}
		}catch(Exception e){ 
			%>
			<script>
				alert("글이 존재하지 않습니다.");
				window.location.href = "../main/magazine.jsp"; // 다시 현재 페이지로 리다이렉트
			</script>
			<%
		}
		%>
	</div>
</body>
</html>
