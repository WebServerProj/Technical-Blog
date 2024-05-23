<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("passwd");

	
	// 1.변수선언
	String url = "jdbc:oracle:thin:@localhost:1521/XE";
	String uid = "c##JSP";
	String upw = "JSP";
	
	Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
	String user = "select * from MEMBERS where ID=? and PW=?";
	
	try{
		// 1. 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 2. conn 생성
		conn = DriverManager.getConnection(url, uid, upw);
		// 3. pstmt 생성
		pstmt = conn.prepareStatement(user);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);

		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			response.sendRedirect("main.jsp");
		}
		else {
			out.println("아이디, 비밀번호를 다시 입력해주세요.");
		}
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>