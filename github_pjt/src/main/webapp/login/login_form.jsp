<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f8f9fa;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    form {
        background-color: white;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    p {
        margin: 10px 0;
    }
    input[type=text], input[type=password] {
        width: 100%;
        padding: 10px;
        margin: 5px 0 20px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type=button] {
        width: 100%;
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    input[type=button]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
    <form name="loginForm" action="../user/login_process.jsp" method="post">
    <p>아이디: <input type="text" name="id"></p>
    <p>비밀번호: <input type="password" name="passwd"></p>
    <p><input type="button" value="전송" onclick="checkLogin()"></p>
    </form>
<script type="text/javascript">
    function checkLogin() {
        var form = document.loginForm;
        if(form.id.value =="") {
            alert("아이디를 입력해주세요.");
            form.id.focus();
            return false;
        } else if(form.passwd.value == "") {
            alert("비밀번호를 입력해주세요.");
            form.passwd.focus();
            return false;
        }
        form.submit();
    }
</script>
</body>
</html>
