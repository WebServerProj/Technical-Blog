<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="../main/menu.jsp"%>
<%@ include file="../DBconn/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

header {
	background-color: #333;
	color: #fff;
	padding: 10px 0;
	text-align: center;
}

form {
	width: 60%;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f9f9f9;
}

form input[type="text"], form textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

form input[type="submit"] {
	background-color: #333;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
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

	<form action="./editprocess.jsp" method="post">
		<input type="hidden" name="magid" value="<%=magid%>">
		<p>
			Tag : <input type="text" name="magtag" value="<%=magtitle%>">
		</p>
		<p>
			Title: <input type="text" name="magtitle" value="<%=magtitle%>">
		</p>
		<p>
			Content:
			<textarea name="magcontent" rows="10"><%=magcontent%></textarea>
		</p>
		<p>
			<input type="submit" value="Update">
		</p>
	</form>
</body>
</html>
