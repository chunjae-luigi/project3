<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="headPath" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>공지사항 상세보기</title>
    <jsp:include page="../../include/head.jsp" />
</head>

<body>
<jsp:include page="../../include/header.jsp" />
<div class="content">

    <section class="page-title bg-1">
        <div class="container">
            <div class="columns">
                <div class="column is-12">
                    <div class="block has-text-centered">
                        <h1 class="is-capitalize text-lg font-happy">공지사항 상세보기</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section blog-wrap container">
        <table class="table" id="myTable">
            <tbody>
            <tr>
                <th style="background-color:#dcdcdc">글 번호</th>
                <td>${notice.no }</td>
            </tr>
            <tr>
                <th style="background-color:#dcdcdc">글 제목</th>
                <td>${notice.title }</td>
            </tr>
            <tr>
                <th style="background-color:#dcdcdc">글 내용</th>
                <td><p>${notice.content }</p></td>
            </tr>
            <tr>
                <th style="background-color:#dcdcdc">작성일시</th>
                <td>${notice.regdate }</td>
            </tr>
            <tr>
                <th style="background-color:#dcdcdc">읽은 횟수</th>
                <td>${notice.visited }</td>
            </tr>
            </tbody>
        </table>
        <div class="button-group">
            <a class="button" href="${headPath }/notice/List.do">글 목록</a>
            <a class="button" href="${headPath }/notice/Update.do?no=${notice.no}">글 수정</a>
            <a class="button" href="${headPath }/notice/Delete.do?no=${notice.no}">글 삭제</a>
        </div>
        <jsp:include page="../../include/footer.jsp" />
</body>

</html>
