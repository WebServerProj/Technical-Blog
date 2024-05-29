<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta charset="EUC-KR">
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>글쓰기 페이지</title>
</head>
<body>
	<form action="./processAddMagazine.jsp" method="POST">
		<label for="magTitle">제목</label>
		<input type="text" id="magTitle" name="magTitle" required><br><br>
		
		<label for="magTag">태그: </label>
		<input type="text" id ="magTag" name="magTag" required> <br><br>
		
		<label for="magContent">내용:</label>
		<textarea id="magContent" name="magContent" rows="10" cols="50" requried></textarea>
		
		<input type="submit" value="글 작성완료">
	</form>
</body>
</html>