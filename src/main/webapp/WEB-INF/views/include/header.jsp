<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<c:set var="headPath" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>

<header class="navigation">
    <div class="header-top ">
        <div class="container">
            <div class="columns is-gapless is-justify-content-space-between is-align-items-center">
                <div class="column is-12-desktop is-8-tablet">
                    <div class="header-top-right has-text-right-tablet has-text-centered-mobile">
                        <c:choose>
                            <c:when test="${sid=='admin'}">
                                <a href="${headPath }/member/logout.do">로그아웃</a>
                                <a href="${headPath }/member/get.do">마이페이지</a>
                                <a href="${headPath }/admin/MemberListAdmin.do">관리자페이지</a>
                            </c:when>
                            <c:when test="${!empty sid}">
                                <a href="${headPath }/member/logout.do">로그아웃</a>
                                <a href="#">마이페이지</a>
                            </c:when>
                            <c:otherwise>
                                <a href="${headPath }/member/login.do">로그인</a>
                                <a href="${headPath }/member/term.do">회원가입</a>
                                <a href="#">오시는 길</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <nav id="navbar" class="navbar main-nav">
        <div class="container">
            <div class="navbar-brand">
                <a class="navbar-item" href="${headPath }/">
                    <img src="${headPath }/resources/image/common/logo.png" alt="티스푼 로고타입">
                </a>
                <button role="button" class="navbar-burger burger" data-hidden="true" data-target="navigation">
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                </button>
            </div>

            <div class="navbar-menu mr-0" id="navigation">
                <ul class="navbar-end">
                    <li class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link">회사소개<span class="ml-1">+</span></a>
                        <div class="navbar-dropdown">
                            <a class="navbar-item" href="${headPath }/WEB-INF/views/company/company01.jsp">인사말</a>
                            <a class="navbar-item" href="${headPath }/WEB-INF/views/company/company02.jsp">연혁</a>
                            <a class="navbar-item" href="${headPath }/WEB-INF/views/company/company03.jsp">오시는 길</a>
                        </div>
                    </li>

                    <li class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link">커뮤니티<span class="ml-1">+</span></a>
                        <div class="navbar-dropdown">
                            <a class="navbar-item" href="${headPath }/notice/List.do">공지사항</a>
                            <a class="navbar-item" href="${headPath }/WEB-INF/views/company/company02.jsp">자유게시판</a>
                            <a class="navbar-item" href="${headPath }/WEB-INF/views/company/company03.jsp">QnA</a>
                        </div>
                    </li>

                    <li class="navbar-item">
                        <a class="navbar-link" href="${headPath }/board/dataBoard/list.do">자료실</a>
                    </li>

                    <li class="navbar-item">
                        <a class="navbar-link" href="${headPath }/vote/list.do">투표</a>
                    </li>

                    <li class="navbar-item">
                        <a class="navbar-link" href="index.html">출석</a>
                    </li>

                    <li class="navbar-item">
                        <a class="navbar-link" href="${headPath }/template">템플릿</a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
</header>
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