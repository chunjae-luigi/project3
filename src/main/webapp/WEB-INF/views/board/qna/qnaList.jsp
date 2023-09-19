<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼</title>
    <%@ include file="../../include/head.jsp" %>
    <link rel="stylesheet" href="${headPath }/resources/css/sub.css">
    <style>
        a .answers {padding-left:30px;}
    </style>
</head>

<body>
<%@ include file="../../include/header.jsp" %>

<div class="content">

    <section class="page-title bg-1">
        <div class="container">
            <div class="columns">
                <div class="column is-12">
                    <div class="block has-text-centered">
                        <h1 class="is-capitalize text-lg font-happy">Qna</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="section blog-wrap container">
        <form action="${headPath }/board/qnaList.do" method="get" class="field has-addons has-addons-right">
            <p class="control">
                <span class="select">
                    <select id="type" name="type">
                        <option value="title">제목</option>
                    </select>
                </span>
            </p>
            <p class="control">
                <input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${keyword }">
            </p>
            <p class="control">
                <input type="submit" class="button is-mainColor" value="검색" />
            </p>
        </form>

        <table class="table">
            <thead>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="qna" items="${qnaList}" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <c:if test='${qna.lev == 0}'>
                            <td><a href="${headPath }/board/qnaGet.do?qno=${qna.qno}">${qna.title}</a></td>
                        </c:if>
                        <c:if test='${qna.lev == 1}'>
                            <td><a class="answers" href="${headPath }/board/qnaGet.do?qno=${qna.qno}">└ [답변]${qna.title}</a>
                            </td>
                        </c:if>
                        <td>${qna.author}</td>
                        <td>${qna.regdate}</td>
                        <td>${qna.visited}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="${headPath}/board/qnaInsert.do?lev=0&par=0" class="button is-primary">문의하기</a>

        <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
            <c:if test="${curPage > page.pageCount }">
                <a href="${headPath }/board/qnaList.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
            </c:if>
            <c:if test="${page.blockLastNum < page.totalPageCount }">
                <a href="${headPath }/board/qnaList.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
            </c:if>

            <ul class="pagination-list">
                <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                    <c:choose>
                        <c:when test="${i == curPage }">
                            <li>
                                <a href="${headPath }/board/qnaList.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page">${i }</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="${headPath }/board/qnaList.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </nav>
    </section>

</div>

<%@ include file="../../include/footer.jsp" %>
</body>
</html>
<script>
    $(document).ready(function(){
        if($("tbody tr").length==0){
            $("tbody").append("<tr><td colspan='4' class='text-center'>해당 목록이 존재하지 않습니다.</td></tr>")
        }
    })
</script>