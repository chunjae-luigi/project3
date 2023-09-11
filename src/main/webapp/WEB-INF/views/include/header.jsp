<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<c:set var="headPath" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>


<nav class="navbar" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
        <a class="navbar-item" href="https://bulma.io">
            <img src="https://bulma.io/images/bulma-logo.png" width="112" height="28">
        </a>

        <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
        </a>
    </div>

    <div id="navbarBasicExample" class="navbar-menu">
        <div class="navbar-start">
            <a class="navbar-item is-active" href="${headPath }/">
                Home
            </a>
            <a class="navbar-item" href="${headPath }/WEB-INF/views/company/company01.jsp">
                Company
            </a>

            <a class="navbar-item" href="${headPath }/member/list.do">
                MemberList
            </a>

            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link">
                    Board
                </a>

                <div class="navbar-dropdown">
                    <a class="navbar-item">
                        About
                    </a>
                    <a class="navbar-item">
                        Forum
                    </a>
                    <a class="navbar-item">
                        Contact
                    </a>
                    <hr class="navbar-divider">
                    <a class="navbar-item">
                        Report an issue
                    </a>
                </div>
            </div>
        </div>

        <div class="navbar-end">
            <div class="navbar-item">
                <div class="buttons">
                    <c:choose>
                        <c:when test="${sid == 'admin'}">
                            <a class="button is-light" href="${headPath }/member/logout.do">Log Out</a>
                            <a class="button is-light" href="${headPath }/member/detail.do?id=${sid}">Member</a>
                            <a class="button is-light" href="${headPath }/WEB-INF/views/admin/memberList.jsp">Admin</a>
                        </c:when>
                        <c:when test="${not empty sid}">
                            <a class="button is-light" href="${headPath }/member/logout.do">Log Out</a>
                            <a class="button is-light" href="${headPath }/WEB-INF/views/member/memberDetail.jsp">마이페이지</a>
                        </c:when>
                        <c:otherwise>
                            <a class="button is-light" href="${headPath }/member/login.do">Log In</a>
                            <a class="button is-light" href="${headPath }/member/term.do">회원가입</a>
                            <a class="button is-light" href="${headPath }/WEB-INF/views/company/company03.jsp">오시는 길</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</nav>

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