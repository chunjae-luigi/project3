<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼</title>
    <%@ include file="include/head.jsp" %>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="include/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <figure class="vs">
            <ul class="img_box">
                <li class="item1 active">
                    <input type="radio" name="vs_ra" id="vs_ra1" class="vs_ra" checked>
                    <div class="bg_box"></div>
                    <h2 class="vs_tit">교육에 대한 끊임없는 도전<br>
                        <strong>행복한 내일을 함께 합니다</strong></h2>
                </li>
                <li class="item2">
                    <input type="radio" name="vs_ra" id="vs_ra2" class="vs_ra">
                    <div class="bg_box"></div>
                    <h2 class="vs_tit">“나눔의 힘! 실천의 힘!”<br>
                        <strong>작은 따뜻함으로 세상을 <br>바꿉니다</strong>
                    </h2>
                </li>
            </ul>
            <ul class="btn_box">
                <li class="item1 active"><label for="vs_ra1" class="vs_btn"></label></li>
                <li class="item2"><label for="vs_ra2" class="vs_btn"></label></li>
            </ul>
            <button type="button" class="play_btn"></button>
        </figure>
        <script>
            $(function(){
                $(".btn_box li .vs_btn").click(function(){
                    var par = $(this).parents("li").index();
                    $(".img_box li").removeClass("active");
                    $(".img_box li").eq(par).addClass("active");
                    $(".btn_box li").removeClass("active");
                    $(".btn_box li").eq(par).addClass("active");
                });
                var sw = 1;
                var int1 = setInterval(function(){
                    if(sw==1){
                        autoplay(1);
                        sw = 0;
                    } else {
                        autoplay(0);
                        sw = 1;
                    }
                }, 3500);

                function autoplay(n){
                    $(".img_box li").removeClass("active");
                    $(".img_box li").eq(n).addClass("active");
                    $(".btn_box li").removeClass("active");
                    $(".btn_box li").eq(n).addClass("active");
                }

                $(".play_btn").click(function(){
                    if($(this).hasClass("active")){
                        $(this).removeClass("active");
                        sw = 1;
                        int1 = setInterval(function(){
                            if(sw==1){
                                autoplay(1);
                                sw = 0;
                            } else {
                                autoplay(0);
                                sw = 1;
                            }
                        }, 3500);
                    } else {
                        $(this).addClass("active");
                        sw = 0;
                        clearInterval(int1);
                    }
                });
            });
        </script>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit"><span class="txtColor1">Grow</span> & <span class="txtColor2">Joy</span></h2>
                <ul class="board_lst">
                    <li class="item1">
                        <div class="board_tit">
                            <h3>공지사항</h3>
                            <a href="${headPath }/WEB-INF/views/board/notice/listNotice.jsp" class="btn_more">+</a>
                        </div>
                        <ul class="board_con">
<%--                            <%--%>
<%--                                if(noticeList.size() > 0){--%>
<%--                                    for(Board bd : noticeList) {--%>
<%--                                        String dateStr = bd.getResdate().substring(0, 10);--%>
<%--                                        String title = "";--%>
<%--                                        if(bd.getTitle().length() > 70) {--%>
<%--                                            title = bd.getTitle().substring(69) + "...";--%>
<%--                                        } else {--%>
<%--                                            title = bd.getTitle();--%>
<%--                                        }--%>

<%--                            %>--%>
<%--                            <li><a href="<%=headerPath %>/board/getNotice.jsp?bno=<%=bd.getBno() %>"><%=title %><span class="date"><%=dateStr %></span></a></li>--%>
<%--                            <% } } else { %>--%>
<%--                            <li class="no_date">--%>
<%--                                등록된 공지사항이 없습니다.--%>
<%--                            </li>--%>
<%--                            <% } %>--%>
                        </ul>
                    </li>
                    <li class="item2">
                        <div class="board_tit">
                            <h3>자유게시판</h3>
                            <a href="${headPath }/WEB-INF/views/board/forum/listBoard.jsp" class="btn_more">+</a>
                        </div>
                        <ul class="board_con">
<%--                            <%--%>
<%--                                if(boardList.size() > 0){--%>
<%--                                    for(Board bd : boardList) {--%>
<%--                                        String dateStr = bd.getResdate().substring(0, 10);--%>
<%--                                        String title = "";--%>
<%--                                        if(bd.getTitle().length() > 70) {--%>
<%--                                            title = bd.getTitle().substring(69) + "...";--%>
<%--                                        } else {--%>
<%--                                            title = bd.getTitle();--%>
<%--                                        }--%>

<%--                            %>--%>
<%--                            <li><a href="<%=headerPath %>/board/getBoard.jsp?bno=<%=bd.getBno() %>"><%=title %><span class="date"><%=dateStr %></span></a></li>--%>
<%--                            <% } } else { %>--%>
<%--                            <li class="no_date">--%>
<%--                                등록된 자유게시판이 없습니다.--%>
<%--                            </li>--%>
<%--                            <% } %>--%>
                        </ul>
                    </li>
                </ul>
            </div>
        </section>
        <section class="page" id="page2">
            <div class="page_wrap">
                <h2 class="page_tit">이벤트</h2>
                <p class="page_com">티스푼에서 진행된 이벤트를 소개합니다.</p>
                <div class="sl-btn-box">
                    <button type="button" class="btn next">&gt;</button>
                    <button type="button" class="btn prev">&lt;</button>
                </div>
                <div class="slide_box">
                    <ul class="card_lst">
<%--                        <%--%>
<%--                            if(eventList.size() > 0) {--%>
<%--                                int num = 1;--%>
<%--                                for(Event event: eventList){ %>--%>
<%--                        <li class="item<%=num %>">--%>
<%--                            <a href="<%=headerPath%>/event/eventing_get.jsp?eno=<%=event.getEno()%>">--%>
<%--                                <div class="thumb_box" style="background-image:url('<%=headerPath%>/event/event_img/<%=num %>.jpg')"></div>--%>
<%--                                <p class="thumb_tit"><%=event.getTitle() %></p>--%>
<%--                                <span class="thumb_date">--%>
<%--                                <% if(event.getStartdate()!=null && event.getEnddate()!=null){ %>--%>
<%--                                    <%=event.getStartdate()%>~<%=event.getEnddate()%>--%>
<%--                                <% } else { %>--%>
<%--                                    2023-08-01 ~ 2023-08-16--%>
<%--                                <% } %>--%>
<%--                                </span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <% num++; } } else { %>--%>
<%--                        <li class="no_date">등록된 이벤트가 없습니다.</li>--%>
<%--                        <% } %>--%>
                    </ul>
                </div>
            </div>
        </section>
        <script>
            $(function(){
                $(".sl-btn-box .btn.next").click(function(){
                    var ln = parseInt($(".card_lst").css("margin-left"));
                    if(ln>-1110) {
                        var mv = ln - 370;
                        $(".card_lst").not(":animated").animate({"margin-left":mv+"px"});
                    }
                });
                $(".sl-btn-box .btn.prev").click(function(){
                    var ln = parseInt($(".card_lst").css("margin-left"));
                    if(ln<0){
                        var mv = ln + 370;
                        $(".card_lst").not(":animated").animate({"margin-left":mv+"px"});
                    }
                });
            });
        </script>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="include/footer.jsp" %>
    </footer>
</div>
</body>
</html>
