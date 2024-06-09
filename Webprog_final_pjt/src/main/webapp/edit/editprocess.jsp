<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../DBconn/dbconn.jsp"%>
<html>
<head>
	<title>글 수정 프로세스</title>
</head>
<body>
	<%
	String magid = request.getParameter("magid");
	String magtag = request.getParameter("magtag");
	String magtitle = request.getParameter("magtitle");
	String magcontent = request.getParameter("magcontent");

	PreparedStatement pstmt = null;

	try {
		String sql = "UPDATE WRITEDATA SET MAGTITLE = ?, MAGTAG = ?, MAGCONTENT = ? WHERE MAGAZINEID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, magtitle);
		pstmt.setString(2, magtag);
		pstmt.setString(3, magcontent);
		pstmt.setString(4, magid);		
		pstmt.executeUpdate();

		response.sendRedirect("../main/main.jsp");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null)
			try {
		pstmt.close();
			} catch (SQLException e) {
		e.printStackTrace();
			}
		if (conn != null)
			try {
		conn.close();
			} catch (SQLException e) {
		e.printStackTrace();
			}
	}
	%>
	<script>
		window.location.href = "../main/main.jsp";
	</script>
</body>
</html>