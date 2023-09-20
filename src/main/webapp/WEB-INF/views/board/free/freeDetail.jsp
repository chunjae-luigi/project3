<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<title>자유게시판 글 보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../../include/head.jsp"></jsp:include>
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

	<section class="section blog-wrap container">
		<table class="table" id="myTable">
			<tbody>

			<tr>
				<th style="background-color:#dcdcdc">글 번호</th>
				<td>${dto.fno }</td>
			</tr>
			<tr>
				<th style="background-color:#dcdcdc">글 제목</th>
				<td>${dto.title }</td>
			</tr>
			<tr>
				<th style="background-color:#dcdcdc">글 내용</th>
				<td><p>${dto.content }</p></td>
			</tr>
			<tr>
				<th style="background-color:#dcdcdc">작성자</th>
				<td>${dto.author }</td>
			</tr>
			<tr>
				<th style="background-color:#dcdcdc">작성일시</th>
				<td>${dto.regdate }</td>
			</tr>
			<tr>
				<th style="background-color:#dcdcdc">읽은 횟수</th>
				<td>${dto.visited }</td>
			</tr>
			</tbody>
		</table>

		<!-- 댓글 영역 -->

		<div class="conwrap">
			<h4 class="tit">한줄 의견을 나눠 보세요</h4>
			<div class="dat_add">
				<c:if test="${not empty sid}">
				<form action="${path }/dat/insert.do" method="post">
					<input type="hidden" name="id" id="id"  value="${sid}">
					<input type="hidden" name="par" id="par" value="${dto.fno}">

					<textarea rows="5" cols="50" name="content" id="content" class="tet" maxlength="300" required placeholder="이곳에 댓글을 입력해주세요!" autofocus></textarea>

					<input type="submit" class="dat_btn" value="댓글 등록">
				</form>
				</c:if>
			</div>
			<div class="dat_list">

				<ul>

				<c:forEach var="dat" items="${datList }">
					<li style="border-bottom:1px solid #cc0f35">
						<div>
							<p>작성자${dat.author}
							<span>
								<fmt:parseDate value="${dat.regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
							</span>
							</p>
						</div>
						<div>
							<textarea name="" id="" cols="30" rows="5" readonly>${dat.content}</textarea>
							<c:if test="${sid eq dat.author || sid eq 'admin'}">
								<a class="button is-primary" href="${path }/dat/delete.do?dno=${dat.dno}&fno=${fno}">삭제</a>
							</c:if>
						</div>
					</li>
					</c:forEach>

				</ul>
				<c:if test="${empty datList }">
					<tr>
						<td colspan="4">댓글이 존재하지 않습니다.</td>
					</tr>
				</c:if>
			</div>
			<%--<tbody>
			<c:forEach items="${datList }" var="board" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${dat.content }</td>
					<td>

					</td>
				</tr>
			</c:forEach>
			</tbody>--%>

			<!-- 여기까지 댓글 영역 -->


			<div class="button-group">
				<a class="button is-info" href="${path }/board/free/list.do">글 목록</a>
				<c:if test="${not empty sid && (sid eq 'admin' || dto.author eq sid)}">
				<a class="button is-primary" href="${path }/board/free/delete.do?fno=${dto.fno}">글 삭제</a>
				</c:if>
				<c:if test="${not empty sid && (dto.author eq sid)}">
				<a class="button is-danger" href="${path }/board/free/edit.do?fno=${dto.fno}">글 수정</a>
				</c:if>
			</div>
		</div>


	</section>
	</div>
	<!-- 푸터 부분 인클루드 -->
	<jsp:include page="../../include/footer.jsp"></jsp:include>
</div>
</body>
</html>