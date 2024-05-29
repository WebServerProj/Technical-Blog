<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Magazine"%>
<%@ page import="dao.MagazineRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/custom.css">
<title>Magazine</title>
</head>
<body>
	<!-- Header block -->
	<div class="Headerblock">
		<div class="item1">
			<a href="./main.jsp"><h1>velog</h1></a>
		</div>
		<div class="Headerblock-inline">
			<div class="icon">
			<a href="../add/addMagazine.jsp"	>
				<img src="../resources/img/search.png" width="24px" height="24px">
			</a>
			</div>
			<div class="Header-button">
				<%
				String name = (String) session.getAttribute("name");
				if (name != null) {
				%>
					<span><%= name %>님</span>
					<form action="../login/logout_process.jsp" method="post">
						<button type="submit" class="btn btn-dark">Logout</button>
					</form>
				<%
				} else {
				%>
					<form action="../login/login_form.jsp" method="post">
						<button  type="submit" class="btn btn-dark">Login</button>
					</form>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<!-- Home Tab -->
	<div class="Home-Tab">
		<a id="Home-Tap-Icon"> <img src="../resources/img/trend.png" width="30px" height="30px"> <span>New</span>
		</a> <a> <img src="../resources/img/more_index.png" width="24px" height="24px">
		</a>
	</div>
	
	<!-- Main Content -->
	<%  
		MagazineRepository dao = MagazineRepository.getInstance();
		ArrayList<Magazine> listOfMagazine = dao.getAllMagazine();
	%>

	<div class="row align-items-md-stretch text-center">
		<%
			for (int i = 0; i < listOfMagazine.size(); i++) {
				Magazine mag = listOfMagazine.get(i);
		%>
		<div class="col-md-4">
			<div class="h-100 p-2">
				<img src="../resources/images/<%= mag.getFilename() %>" onerror="../resources/images/error.jpg" class="img-fluid">
				<h5><b><%= mag.getTitle() %></b></h5>
				<p><%= mag.getDescription().substring(0, 20) %>...</p>
				<a href="./magazine.jsp?id=<%= mag.getWriter() %>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
				<p>by <%= mag.getWriter() %></p>
			</div>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>
