<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>출석체크</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="./../include/head.jsp" />
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="./../include/header.jsp" />

    <section class="page-title bg-02">
        <div class="container">
            <div class="columns">
                <div class="column is-12">
                    <div class="block has-text-centered">
                        <h1 class="is-capitalize text-lg font-happy">자유게시판</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <figure class="visual" id="vs1">
        <ul class="imgbox">
            <li class="hero is-medium is-link">
                <div class="hero-body">
                    <p class="title">
                        투표
                    </p>
                    <p class="subtitle">
                        나의 투표 내역을 확인하세요.
                    </p>
                </div>
            </li>
        </ul>
    </figure>
    <div class="content" id="content">
        <div class="row column text-center">
            <div class="container">
                <h2 class="page_tit">마이 페이지</h2>
                <hr>
                <div class="tabs is-centered">
                    <ul>
                        <li><a href="${path }/member/get.do?sid=${sid}">나의 정보</a></li>
                        <li class="is-active"><a>나의 투표 내역</a></li>
                        <li><a href="${path }/attend/getMyAttend.do">나의 출석</a></li>
                    </ul>
                </div>
                <hr>
                <div class="columns is-mobile">
                    <div class="column is-three-fifths is-offset-one-fifth">
                        <table class="table is-fullwidth is-bordered">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>제목</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="vote" items="${voteList }" varStatus="status">
                                <tr>
                                    <td>${status.count }</td>
                                    <td><a href="${path }/vote/get.do?vno=${vote.vno }"><c:if test="${!vote.stateYn }">[완료] </c:if>${vote.title }</a></td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty voteList }">
                                <tr>
                                    <td colspan="2">진행한 투표가 없습니다.</td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 푸터 부분 인클루드 -->
    <footer class="ft" name="ft">
        <jsp:include page="./../include/footer.jsp" />
    </footer>
</div>
</body>
</html>