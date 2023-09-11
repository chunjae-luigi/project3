<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼</title>
    <%@ include file="../include/head.jsp" %>
</head>

<body>
<%@include file="../include/header.jsp"%>

<div class="content container">
    <div class="login_area">
        <form action="${headPath }/member/login.do" id="login_frm" class="frm" method="post">
            <table class="tb1">
                <tbody>
                <tr>
                    <td><input type="text" name="id" id="id" class="indata" placeholder="아이디 입력" autofocus required></td>
                </tr>
                <tr>
                    <td><input type="password" name="pw" id="pw" class="indata" placeholder="패스워드 입력" required></td>
                </tr>
                <tr>
                    <td>
                        <div class="btn_group">
                            <input type="submit" value="로그인" class="inBtn inBtn1">
                            <input type="reset" value="취소" class="inBtn inBtn2">
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>

<%@include file="../include/footer.jsp"%>
</body>
</html>