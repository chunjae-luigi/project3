<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="/pro3_war" />
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
<div class="container is-fullhd">
	<!-- 헤더 부분 인클루드 -->
	<jsp:include page="../../include/header.jsp"></jsp:include>
	<figure class="visual" id="vs1">
		<ul class="imgbox">
			<li class="hero is-medium is-link">
				<div class="hero-body">
					<p class="title">
						Medium hero
					</p>
					<p class="subtitle">
						Medium subtitle
					</p>
				</div>
			</li>
		</ul>
	</figure>
	<div class="content" id="contents">
	    <div class="row column text-center">
	      <h2 class="h1">자유게시판 상세 보기</h2>
	      <hr>
	      <div class="container">
		      <table id="table1">
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
		      			<td>${dto.id }</td>
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



			<!-- 댓글 영역 test -->

			  <div class="conwrap">
				  <h4 class="tit">한줄 의견을 나눠 보세요</h4>
				  <div class="dat_add">
					  <form action="${path1 }/dat/insert.do" method="post">
						  <input type="hidden" name="id" id="id"  value="${sid}">
						  <input type="hidden" name="par" id="par" value="${dto.fno}">

						  <textarea rows="5" cols="50" name="content" id="content" class="tet" maxlength="300" required placeholder="이곳에 댓글을 입력해주세요!" autofocus></textarea>
						  <input type="submit" class="dat_btn" value="댓글 등록">
					  </form>
				  </div>

				  <tbody>
				  <div class="dat_list">
					  <div class="h4group">

					  </div>
					  <c:forEach var="dat" items="${datList }">

						  <p>작성자${dat.author}</p>
						  <td>${dat.regdate }</td>
						  <td>
							  <textarea name="" id="" cols="30" rows="5" readonly>${dat.content}</textarea>
						  </td>
<%--		  이곳을 보아라 !--%>
						 		 <a class="button is-primary" href="${path1 }/dat/delete.do?dno=${dat.dno}&fno=${fno}">삭제</a>
					  </c:forEach>
					  <c:if test="${empty datList }">
						  <tr>
							  <td colspan="4">댓글이 존재하지 않습니다.</td>
						  </tr>
					  </c:if>
				  </div>
				  </tbody>

				  <tbody>
				  <c:forEach items="${datList }" var="board" varStatus="status">
					  <tr>
						  <td>${status.count }</td>
						  <td>${dat.content }</td>
						  <td>
							  <fmt:parseDate value="${dat.regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
							  <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
						  </td>
					  </tr>
				  </c:forEach>
				  </tbody>





					<!-- 여기까지 댓글 영역 -->


				<div class="button-group">
				  <a class="button is-info" href="${path1 }/free/list.do">글 목록</a>
				  <a class="button is-primary" href="${path1 }/free/delete.do?fno=${dto.fno}">글 삭제</a>
				  <a class="button is-danger" href="${path1 }/free/edit.do?fno=${dto.fno}">글 수정</a>
				</div>
	      </div>
	    </div>

	</div>
	<!-- 푸터 부분 인클루드 -->
	<jsp:include page="../../include/footer.jsp"></jsp:include>
</div>
</body>
</html>