<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>블로그 글쓰기</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	margin: 0;
	padding: 20px;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #ffffff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

label {
	font-weight: bold;
	margin-top: 10px;
}

.form-group {
	margin-bottom: 15px;
}

.btn {
	display: block;
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.btn:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="container">
		<h1>매거진 글쓰기</h1>
		<form action="./processAddMagazine.jsp" method="POST" enctype="multipart/form-data">
			<div>
				<input type="file" name="file">
			</div>
			<div class="form-group">
				<label for="magTitle">제목</label> <input type="text" id="magTitle"
					name="magTitle" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="magTag">태그</label> <input type="text" id="magTag"
					name="magTag" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="magContent">내용</label>
				<textarea id="magContent" name="magContent" class="form-control"
					rows="10" required></textarea>
			</div>
			<input type="submit" value="글 작성완료" class="btn">
		</form>
	</div>
</body>
</html>