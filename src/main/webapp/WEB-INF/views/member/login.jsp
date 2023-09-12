<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼</title>
    <%@ include file="../include/head.jsp" %>
    <style>
        .box input {
            margin-top: 20px;
        }
    </style>
</head>

<body>
<%@include file="../include/header.jsp"%>

<div class="content container">
    <div class="login_area is-flex is-justify-content-center">
        <form action="${headPath }/member/login.do" id="login_frm" class="frm" method="post">
            <div class="box has-text-centered" style="max-width: 400px;">
                <h2>로그인</h2>
                <input type="text" name="id" id="id" class="input" placeholder="아이디 입력" autofocus required>
                <input type="password" name="pw" id="pw" class="input" placeholder="패스워드 입력" required>
                <input type="submit" value="로그인" class="button">
                <input type="reset" value="취소" class="button">
            </div>
        </form>
    </div>
</div>

<%@include file="../include/footer.jsp"%>
</body>
</html>