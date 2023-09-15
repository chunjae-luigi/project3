<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
                        <h1 class="is-capitalize text-lg font-happy">학습 자료실</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="section blog-wrap container">
        <table class="table">
            <thead>
            <tr>
                <th class="item2">제목</th>
                <th class="item3">작성일</th>
                <th class="item4">조회수</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="item2">${dto.title}</td>
                <td class="item3">${dto.regdate}</td>
                <td class="item4">${dto.visited}</td>
            </tr>
            <c:if test="${!empty dataFiles}">
            <tr>
                <td>학습자료</td>
                <td colspan="2">
                    <c:forEach var="file" items="${dataFiles}">
                        <a href="${file.saveFolder}/${file.fileName}" download>${file.fileName}</a>
                    </c:forEach>
                </td>
            </tr>
            </c:if>
            <tr>
                <td colspan="3" id="content">
                    ${dto.content}
                </td>
            </tr>
            </tbody>
        </table>
        <a href="${headPath }/board/dataBoardList.do" class="button is-primary">글 목록</a>
    </section>


</div>

<%@ include file="../../include/footer.jsp" %>
</body>
</html>