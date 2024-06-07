<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
	<!-- Header block -->
	<div class="Headerblock">
		<div class="item1">
			<a href="./main.jsp"><h1>velog</h1></a>
		</div>
		<div class="Headerblock-inline">
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
    <form action="../checkMyMag/checkMag.jsp" method="post">
		<button type="submit" class="btn btn-dark">내글 목록</button>
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
	</div>
	
	<!-- Home Tab -->
	<div class="Home-Tab">
		<a id="Home-Tap-Icon"> <img src="../resources/img/trend.png"
			width="30px" height="30px"> <span>New</span>
		</a> <a> <img src="../resources/img/more_index.png" width="24px"
			height="24px">
		</a>
	</div>

	<!-- Search Bar -->
	<div class="container mt-3">
		<form action="../search/search_process.jsp" method="post" class="d-flex">
			<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search_value">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
	</div>

   <!-- Main Content -->
   <%@ include file="../DBconn/dbconn.jsp" %>
   <%
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = "SELECT * FROM WRITEDATA";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
   %>

<div class="container">
    <div class="row align-items-md-stretch text-center">
        <% while (rs.next()) { %>
            <div class="col-md-4">
                <div class="h-100 p-2">
                    <img src="../resources/img/error.png"
                         onerror="this.src='../resources/images/error.png';" class="img-fluid" style="width: 250px; height:350px">
                    <h5>
                        <b><%=rs.getString("magTitle")%></b>
                    </h5>
                    <p> <%=rs.getString("magContent").substring(0, 10)%>...</p>
                    <a href="./magazine.jsp?id=<%=rs.getString("clientId")%>"
                       class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
                    <p><%=rs.getString("clientId")%></p>
                </div>
            </div>
        <% } %>
    </div>
</div>
      <%
      if (rs!=null)
         rs.close();
      if (pstmt!=null)
         pstmt.close();
      if(conn != null)
         conn.close();
      %>
</body>
</html>
