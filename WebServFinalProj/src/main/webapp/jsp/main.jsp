<%@page import="java.util.ArrayList"%>
<%@page import="dto.Magazine"%>
<%@page import="dao.MagazineRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>메인 페이지</title>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div><%@ include file="menu.jsp"%></div>
	<%  
		MagazineRepository dao = MagazineRepository.getInstance();
		ArrayList<Magazine> listOfMagazine = dao.getAllMagazine();
	%>

	<div class="row align-items-md-stretch   text-center">
		<%
			for (int i = 0; i <listOfMagazine.size(); i++){
				Magazine mag = listOfMagazine.get(i);
		%>

	<div class="col-md-4">
		<div class="h-100 p-2">
			<img src="../resources/images/<%=mag.getFilename()%>" onerror="../resources/images/error.jpg">
			<h5>
				<b><%=mag.getTitle() %></b>
			</h5>
			<p>
				<%=mag.getDescription().substring(0,20)%>...
			<p>
				<a href="./magazine.jsp?id=<%=mag.getWriter()%>"
					class="btn btn-secondatry" role="button"> 상세 정보 &raquo;</a>
			<p>
				by
				<%=mag.getWriter()%>
		</div>
	</div>
		<%
		}
	%>
	</div>
</body>
</html>