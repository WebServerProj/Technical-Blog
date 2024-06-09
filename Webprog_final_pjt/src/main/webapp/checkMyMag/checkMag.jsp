<!-- Check My Magazine list -->
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>

<%@ include file="../main/menu.jsp" %>
<%@ include file="../DBconn/dbconn.jsp"%>
<%
String memid = (String) session.getAttribute("id");
int count = 0;

PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = "SELECT * FROM WRITEDATA";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while (rs.next()) {
	if (memid.equals(rs.getString("clientId"))) {
		count++;
%>
<div class="row align-items-md-stretch text-center">
	<div class="col-md-4">
		<div class="h-100 p-2">
			<img src="../resources/img/<%=rs.getString("magFile")%>"
				onerror="../resources/img/error.png" class="img-fluid"
				style="width: 250; height: 350">
			<h5>
				<b><%=rs.getString("magTitle")%></b>
			</h5>
			<p>
				<%=rs.getString("magContent").substring(0, 10)%>...
			</p>
			<p><%=rs.getString("clientId")%>
				<a href="../main/magazine.jsp?id=<%=rs.getString("MAGAZINEID")%>"
					class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
				<a href="../edit/edit.jsp?id=<%=rs.getString("MAGAZINEID")%>"
					class="btn btn-secondary" role="button">글 수정 &raquo;</a>
				<a href="../delete/delete.jsp?id=<%=rs.getString("MAGAZINEID")%>"
					class="btn btn-secondary" role="button">글 삭제 &raquo;</a>
			<p>
				by
				<%=rs.getString("clientId")%></p>
		</div>
	</div>
	<%
	}
	}
	%>
	<%
		if(count == 0){
			%>
				<h5 style="center">작성한 글이 존재하지 않습니다.</h5>
			<%
		}
	%>
</div>