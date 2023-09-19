<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<title>티스푼</title>
	<%@ include file="../../include/head.jsp" %>
	<style>
		a .answers {padding-left:30px;}
	</style>
</head>

<body>
<header class="hd" id="hd">
	<jsp:include page="../../include/header.jsp" />
</header>

<div class="content">

	<section class="page-title bg-1">
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

	<div class="content" id="contents">
	    <div class="row column text-center">
	      <h2 class="has-text-centered">자유게시판 목록</h2>
	      <hr>

			<section class="section blog-wrap container">
				<form action="${path }/board/free/list.do" method="get" class="field has-addons has-addons-right">
					<p class="control">
                <span class="select">
                    <select id="type" name="type">
                        <option value="title">제목</option>
						<option value="content">내용</option>
						<option value="id">작성자</option>
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
				<c:if test="${not empty freeList }">
		      	<c:forEach items="${freeList }" var="free" varStatus="status">
		      		<tr>
		      			<td>${status.count }</td>
		      			<td><a href="${path}/board/free/detail.do?fno=${free.fno }">${free.title }</a></td>
						<td>${free.author}</td>
		      			<td>
	      					<fmt:parseDate value="${free.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
	      					<fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
		      			</td>
		      			<td>${free.visited }</td>
		      		</tr>
		      	</c:forEach>
				</c:if>
				<c:if test="${empty freeList }">
					<tr>
						<td colspan="4">자유게시판에 글이 존재하지 않습니다.</td>
					</tr>
				</c:if>
		      	</tbody>
		      </table>
			      	    <%-- <c:if test='${sid eq "admin"}'>  --%> 
		      	<div class="button-group">
				  <a class="button is-info" href="${path }/board/free/insert.do">글쓰기</a>
				</div>
			</section>
			<%-- </c:if> --%>

			<nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
				<c:if test="${curPage > page.pageCount }">
					<a href="${path }/board/free/list.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
				</c:if>
				<c:if test="${page.blockLastNum < page.totalPageCount }">
					<a href="${path }/board/free/list.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
				</c:if>

				<ul class="pagination-list">
					<c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
						<c:choose>
							<c:when test="${i == curPage }">
								<li>
									<a href="${path }/board/free/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page">${i }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="${path }/board/free/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</nav>

	    </div>
	</div>
	<!-- 푸터 부분 인클루드 -->
	<jsp:include page="../../include/footer.jsp"></jsp:include>
</div>
</body>
</html>