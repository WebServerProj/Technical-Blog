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
	<%@include file="../main/menu.jsp" %>

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
                    <img src="../resources/img/<%=rs.getString("MAGFILE") %>"
                         onerror="this.src='../resources/img/error.png';" class="img-fluid" style="width: 250px; height:350px">
                    <h5>
                        <b><%=rs.getString("magTitle")%></b>
                    </h5>
                    <p> <%=rs.getString("magContent").substring(0, 10)%>...</p>
                    <a href="./magazine.jsp?id=<%=rs.getString("MAGAZINEID")%>"
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
