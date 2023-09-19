<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="headPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>공지사항 상세보기</title>
    <jsp:include page=".././include/head.jsp" />
</head>

<body>
<jsp:include page="../include/header.jsp" />
<div style="display: flex; min-height: 80vh;">
    <jsp:include page="./adminBoardList.jsp" />
    <div class="container" style="margin-top: 20px;">
        <h2 class="title">공지사항 상세보기</h2>
        <div class="container">
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
                <a class="button" href="${headPath }/admin/List.do">글 목록</a>
                <a class="button" href="${headPath }/admin/Update.do?no=${notice.no}">글 수정</a>
                <a class="button" href="${headPath }/admin/Delete.do?no=${notice.no}">글 삭제</a>
            </div>
        </div>
    </div>
</div>
<jsp:include page=".././include/footer.jsp" />

</body>

</html>
