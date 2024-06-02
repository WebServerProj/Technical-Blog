<!-- Check My Magazine list -->
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>

<%@ include file="../DBconn/dbconn.jsp" %>
<%
	String sql;
	String memid = (String)session.getAttribute("id");
	
%>
