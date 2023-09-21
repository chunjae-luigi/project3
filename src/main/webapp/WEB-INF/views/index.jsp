<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="headPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼</title>
    <%@ include file="include/head.jsp" %>
    <link rel="stylesheet" href="${headPath}/resources/css/main.css">


    <!--<link rel="stylesheet" href="/resources/css/style.css">-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.4/dist/css/bulma-carousel.min.css" />
</head>
<body>
<%@ include file="include/header.jsp" %>

<div class="content" id="content">

    <!-- Slider Start -->
<%--    <section class="slider">--%>
<%--        <div class="container">--%>
<%--            <div class="columns is-justify-content-center">--%>
<%--                <div class="column is-9-desktop is-10-tablet">--%>
<%--                    <div class="block has-text-centered">--%>
<%--                        <span class="is-block mb-4 text-white is-capitalized">Empower Learning Together with Tspoon</span>--%>
<%--                        <h1 class="mb-5">함께하는 학습,<br>티스푼과 함께하세요!</h1>--%>
<%--                        <p class="mb-6">자녀의 학습을 한 눈에 관리하고,<br>최신 교육 트렌드를 커뮤니티에서 이야기해보세요</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>

    <section>
        <div id="slider">
            <div class="card">
                <div class="card-image">
                    <figure class="image is-16by9 is-covered">
                        <img src="${headPath }/resources/image/main/main1.png" alt="" />
                    </figure>
                </div>
            </div>
            <div class="card ">
                <div class="card-image">
                    <figure class="image is-16by9 is-covered">
                        <img src="${headPath }/resources/image/main/main2.png" alt="" />
                    </figure>
                </div>
            </div>
            <div class="card ">
                <div class="card-image">
                    <figure class="image is-16by9 is-covered">
                        <img src="${headPath }/resources/image/main/main3.png" alt="" />
                    </figure>
                </div>
            </div>
        </div>
    </section>
    <!--<script src="/resources/js/script.js"></script>-->
    <script src="https://cdn.jsdelivr.net/npm/bulma-carousel@4.0.3/dist/js/bulma-carousel.min.js"></script>
    <script>
        bulmaCarousel.attach('#slider', {
            slidesToScroll: 1,
            slidesToShow: 1,
            infinite: true,
            autoplay: true,
        });
    </script>
    <%-- 미니 게시판 --%>

    <div class="container is-fullhd">
        <section class="section pb-0 my-5 notice_area">
            <div class="columns">
                <div class="column is-half">
                    <h2 class="subtitle noticeTitle">공지사항<a href="${headPath }/notice/List.do" class="delete is-large"></a></h2>
                    <ul class="board_con mx-0" style="list-style-type: none">
                        <c:forEach var="notice" items="${noticeList}">
                            <fmt:parseDate value="${notice.regdate }" var="noticeRegdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <li><a href="${headPath }/notice/Get.do?no=${notice.no}">${notice.title}<span class="date"><fmt:formatDate value="${noticeRegdate }" pattern="yyyy-MM-dd" /></span></a></li>
                        </c:forEach>
                        <c:if test="${empty noticeList}">
                            <li class="no_date">
                                등록된 공지사항이 없습니다.
                            </li>
                        </c:if>
                    </ul>
                </div>
                <div class="column is-half ">
                    <h2 class="subtitle noticeTitle">자유게시판<a href="${headPath }/board/free/list.do" class="delete is-large"></a></h2>
                    <ul class="board_con mx-0" style="list-style-type: none">
                        <c:forEach var="free" items="${freeList}">
                            <fmt:parseDate value="${free.regdate }" var="freeRegdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <li><a href="${headPath }/board/free/get.do?fno=${free.fno}">${free.title}<span class="date"><fmt:formatDate value="${freeRegdate }" pattern="yyyy-MM-dd" /></span></a></li>
                        </c:forEach>
                        <c:if test="${empty freeList}">
                            <li class="no_date">
                                등록된 게시글이 없습니다.
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </section>

        <section>
            <img src="${headPath }/resources/image/main/banner011.png" alt="수목원 가족여행">
        </section>

        <section class="section mb-5 blog-wrap news_area">
            <h2 class="subtitle">언론보도<a href="${headPath }/template" class="delete is-large news"></a></h2>
            <div class="columns">
                <c:forEach var="news" items="${newsList}">
                    <div class="column is-3">
                        <a href="${news.href}" target="_blank">
                            <div class="card" style="height:400px;overflow:hidden;">
                                <div class="card-image">
                                    <figure class="image is-4by3">
                                        <img src="${news.img}">
                                    </figure>
                                </div>
                                <div class="media p-2 m-0">
                                    <p class="title is-4">
                                        <c:choose>
                                            <c:when test="${fn:length(news.title) gt 20}">
                                                <c:out value="${fn:substring(news.title, 0, 20)}"></c:out>...
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="${news.title}"></c:out>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                                <div class="content p-2">
                                    <c:choose>
                                        <c:when test="${fn:length(news.content) gt 70}">
                                            <c:out value="${fn:substring(news.content, 0, 70)}"></c:out>...
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="${news.content}"></c:out>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </section>
    </div>
