<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="../main/menu.jsp"%>
<%@ include file="../DBconn/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../resources/css/custom.css">
<title>글 수정 페이지</title>
<style>
header {
	background-color: #333;
	color: #fff;
	padding: 10px 0;
	margin: 30px 7%;
	text-align: center;
}

form input[type="text"], form textarea {
	width: 100%;
	padding: 10px;
	margin: 0px 7%;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<%
	String magid = request.getParameter("id");
	String magtitle = "";
	String magtag = "";
	String magcontent = "";
	String magfile = "";
	String sql = "SELECT MAGTITLE,MAGTAG,MAGCONTENT,MAGFILE FROM WRITEDATA WHERE MAGAZINEID = ?";

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, magid);

	//쿼리실행
	rs = pstmt.executeQuery();

	if (rs.next()) {
		magtitle = rs.getString("MAGTITLE");
		magtag = rs.getString("MAGTAG");
		magcontent = rs.getString("MAGCONTENT");
		magfile = rs.getString("MAGFILE");
	}
	%>
	<header>
		<h1>글 수정 페이지</h1>
	</header>
	<div class="edit-body">
		<div class="edit-form">
			<form action="./editprocess.jsp" method="post">
				<input type="hidden" name="magid" value="<%=magid%>">
				<p>
					Tag <input type="text" name="magtag" value="<%=magtitle%>">
				</p>
				<p>
					Title <input type="text" name="magtitle" value="<%=magtitle%>">
				</p>
				<p>
					Content
					<textarea name="magcontent" rows="10"><%=magcontent%></textarea>
				</p>
				<p>
					<input type="submit" value="Update">
				</p>
			</form>
		</div>
	</div>
</body>
</html>