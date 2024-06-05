<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Magazine"%>
<%@ page import="dao.MagazineRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>
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
		
<div class="Headerblock-inline">
    <!-- 검색 아이콘 활성화 및 수정 -->
    <div class="icon">
        <!-- 검색 페이지로 이동하도록 링크 수정 가능 -->
        <a href="../search/search_form.jsp">
            <!-- 검색 아이콘 이미지로 변경. 이미지 경로 확인 필요 -->
            <img src="../resources/img/search.png" width="24px" height="24px" alt="Search">
        </a>
    </div>
    <!-- 기존 로그인/로그아웃 버튼 코드 유지 -->
</div>
			<!-- <div class="icon">
			<a href="../add/addMagazine.jsp"	>
				<img src="../resources/img/search.png" width="24px" height="24px">
			</a>
			</div> -->
			<div class="Header-button">
				<%
				String name = (String) session.getAttribute("name");
				if (name != null) {
				%>
<div class="d-flex gap-2"> <!-- Flex container 생성 및 요소 간 간격 설정 -->
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
		<form action="../search/search_result.jsp" method="get" class="d-flex">
			<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="query">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
	</div>

	<!-- Main Content -->
	<%
	MagazineRepository dao = MagazineRepository.getInstance();
	ArrayList<Magazine> listOfMagazine = dao.getAllMagazine();
	%>

	<div class="row align-items-md-stretch text-center">
		<%
		for (int i = 0; i < listOfMagazine.size(); i++) {
			Magazine mag = listOfMagazine.get(i);
		%>
		<div class="col-md-4">
			<div class="h-100 p-2">
				<img src="../resources/images/<%=mag.getFilename()%>"
					onerror="../resources/images/error.jpg" class="img-fluid">
				<h5>
					<b><%=mag.getTitle()%></b>
				</h5>
				<p><%=mag.getDescription().substring(0, 20)%>...
				</p>
				<a href="./magazine.jsp?id=<%=mag.getWriter()%>"
					class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
				<p>
					by
					<%=mag.getWriter()%></p>
			</div>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>
