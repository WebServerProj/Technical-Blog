<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta charset="EUC-KR">
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/custom.css">
<title>글쓰기 페이지</title>
</head>
<body>
	<div class="add-container">
		<div class="add-title">
			<form action="./processAddMagazine.jsp">
				<label for="title">제목 입력 </label>
				<input type="text" id="title" name="title" placeholder="제목을 입력해주세요." required>
			</form>
		</div>
	</div>
</body>
</html>