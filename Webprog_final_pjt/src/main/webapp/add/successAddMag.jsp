<%@page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>글작성 성공페이지</title>
<style>
    body {
        background-color: #f8f9fa;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .success-container {
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .success-message {
        font-size: 1.5rem;
        margin-bottom: 20px;
    }
</style>
</head>
<body>
    <div class="success-container">
        <p class="success-message">글 작성을 성공했습니다.</p>
        <form action="../main/main.jsp" method="POST">
            <button type="submit" class="btn btn-dark">메인페이지로 돌아가기</button>
        </form>
    </div>
</body>
</html>
