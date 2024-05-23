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
			<div class="icon">
				<img src="../resources/img/search.png" width="24px" height="24px">
			</div>
			<form action="../login/login_form.jsp" method="post">
				<div class="Header-button">
					<button type="submit" class="btn btn-dark">Login</button>
				</div>
			</form>
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
</body>
</html>