<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼::공지사항-상세보기</title>
    <%@ include file="../head.jsp" %>
    <link rel="stylesheet" href="${headPath }/css/sub.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div  class="contents" id="contents">
        <div class="sub">
            <h2>공지사항</h2>
        </div>
        <div class="breadcrumb">
            <p><a href="/"> HOME </a> &gt; <a href="<%=headerPath%>/board/listNotice.jsp"> 커뮤니티 </a> &gt; <span> 공지사항 </span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">공지사항 상세보기</h2>
                <div class="board_detail">
                    <div class="board_detail_top">
                        <div class="detail_top1">
                            <h5 class="board_title">[공지 제목]&emsp;<%=bd.getTitle() %></h5>
                            <p class="cnt">[조회수] <%=bd.getCnt() %></p>
                        </div>
                        <div>
                            <p class="writer"><%=bd.getName() %></p>
                            <p class="date"><%=bd.getResdate() %></p>
                        </div>
                    </div>
                    <div class="board_detail_con">
                        <%=bd.getContent() %>
                    </div>
                </div>
                <div class="btn_group">
                <% if(sid != null && sid.equals("admin")) { %>
                    <a href="<%=headerPath%>/board/modifyNotice.jsp?bno=<%=bno %>" class="inBtn inBtn1">공지 수정</a>
                    <a href="<%=headerPath%>/board/removeBoardPro.jsp?bno=<%=bno %>&author=<%=bd.getAuthor() %>&type=1" class="inBtn inBtn2">공지 삭제</a>
                <% } %>
                    <a href="<%=headerPath%>/board/listNotice.jsp" class="inBtn inBtn1">공지 목록</a>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>
