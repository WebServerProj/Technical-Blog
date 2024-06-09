<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Magazine</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f4f4f4;
}

.magazine-container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
	padding: 20px;
}

.magazine-img {
	width: 100%;
	border-radius: 10px;
}

.magazine-title {
	color: #333;
}

.magazine-tag, .magazine-author, .magazine-content {
	color: #666;
}

.magazine-tag b, .magazine-author b, .magazine-content b {
	color: #333;
}
</style>
</head>
<body>
	<%@ include file="./menu.jsp"%>
	<%@ include file="../DBconn/dbconn.jsp"%>
	<div class="container">
		<%
		String id = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM WRITEDATA WHERE MAGAZINEID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		%>
		<%
		try {
			while (rs.next()) {
				if (id.equals(rs.getString("MAGAZINEID"))) {
		%>
		<div class="row magazine-container">
			<div class="col-md-5">
				<img src="../resources/img/<%=rs.getString("MAGAZINEID")%>.jpg"
					class="magazine-img">
			</div>
			<div class="col-md-7">
				<h3 class="magazine-title"><%=rs.getString("magTitle")%></h3>
				<p class="magazine-tag">
					<b>SubTitle:</b>
					<%=rs.getString("magTag")%></p>
				<p class="magazine-author">
					<b>Author:</b>
					<%=rs.getString("clientId")%></p>
				<pre class="magazine-content">
					<b>Content:</b> <%=rs.getString("magContent")%></pre>
			</div>
		</div>
		<%
		}
		}
		} catch (Exception e) {
		%>
		<script>
			alert("글이 존재하지 않습니다.");
			window.location.href = "../main/magazine.jsp"; // 다시 현재 페이지로 리다이렉트
		</script>
		<%
		}
		%>

		<!-- 댓글 입력 폼 -->
		<div class="row mt-4">
			<div class="col-md-12">
				<h4>댓글 남기기</h4>
				<form action="save_comment.jsp" method="post">
					<input type="hidden" name="magazineId" value="<%=id%>">

					<div class="mb-3">
						<label for="content" class="form-label">내용</label>
						<textarea class="form-control" id="content" name="content"
							rows="3" required></textarea>
					</div>
					<button type="submit" class="btn btn-primary">댓글 작성</button>
				</form>
			</div>
		</div>

		<!-- 댓글 목록 -->
		<div class="row mt-4">
			<div class="col-md-12">
				<h4>댓글</h4>
				<%
				sql = "SELECT * FROM COMMENTS WHERE MAGAZINE_ID = ? ORDER BY CREATED_AT DESC";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				%>
				<%
				while (rs.next()) {
				%>
				<div class="card mb-3">
					<div class="card-body">
						<h5 class="card-title"><%=rs.getString("AUTHOR")%></h5>
						<p class="card-text"><%=rs.getString("CONTENT")%></p>
						<p class="card-text">
							<small class="text-muted"><%=rs.getTimestamp("CREATED_AT")%></small>
						</p>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>

