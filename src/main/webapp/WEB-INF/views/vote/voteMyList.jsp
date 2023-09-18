<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼::투표</title>
    <jsp:include page="../include/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/sub.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <jsp:include page="../include/header.jsp" />
    </header>
    <div class="container is-fullhd">
        <nav class="breadcrumb is-right" aria-label="breadcrumbs">
            <ul>
                <li><a href="/">HOME</a></li>
                <li class="is-active"><a href="${path }/vote/voteList.jsp" aria-current="page">나의 투표내역</a></li>
            </ul>
        </nav>
        <section class="section">
            <h2 class="title has-text-centered">나의 투표내역</h2>

            <section class="section">
                <h2 class="title has-text-centered">${title }</h2>
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
            </section>
        </section>
    </div>
    <footer class="ft" id="ft">
        <jsp:include page="../include/footer.jsp" />
    </footer>
</div>
</body>
</html>
