<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	Connection conn = null;
	
try {
	String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 데이터베이스 URL
	String uid = "C##JSP"; // 데이터베이스 사용자명
	String password = "JSP"; // 데이터베이스 비밀번호
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, uid, password);
	
} catch (Exception e) {
	e.printStackTrace();
}
%>