<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="headPath" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼::공지사항</title>
    <jsp:include page="../../include/head.jsp" />
</head>
<body>
<jsp:include page="../../include/header.jsp" />

<div class="content">
    <section class="page-title bg-1">
        <div class="container">
            <div class="columns">
                <div class="column is-12">
                    <div class="block has-text-centered">
                        <h1 class="is-capitalize text-lg font-happy">공지사항</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section blog-wrap container">
        <table class="table">
            <thead>
            <tr>
                <th class="item1">번호</th>
                <th class="item2">제목</th>
                <th class="item3">작성일</th>
                <th class="item4">조회</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${noticeList }" var="notice" varStatus="status">
                <tr>
                    <td>${status.count }</td>
                    <td><a href="${headPath }/notice/Get.do?no=${notice.no }">${notice.title }</a></td>
                    <td>${notice.regdate }</td>
                    <td>${notice.visited }</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%--                <c:if test='${sid eq "admin"}' >--%>
        <div class="btn_group">
            <a href="${headPath }/notice/Insert.do" class="inBtn inBtn1">공지 등록</a>
        </div>
</div>
</section>
<script>
    $(document).ready(function(){
        if($("tbody tr").length==0){
            $("tbody").append("<tr><td colspan='4' class='text-center'>해당 목록이 존재하지 않습니다.</td></tr>")
        }})
</script>
<jsp:include page="../../include/footer.jsp" />
</body>
</html>

