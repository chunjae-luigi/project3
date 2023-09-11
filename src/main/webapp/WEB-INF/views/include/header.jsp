<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<c:set var="headPath" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('id') } }"/>

<div class="hd_wrap" id="hdWrap">
    <a href="${headPath }/" class="logo">
        <img src="${headPath }/resources/image/common/logo.png" alt="티스푼 로고타입">
    </a>
    <nav class="gnb" id="hdGnb">
        <ul class="menu">
            <li class="item1">
                <a href="${headPath }/WEB-INF/views/company/company01.jsp" class="dp1">회사소개</a>
                <ul class="sub">
                    <li><a href="${headPath }/WEB-INF/views/company/company01.jsp">인사말</a></li>
                    <li><a href="${headPath }/WEB-INF/views/company/company02.jsp">연혁</a></li>
                    <li><a href="${headPath }/WEB-INF/views/company/company03.jsp">오시는 길</a></li>
                </ul>
            </li>
            <li class="item3">
                <a href="${headPath }/WEB-INF/views/board/notice/listNotice.jsp" class="dp1">커뮤니티</a>
                <ul class="sub">
                    <li><a href="${headPath }/WEB-INF/views/board/notice/listNotice.jsp">공지사항</a></li>
                    <li><a href="${headPath }/WEB-INF/views/board/forum/listBoard.jsp">자유게시판</a></li>
                    <li><a href="${headPath }/WEB-INF/views/board/faq/">Faq</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <nav class="tnb">
        <ul class="menu">
            <c:choose>
                <c:when test="${!empty sid}">
                    <li><a href="${headPath }/WEB-INF/views/member/logout.jsp">로그아웃</a></li>
                    <li><a href="${headPath }/WEB-INF/views/member/mypage.jsp">마이페이지</a></li>
                </c:when>
                <c:when test="${sid=='admin'}">
                    <li><a href="${headPath }/WEB-INF/views/member/logout.jsp">로그아웃</a></li>
                    <li><a href="${headPath }/WEB-INF/views/member/mypage.jsp">마이페이지</a></li>
                    <li><a href="${headPath }/WEB-INF/views/admin/memberList.jsp">관리자페이지</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${headPath }/WEB-INF/views/member/login.jsp">로그인</a></li>
                    <li><a href="${headPath }/WEB-INF/views/member/term.jsp">회원가입</a></li>
                    <li><a href="${headPath }/WEB-INF/views/company/company03.jsp">오시는 길</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
</div>

<script>
    var gnb = document.getElementById("hdGnb");
    var hdWrap = document.getElementById("hdWrap");
    gnb.addEventListener("mouseover", function() {
        hdWrap.classList.add("hoverMenu");
    });

    gnb.addEventListener("mouseleave", function () {
        hdWrap.classList.remove("hoverMenu");
    });
</script>