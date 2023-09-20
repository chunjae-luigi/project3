<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="headPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 마이페이지</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="./../include/head.jsp" />
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="./../include/header.jsp" />

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
    <div class="content" id="content">
        <div class="row column text-center">
            <div class="container">
                    <h2 class="page_tit">마이 페이지</h2>
                <hr>
                <div class="tabs is-centered">
                    <ul>
                        <li class="is-active"><a>나의 정보</a></li>
                        <li><a href="${headPath }/vote/getMyList.do">나의 투표 내역</a></li>
                        <li><a href="${headPath }/attend/getMyAttend.do">나의 출석</a></li>
                    </ul>
                </div>
                <hr>
                    <div class="table_form_wrap">
                        <table class="table_form">
                            <tbody>
                            <tr>
                                <th>아이디</th>
                                <td>${member.id }</td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>${member.name }</td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>${member.email }</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>${member.tel }</td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td>${member.addr1 } ${member.addr2} (${member.postcode })</td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td>${member.birth }</td>
                            </tr>
                            <tr>
                                <th>포인트</th>
                                <td>${member.point }</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="${headPath }/member/update.do?id=${sid }" class="button is-primary">회원 정보수정</a>
                                    <button type="button" onclick="remove()" class="button is-primary" >회원 탈퇴</button>

                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                <script>
                    function remove() {
                        if(window.confirm("회원 탈퇴하겠습니까?")){
                            location.href = "${headPath}/member/delete.do?id=${sid }"
                        }
                    }
                </script>
                <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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