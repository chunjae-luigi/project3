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
            <tr>
                <td colspan="3" id="content">
                    ${dto.content}
                </td>
                <script>
                    CKEDITOR.replace('contents', {filebrowserUploadUrl: '${headPath}/dataFile/upload.do'});
                </script>
            </tr>
            <tr>
                <th class="item2" colspan="3">학습자료(클릭하여 다운로드)</th>
            </tr>
            <tr>
                <td colspan="3">
<%--                    <c:if test="${!empty dto.filename1 }">--%>
<%--                        <a href="${rootPath }/storage/${dto.filename1 }" download ><i class="fas fa-file" style="color: #54c066;"></i> ${dto.filename1 }</a>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${!empty dto.filename2 }">--%>
<%--                        <a href="${rootPath }/storage/${dto.filename2 }" download ><i class="fas fa-file" style="color: #54c066;"></i> ${dto.filename2 }</a>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${!empty dto.filename3 }">--%>
<%--                        <a href="${rootPath }/storage/${dto.filename3 }" download ><i class="fas fa-file" style="color: #54c066;"></i> ${dto.filename3 }</a>--%>
<%--                    </c:if>--%>
                </td>
            </tr>
            </tbody>
        </table>

    </section>


</div>

<%@ include file="../../include/footer.jsp" %>
</body>
</html>