</div>


<%@ include file="include/footer.jsp" %>


<!-- banner -->
<div class="footBnrFixed" id="footBnrModal">
    <div class="bannerArea">
        <img src="${headPath }/resources/image/main/banner1.png" onclick="location.href='${headPath }/event1';" alt="수목원 가족여행">
        <button type="button" class="delete is-medium closeBanner" onclick="closeBanner();">닫기</button>
    </div>
</div>

<!-- quickMenu -->
<div class="quickMenu">
    <div class="quick_title">
        Quick
        <br>
        Menu
    </div>
    <div class="quick_btn">
        <ul>
            <li class="quick01">
                <a href="${headPath }/notice/List.do">
                    <p>공지사항</p>
                </a>
            </li>
            <li class="quick02">
                <a href="${headPath}/attend/getMyAttend.do">
                    <p>출석체크</p>
                </a>
            </li>
            <li class="quick03">
                <a href="${headPath }/vote/list.do">
                    <p>투표하기</p>
                </a>
            </li>
        </ul>
    </div>
    <div class="quick_top">
        <a href="#">TOP</a>
    </div>
</div>

<!-- uiPopup -->
<div class="uiPopup" id="popupModal">
    <div class="ui_body">
        <div>
            <a href="${headPath}/event2">
                <img src="${headPath }/resources/image/main/popup1.png" alt="6모의고사">
            </a>
        </div>
    </div>
    <div class="ui_top">
        <div class="ui-day">
            <input type="checkbox" name="chk" id="chk" />
            <label for="chk">오늘 하루 열지않기</label>
            <button type="button" class="delete is-medium closeBtn" onclick="closePopup();">닫기</button>
        </div>
    </div>
</div>

<div class="uiPopup uiPopup2" id="popupModal2">
    <div class="ui_body">
        <div>
            <a href="${headPath}/vote/list.do">
                <img src="${headPath }/resources/image/main/main_vote.png" alt="투표 관련" />
            </a>
        </div>
    </div>
    <div class="ui_top">
        <div class="ui-day">
            <input type="checkbox" name="chk2" id="chk2" />
            <label for="chk2">오늘 하루 열지않기</label>
            <button type="button" class="delete is-medium closeBtn" onclick="closePopup2();">닫기</button>
        </div>
    </div>
</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>
    $(function (){
        if($.cookie('popupCookie') != undefined){
            $("#popupModal").hide();
        }
        if($.cookie('popupCookie2') != undefined){
            $("#popupModal2").hide();
        }
    });
    function closePopup(){
        $("#popupModal").hide();
        if($("#chk").is(":checked") && $.cookie('popupCookie') == undefined){
            $.cookie('popupCookie', 'Y', { expires: 1, path: '/' });
        }
    }
    function closePopup2(){
        $("#popupModal2").hide();
        if($("#chk2").is(":checked") && $.cookie('popupCookie2') == undefined) {
            $.cookie('popupCookie2', 'Y', { expires: 1, path: '/' });
        }
    }
    /*function closeBanner(){
        $("#footBnrModal").hide();
    }*/
</script>
</body>
</html>
