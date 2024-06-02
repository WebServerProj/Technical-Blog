<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
    <p>���̵�: <input type="text" name="id"></p>
    <p>��й�ȣ: <input type="password" name="passwd"></p>
    <p><input type="button" value="����" onclick="checkLogin()"></p>
    <p><input type="button" value="ȸ������" onclick="location.href='../join/join_form.jsp'">
    </form>
<script type="text/javascript">
    function checkLogin() {
        var form = document.loginForm;
        if(form.id.value =="") {
            alert("���̵� �Է����ּ���.");
            form.id.focus();
            return false;
        } else if(form.passwd.value == "") {
            alert("��й�ȣ�� �Է����ּ���.");
            form.passwd.focus();
            return false;
        }
        form.submit();
    }
</script>
</body>
</html>
