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

	<style>
		.conwrap {
			margin: 0 0 20px;
			padding: 30px 30px 60px;
			background: #ffffff;
		}

		.conwrap:last-child {
			margin: 0;
		}

		.h3group {
			overflow: hidden;
			margin: -30px -30px 0;
			padding: 30px;
			border-bottom: 1px solid #e6e6e8;
			background: #ffffff;
		}

		.h3group.tit {
			float: left;
			font-family: 'NanumSquare';
			font-weight: 700;
			font-size: 30px;
			line-height: 44px;
			color: #2d2d2d;
		}

		.hgroup.util {

		}

		.h3group .location {
			float: right;
		}

		.h3group .location .depth {
			display: block;
			float: left;
			position: relative;
			margin: 0 25px 0 0;
			font-size: 14px;
			line-height: 44px;
			color: #777777;
		}

		.h3group .location .depth:after {
			display: block;
			content: '';
			position: absolute;
			top: 50%;
			right: -15px;
			width: 6px;
			height: 9px;
			margin: -4px 0 0;

		}

		.h3group .location .this {
			display: block;
			float: left;
			font-weight: 700;
			font-size: 14px;
			line-height: 44px;
			color: #2d2d2d;
		}

		.viewbody .hgroup .tit {
			text-align: center;
			font-weight: 700;
			font-size: 42px;
			margin: 0 0 20px;
		}

		.viewbody .content {
			font-size: 20px;
			position: relative;
			line-height: 26px;
			color: #666666;
			text-align: center;
		}

		.viewbody .hgroup .util div {
			font-size: 15px;
			text-align: center;
			display: inline-block;
			margin: 10px 20px;
		}


		.dat_add {
			height: 80px;
			padding: 15px 80px 15px 20px;
			border: none;
			background: #f6f6f9;
		}
	</style>
</head>

<body>
<header class="hd" id="hd">
	<jsp:include page="../../include/header.jsp" />
</header>
<div class="content">

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

	<section class="section blog-wrap container">




			<div class="conwrap">
				<div class="h3group">
					<div class="location">
						<span class="depth">홈</span>
						<span class="depth">커뮤니티</span><strong class="this">자유게시판</strong>
					</div>
				</div>
				<div class="viewbody">
					<div class="hgroup">
						<div class="no">${dto.fno }</div>
						<div class="tit">${dto.title }</div>
						<div class="util">
							<div class="name">${dto.author }</div>
							<div class="date">작성일 ${dto.regdate }</div>
							<div class="hit">조회수 ${dto.visited }</div></div>
						</div>
					<div class="content">

							${dto.content }

					</div>


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
				<a class="button is-primary" href="${path }/board/free/delete.do?fno=${dto.fno}&author=${dto.author}">글 삭제</a>
				</c:if>
				<c:if test="${not empty sid && (dto.author eq sid)}">
				<a class="button is-danger" href="${path }/board/free/update.do?fno=${dto.fno}&author=${dto.author}">글 수정</a>
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