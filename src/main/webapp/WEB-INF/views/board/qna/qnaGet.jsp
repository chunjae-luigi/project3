<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼</title>
    <%@ include file="../../include/head.jsp" %>
</head>

<body>
<%@ include file="../../include/header.jsp" %>

<div class="content">

    <section class="page-title bg-1">
        <div class="container">
            <div class="columns">
                <div class="column is-12">
                    <div class="block has-text-centered">
                        <h1 class="is-capitalize text-lg font-happy">Qna</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="section blog-wrap container">
        <table class="table" id="myTable">
            <thead>
            <tr>
                <th>유형</th>
                <th>글 제목</th>
                <th>작성자</th>
                <th>작성 일시</th>
                <th>조회수</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <c:if test="${qna.lev==0}">
                    <td>질문</td>
                </c:if>
                <c:if test="${qna.lev==1}">
                    <td>답변</td>
                </c:if>
                <td>${qna.title}</td>
                <td>${qna.author}</td>
                <td>${qna.regdate}</td>
                <td>${qna.visited}</td>
            </tr>
            <tr>
                <td colspan="5">${qna.content}</td>
            </tr>
            </tbody>
        </table>

        <div class="btn_group">
            <a href="${headPath }/board/qnaList.do" class="button button1">목록</a>
            <a href="${headPath }/board/qnaUpdate.do?qno=${qna.qno}" class="button button2">수정</a>
            <a href="${headPath }/board/qnaDelete.do?qno=${qna.qno}" class="button button1">삭제</a>
            <c:if test="${qna.lev == 0}">
                <a href="${headPath}/board/qnaInsert.do?lev=1&par=${qna.qno}" class="button is-primary">답변하기</a>
            </c:if>
        </div>
    </section>

</div>

<%@ include file="../../include/footer.jsp" %>
</body>
</html>

<script>
    $(document).ready(function(){
        if($("tbody tr").length==0){
            $("tbody").append("<tr><td colspan='5' class='text-center'>해당 목록이 존재하지 않습니다.</td></tr>")
        }
    })
</script>