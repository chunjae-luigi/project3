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
   

    <link rel="stylesheet" href="/resources/css/style.css">
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
    <script src="/resources/js/script.js"></script>
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
        <section class="section my-5 notice_area">
            <div class="columns">
                <div class="column is-half">
                    <h2 class="subtitle">공지사항<a href="${headPath }/notice/List.do" class="delete is-large"></a></h2>
                    <ul class="board_con mx-0" style="list-style-type: none">
                        <c:forEach var="notice" items="${noticeList}">
                            <li><a href="${headPath }/notice/Get.do?no=${notice.no}">${notice.title}<span class="date">${notice.regdate}</span></a></li>
                        </c:forEach>
                        <c:if test="${empty noticeList}">
                            <li class="no_date">
                                등록된 공지사항이 없습니다.
                            </li>
                        </c:if>
                    </ul>
                </div>
                <div class="column is-half ">
                    <h2 class="subtitle">자유게시판<a href="${headPath }/board/free/list.do" class="delete is-large"></a></h2>
                    <ul class="board_con mx-0" style="list-style-type: none">
                        <c:forEach var="free" items="${freeList}">
                            <li><a href="${headPath }/free/detail.do?fno=${free.fno}">${free.title}<span class="date">${free.regdate}</span></a></li>
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
    </div>
</div>


<%@ include file="include/footer.jsp" %>


<!-- banner -->
<div class="footBnrFixed" id="footBnrFixed">
    <a href="${headPath }/event1">
        <img src="${headPath }/resources/image/main/banner1.png" alt="수목원 가족여행">
        <button type="button" class="delete is-medium closebanner" onclick="closebanner();">닫기</button>
    </a>
</div>

<%--<div>
    <button type="button" class="closebanner" onclick="closebanner()">
        <img src="${headPath }/resources/image/main/x.png" alt="닫기">
    </button>
</div>--%>

<!-- quickMenu -->
<div class="quickMenu">
    <div class="quick_title">
        Quick
        <br>
        Menu
    </div>
    <div class="quick_btn">
        <ul>
            <li>
                <a href="${headPath }/notice/List.do">
                    <img src="${headPath }/resources/image/main/icon1.png" alt="아이콘1">
                    <br>
                    공지사항
                </a>
            </li>
            <li>
                <a href="${headPath}/attend/getMyAttend.do">
                    <img src="${headPath }/resources/image/main/icon1.png" alt="아이콘1">
                    <br>
                    출석체크
                </a>
            </li>
            <li>
                <a href="${headPath }/vote/list.do">
                    <img src="${headPath }/resources/image/main/icon1.png" alt="아이콘1">
                    <br>
                    투표하기
                </a>
            </li>
        </ul>
    </div>
    <div class="quick_top">
        <a href="#">TOP</a>
    </div>
</div>

<!-- uiPopup -->
<div class="uiPopup">
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
            <button type="button" class="delete is-medium closebtn" onclick="closePopup();">닫기</button>
        </div>
    </div>
</div>
<script>
    function closePopup(){
        $(".uiPopup").hide();
    }
    function closebanner(){
        $(".footBnrFixed").hide();
    }
</script>
</body>
</html>
