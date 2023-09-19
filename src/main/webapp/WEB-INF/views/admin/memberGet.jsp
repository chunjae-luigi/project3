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
</head>

<body>
<jsp:include page="../include/header.jsp" />
<div style="display: flex; min-height: 80vh;">
    <jsp:include page="./adminBoardList.jsp" />
    <div class="container" style="margin-top: 20px;">
        <h2 class="title">회원 정보</h2>

        <div class="page_wrap">
            <h2 class="page_tit">마이페이지</h2>
            <table class="table tb2">
                <tbody>
                <tr>
                    <th>아이디</th>
                    <td>${member.id}</td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>${member.name}</td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>${member.tel}</td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>${member.email}</td>
                </tr>
                <tr>
                    <th>포인트</th>
                    <td>${member.point}</td>
                </tr>
                </tbody>
            </table>
            <div class="btn_group">
                <button type="button" onclick="remove()" class="button is-primary" >회원 탈퇴</button>

            </div>
        </div>
    </div>

                <nav aria-label="Page navigation example" id="page-nation1">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
            </form>
    <script>
        function remove() {
            if(window.confirm("회원 탈퇴하겠습니까?")){
                location.href = "${headPath}/admin/delete.do?id=${member.id}"
            }
        }
    </script>
        </div>
    </div>
</div>
</body>
</html>
