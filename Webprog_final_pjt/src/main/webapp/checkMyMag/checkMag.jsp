<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>

<%
// 데이터베이스 연결 정보 설정
String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 데이터베이스 URL
String uid = "c##JSP";
String upw = "JSP";

Connection conn = null;
PreparedStatement pstmt_mag = null;
PreparedStatement pstmt_mem = null;
ResultSet rs_mag = null;
ResultSet rs_mem = null;

try {
	// Oracle JDBC 드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");

	// 데이터베이스 연결
	conn = DriverManager.getConnection(url, uid, upw);

	// SQL 쿼리 작성 (데이터를 가져오는 과정)
	// sql 멤버접근 코드 추가예정
	String sql_mag = "SELECT magazineID, magTitle, magContent FROM WRITEDATA";
	String sql_mem = "SELECT id FROM MEMBERS";
	pstmt_mag = conn.prepareStatement(sql_mag);
	pstmt_mem = conn.prepareStatement(sql_mem);
	

	// SQL 실행
	rs_mag = pstmt_mag.executeQuery();
	rs_mem = pstmt_mem.executeQuery();
%>
<html>
<head>
<title>글 목록</title>
</head>
<body>
	<h1>글 목록</h1>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>제목</th>
			<th>내용</th>
		</tr>
		<%
		// MEMBERS 데이터베이스에서 ID가져오기
		String memID = rs_mem.getString("id");
		//
		while (rs_mag.next()) {
			String magazineID = rs_mag.getString("magazineID");
			String magTitle = rs_mag.getString("magTitle");
			String magContent = rs_mag.getString("magContent");
		%>
		<tr>
			<td><%=magazineID%></td>
			<td><%=magTitle%></td>
			<td><%=magContent%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
<%
} catch (Exception e) {
e.printStackTrace();
out.println("데이터베이스에서 데이터를 조회하는 중 오류가 발생했습니다.");
} finally {
// 자원 해제
if (rs_mag != null)
	try {
		rs_mag.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
if (pstmt_mag != null)
	try {
		pstmt_mag.close();
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
