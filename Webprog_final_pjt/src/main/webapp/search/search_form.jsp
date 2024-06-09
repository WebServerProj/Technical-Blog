<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../resources/css/custom.css">
<title>Search</title>
</head>
<body>
<!------상단 부분------->
	<div class="Headerblock">
		<div class="item1">
			<a href="../main/main.jsp"><h1>velog</h1></a>
		</div>
			<div class="Header-button">
				<%
				String name = (String) session.getAttribute("name");
				if (name != null) {
				%>
<div class="d-flex gap-2">
    <span><%=name%>님</span>
    <form action="../login/logout_process.jsp" method="post">
        <button type="submit" class="btn btn-dark">Logout</button>
    </form>
    <form action="../update/update_form.jsp" method="post">
        <button type="submit" class="btn btn-dark">회원정보수정</button>
    </form>
    <form action="../add/addMagazine.jsp" method="post">
        <button type="submit" class="btn btn-dark">새글 작성</button>
    </form>
</div>
				<%
				} else {
				%>
				<div class="d-flex gap-2">
				<form action="../login/login_form.jsp" method="post">
					<button type="submit" class="btn btn-dark">Login</button>
				</form>
								<form action="../join/join_form.jsp" method="post">
					<button type="submit" class="btn btn-dark">Join</button>
				</form>
				</div>
				<%
				}
				%>
			</div>
</div>
   <%
            ArrayList<String> titles = (ArrayList<String>) session.getAttribute("titles");
            ArrayList<String> contents = (ArrayList<String>) session.getAttribute("contents");
            ArrayList<String> clientIds = (ArrayList<String>) session.getAttribute("clientIds");
            if (titles != null) {
                for (int i = 0; i < titles.size(); i++) {
        %>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title"><%= titles.get(i) %></h5>
                            <p class="card-text"><%= contents.get(i).substring(0, Math.min(contents.get(i).length(), 100)) %>...</p>
                            <a href="../main/magazine.jsp?id=<%= clientIds.get(i) %>" class="btn btn-primary">상세 정보</a>
                        </div>
                    </div>
        <%

                }
            }
    
     
      %>
</body>
</html>