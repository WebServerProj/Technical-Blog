<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../DBconn/dbconn.jsp"%>

<%
    String magazineId = request.getParameter("magazineId");
	String author = (String) session.getAttribute("name"); 
    String content = request.getParameter("content");

    String sql = "INSERT INTO COMMENTS (COMMENT_ID, MAGAZINE_ID, AUTHOR, CONTENT, CREATED_AT) VALUES (comments_seq.NEXTVAL, ?, ?, ?, SYSTIMESTAMP)";
    PreparedStatement pstmt = null;

    try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, magazineId);
        pstmt.setString(2, author);
        pstmt.setString(3, content);
        pstmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("error ");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }

    response.sendRedirect("magazine.jsp?id=" + magazineId);
%>
