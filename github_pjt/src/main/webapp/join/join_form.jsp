<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
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
        width: 300px;
    }
    h3 {
        text-align: center;
        color: #333;
    }
    p {
        margin: 10px 0;
    }
    input[type=text], input[type=password], select {
        width: calc(100% - 20px);
        padding: 10px;
        margin: 5px 0 15px 0;
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
<script type="text/javascript">
    function checkMember() {
        
        let regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
        let regExpName = /^[가-힣]*$/;
        let regExpPasswd = /^[0-9]*$/;
        let regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
        let regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-aA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        
        let form = document.Member;
        
        let id = form.id.value;
        let name= form.name.value;
        let passwd = form.passwd.value;
        let phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
        let email = form.email.value;
        
        if (!regExpId.test(id)) {
            alert("아이디는 문자로 시작해 주세요!");
            form.id.select();
            return;
        }
        if (!regExpName.test(name)) {
            alert("이름은 한글만으로 입력해 주세요!");
            form.id.select();
            return;
        }
        if (!regExpPasswd.test(passwd)) {
            alert("비밀번호는 숫자만으로 입력해 주세요!");
            form.id.select();
            return;
        }
        if (!regExpPhone.test(phone)) {
            alert("연락처 입력을 확인해 주세요!");
            form.id.select();
            return;
        }
        if (!regExpEmail.test(email)) {
            alert("이메일 입력을 확인해 주세요!");
            form.id.select();
            return;
        }
        form.submit();
    }
</script>
<body>
    <form action="../user/join_process.jsp" name="Member" method="post">
        <p>아이디: <input type="text" name="id" placeholder="문자로 시작해야 합니다."></p>
        <p>비밀번호: <input type="password" name="passwd" placeholder="숫자만 입력하세요"></p>
        <p>이름: <input type="text" name="name" placeholder="한글만 입력하세요"></p>
        <p>연락처: 
            <select name="phone1">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="019">019</option>
            </select> - 
            <input type="text" maxlength="4" size="4" name="phone2"> - 
            <input type="text" maxlength="4" size="4" name="phone3">
        </p>
        <p>이메일: <input type="text" name="email"></p>
        <p><input type="button" value="가입하기" onclick="checkMember()"></p>
    </form>
</body>
</html>
