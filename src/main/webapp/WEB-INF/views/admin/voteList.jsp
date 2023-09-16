<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
    <title>관리자::투표</title>
    <jsp:include page="../include/head.jsp" />
    <link rel="stylesheet" href="${path }/css/sub.css">
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
                <li class="is-active"><a href="${path }/vote/voteList.jsp" aria-current="page">투표</a></li>
            </ul>
        </nav>
        <section>
            <h2>투표</h2>
            <div class="columns is-multiline is-mobile">
                <c:forEach items="${voteList }" var="vote" varStatus="status">
                    <div class="column is-one-quarter">
                        <div class="vote_li">
                            <a href="${path }/vote/get.do?vno=${vote.vno}">
                                <p class="is-large">${vote.title}</p>
                                <p>조회수 : ${vote.visited}</p>
                                <p>시작일 : ${vote.startDate}</p>
                                <p>종료일 : ${vote.finishDate}</p>
                                <p>상태 : ${vote.useYn}</p>
                            </a>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty voteList }">
                    <div class="column">등록된 투표가 없습니다.</div>
                </c:if>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <jsp:include page="../include/footer.jsp" />
    </footer>
</div>
</body>
</html>
