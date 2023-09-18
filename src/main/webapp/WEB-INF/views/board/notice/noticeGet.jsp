<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="headPath" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼::공지사항</title>
    <jsp:include page="../../include/head.jsp" />
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <jsp:include page="../../include/header.jsp" />
    </header>
    <div  class="contents" id="contents">
        <div class="sub">
            <h2>커뮤니티</h2>
        </div>

        <div class="content" id="content">
            <div class="row column text-center">
                <h2 class="h1">공지사항 상세 보기</h2>
                <hr>
                <div class="container">
                    <table id="table1">
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
                </div>
            </div>
        </div>
    </div>
    <footer class="ft" id="ft">
        <jsp:include page="../../include/footer.jsp" />

    </footer>
</div>
</body>

</html>
