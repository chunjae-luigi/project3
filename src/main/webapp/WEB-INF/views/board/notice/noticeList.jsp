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
<div class="wrap">
    <header class="hd" id="hd">
        <jsp:include page="../../include/header.jsp" />

    </header>
    <div  class="contents" id="contents">
        <div class="sub">
            <h2>커뮤니티</h2>
        </div>
        <div class="breadcrumb">
            <p><a href="/"> HOME </a> &gt; <a href="${headPath }/board/notice/noticeList.jsp"> 커뮤니티 </a> &gt; <span> 공지사항 </span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">공지사항</h2>
                <table class="table tb1" id="myTable">
                    <colgroup>
                        <col style="width:8%;">
                        <col style="width:auto;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                    </colgroup>
                    <thead>
                    <tr>
                        <th class="item1">번호</th>
                        <th class="item2">제목</th>
                        <th class="item3">작성일</th>
                        <th class="item4">조회</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <c:forEach items="${noticeList }" var="notice" varStatus="status">
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
<%--                </c:if>--%>
            </div>
            <script>
                $(document).ready(function(){
                    if($("tbody tr").length==0){
                        $("tbody").append("<tr><td colspan='4' class='text-center'>해당 목록이 존재하지 않습니다.</td></tr>")
                    }
                })
            </script>
        </section>
    </div>
    <footer class="ft" id="ft">
        <jsp:include page="../../include/footer.jsp" />

    </footer>
</div>
</body>

</html>
