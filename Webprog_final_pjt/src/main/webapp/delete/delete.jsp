<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글 삭제 페이지</title>
</head>
<body>
	<%@ include file="../main/menu.jsp"%>
	<%@ include file="../DBconn/dbconn.jsp"%>
	<%
	String memid = request.getParameter("id");

	PreparedStatement pstmt = null;	
	ResultSet rs = null;

	String sql = "select * from WRITEDATA";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		sql = "delete from WRITEDATA where MAGAZINEID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memid);
		pstmt.executeUpdate();
	} else
		out.println("일치하는 글 정보가 없습니다.");
	
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	/* response.sendRedirect("../main/magazine.jsp?edit=delete"); */
	%>
	<script>
		window.location.href = "../checkMyMag/checkMag.jsp";
	</script>

</body>
</html>