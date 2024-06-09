<%@page import="dto.Magazine"%>
<%@page import="dao.MagazineRepository"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="jakarta.websocket.OnError"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../resources/css/custom.css">
<title>Magazine</title>
</head>
<body>
	<%@ include file="./menu.jsp"%>
	<%@ include file="../DBconn/dbconn.jsp"%>
	<%
	String id = request.getParameter("id");
//	MagazineRepository dao = MagazineRepository.getInstance();
//	Magazine mag = dao.getMagById(id);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM WRITEDATA";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	%>
	<div class="row align-items-md-stretch">	 	
	 		<% while (rs.next()) { 
	 			System.out.println(id);
	 			if(id.equals(rs.getString("MAGAZINEID"))){
	 		%>
	 		<div class="col-md-5">
				<img src="../resources/img/<%=rs.getString("MAGAZINEID")%>.jpg" style="width: 70%">
			</div>
			<div class="col-md-6">
				<h3><b><%=rs.getString("magTitle")%></b></h3>
				<p><b>태그</b> : <%=rs.getString("magTitle")%>					
				<p><b>저자</b> : <%=rs.getString("clientId")%>	
				<p><b>글 내용</b> : <%=rs.getString("magContent")%>
			</div>
			<%}
	 			}%>
		</div>
	<%-- <div class="row align-items-md-stretch">	 	
	 		<div class="col-md-5">
				<img src="../resources/img/<%=mag.getMagazineId()%>.jpg" style="width: 70%">
			</div>
			<div class="col-md-6">
				<h3><b><%=mag.getMagTitle()%></b></h3>
				<p><b>저자</b> : <%=mag.getClientId()%>	
				<p><b>태그</b> : <%=mag.getMagTag()%>					
				<p><b>글 내용</b> : <%=mag.getMagcontent()%>
			</div>
		</div> --%>
	
</body>
</html>