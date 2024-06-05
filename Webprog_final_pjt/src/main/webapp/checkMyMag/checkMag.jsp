<!-- Check My Magazine list -->
<%@ page import ="java.sql.*"%>
<%@ page import ="javax.naming.*"%>
<%@ page import ="javax.sql.*"%>

<%@ include file ="../DBconn/dbconn.jsp"%>
<%			
	String memid = (String) session.getAttribute("id");
			
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM WRITEDATA WHERE CLIENTID = "+ memid;
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while (rs.next()) {
%>
<div class="row align-items-md-stretch text-center">
	<div class="col-md-4">
		<div class="h-100 p-2">
			<img src="../resources/img/<%=rs.getString("MAGAZINEID")%>.jpg"
				onerror="../resources/images/error.jpg" class="img-fluid"
				style="width: 250; height: 350">
			<h5>
				<b><%=rs.getString("magTitle")%></b>
			</h5>
			<p>
				<%=rs.getString("magContent").substring(0, 30)%>...
			</p>
			<p><%=rs.getString("clientId")%>
				<a href="./magazine.jsp?id=<%=rs.getString("MAGAZINEID")%>"
					class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
				<p>
					by
					<%=rs.getString("clientId")%></p>
			</div>
		</div>
<%
	}
%>
</div>