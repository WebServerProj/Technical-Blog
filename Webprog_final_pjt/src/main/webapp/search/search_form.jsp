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
	<%@include file="../main/menu.jsp" %>
   <%
            ArrayList<String> titles = (ArrayList<String>) session.getAttribute("titles");
            ArrayList<String> contents = (ArrayList<String>) session.getAttribute("contents");
            ArrayList<String> clientIds = (ArrayList<String>) session.getAttribute("clientIds");
            ArrayList<String> magazineIds = (ArrayList<String>) session.getAttribute("magazineIds");

            if (titles != null) {
                for (int i = 0; i < titles.size(); i++) {
        %>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title"><%= titles.get(i) %></h5>
                            <p class="card-text"><%= contents.get(i).substring(0, Math.min(contents.get(i).length(), 100)) %>...</p>
                            <a href="../main/magazine.jsp?id=<%= magazineIds.get(i) %>" class="btn btn-primary">상세 정보</a>
                        </div>
                    </div>
        <%
                }
            }
    
     
      %>
</body>
</html>