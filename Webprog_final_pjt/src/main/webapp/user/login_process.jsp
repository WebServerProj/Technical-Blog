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
	String name = null;

	
	String url = "jdbc:oracle:thin:@localhost:1521/XE";
	String uid = "c##JSP";
	String upw = "JSP";
	
	Connection conn = null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmt1 = null;
    ResultSet rs = null;
    ResultSet rs1 = null;
	String user = "select * from MEMBERS where ID=? and PW=?";
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, uid, upw);
		
		pstmt = conn.prepareStatement(user);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);

		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
            String getUserName = "SELECT NAME from MEMBERS WHERE ID=?";
            pstmt1 = conn.prepareStatement(getUserName);
            pstmt1.setString(1, id);
            rs1 = pstmt1.executeQuery();

            if(rs1.next()) {
                name = rs1.getString("NAME");
                session.setAttribute("name", name);
                response.sendRedirect("../jsp/main.jsp");

            }
		}
		else {
			response.sendRedirect("../login/login_fail.jsp");
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