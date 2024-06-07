<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../DBconn/dbconn.jsp"%>
<%
    String searchValue = request.getParameter("search_value");
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    ArrayList<String> titles = new ArrayList<String>();
    ArrayList<String> contents = new ArrayList<String>();
    ArrayList<String> clientIds = new ArrayList<String>();
    try {
        String sql = "SELECT * FROM WRITEDATA WHERE magTitle LIKE ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "%" + searchValue + "%");
        rs = pstmt.executeQuery();
        while (rs.next()) {
            titles.add(rs.getString("magTitle"));
            contents.add(rs.getString("magContent"));
            clientIds.add(rs.getString("clientId"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
        if (conn != null) try { conn.close(); } catch (SQLException ex) {}
    }
    session.setAttribute("titles", titles);
    session.setAttribute("contents", contents);
    session.setAttribute("clientIds", clientIds);
    response.sendRedirect("search_form.jsp");
%>
