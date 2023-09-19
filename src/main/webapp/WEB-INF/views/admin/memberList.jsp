<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="headPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 목록</title>
    <jsp:include page="../include/head.jsp" />
    <style>
        table {width: 100%; text-align: center;}
        .item1 {width: 5%}
        .item2 {width: 25%}
        .item3 {width: 25%}
        .item4 {width: 5%}
        .item5 {width: 40%}
    </style>
</head>


<body>
<jsp:include page="../include/header.jsp" />
<div style="display: flex; min-height: 80vh;">
    <jsp:include page="./adminBoardList.jsp" />
    <div class="container" style="margin-top: 20px;">
        <h2 class="title">회원</h2>
        <div class="container">
                <table class="table table-secondary" id="tb1">
                    <thead>
                    <tr>
                        <th class="item1">번호</th>
                        <th class="item2">아이디</th>
                        <th class="item3">이름</th>
                        <th class="item4">포인트</th>
                        <th class="item5">등록일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="member" items="${memberList}" varStatus="status">
                    <tr id="${status.count}">
                        <td class="item1">${status.count}</td>
                        <td class="item2">
                            <a class="link-body-emphasis link-offset-2 link-underline-opacity-25 link-underline-opacity-75-hover" href="${headPath }/admin/get.do?id=${member.id}" style="display:inline-block; width:100%;">${member.id}</a>
                        </td>
                        <td class="item3">${member.name}</td>
                        <td class="item4">${member.point}</td>
                        <td class="item5">${member.regdate}</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                <c:if test="${curPage > page.pageCount }">
                    <a href="${headPath }/admin/MemberListAdmin.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
                </c:if>
                <c:if test="${page.blockLastNum < page.totalPageCount }">
                    <a href="${headPath }/admin/MemberListAdmin.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
                </c:if>

                <ul class="pagination-list">
                    <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                        <c:choose>
                            <c:when test="${i == curPage }">
                                <li>
                                    <a href="${headPath }/admin/MemberListAdmin.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page">${i }</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="${headPath }/admin/MemberListAdmin.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>



<script>
    $(document).ready(function(){
        if($("tbody tr").length==0){
            $("tbody").append("<tr><td colspan='5' class='text-center'>해당 목록이 존재하지 않습니다.</td></tr>")
        }
    })
</script>