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

    <div class="content" id="contents">
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
        <form action="${headPath }/notice/Insert.do" method="post">
                <table id="table1">
                    <tbody>
                    <tr>
                        <th style="background-color:#dcdcdc">글 제목</th>
                        <td>
                            <input type="text" name="title" id="title" placeholder="제목 입력" maxlength="98" required>
                        </td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">글 내용</th>
                        <td>
                            <textarea name="content" id="content" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" class="submit success button" value="글 등록" >
                            <a class="button" href="${headPath }/notice/List.do">글 목록</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
<jsp:include page="../../include/footer.jsp" />
</div>
</body>

</html>
