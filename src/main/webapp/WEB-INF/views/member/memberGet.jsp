<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼::마이페이지</title>
    <%@ include file="../include/head.jsp" %>
</head>

<body>
<%@ include file="../include/header.jsp" %>

<div class="content container">
    <h2 class="is-center">회원 정보</h2>
    <nav class="breadcrumb is-right" aria-label="breadcrumbs">
        <ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
        </ul>
    </nav>

    <div class="page_wrap">
        <h2 class="page_tit">마이페이지</h2>
        <table class="table tb2">
            <tbody>
            <tr>
                <th>아이디</th>
                <td>${member.id}</td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>${membe`r.pw}</td>
            </tr>
            <tr>
                <th>이름</th>
                <td>${member.name}</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>${member.tel}</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>${member.email}</td>
            </tr>
            <tr>
                <th>포인트</th>
                <td>${member.point}</td>
            </tr>
            </tbody>
        </table>
        <div class="btn_group">
            <a href="${headPath }/member/update.do?id=${member.id}" class="button">정보 수정</a>
            <a href="${headPath }/member/delete.do?id=${member.id}" class="button">회원 탈퇴</a>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
