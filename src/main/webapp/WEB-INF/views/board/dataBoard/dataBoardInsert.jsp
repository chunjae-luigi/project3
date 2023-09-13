<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼</title>
    <%@ include file="../../include/head.jsp" %>
    <script type="text/javascript" src="${headPath }/resources/ckeditor/ckeditor.js"></script>
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
        <form action="${headPath }/board/dataBoard/insert.do" method="post">
            <table class="table">
                <tbody>
                <tr>
                    <th><label for="title">제목</label></th>
                    <td><input type="text" class="input" name="title" id="title" placeholder="제목 입력"></td>
                </tr>
                <tr>
                    <th><label for="contents">내용</label></th>
                    <td>
                        <textarea name="contents" id="contents" class="textarea" placeholder="내용 입력" maxlength="1500"></textarea>
                        <script>
                            CKEDITOR.replace('contents', {filebrowserUploadUrl: '${headPath}/dataFile/upload.do'});
                        </script>
                    </td>
                </tr>
                </tbody>
            </table>
            <input class="button is-info" type="submit" value="작성하기">
            <a href="${headPath }/board/dataBoard/list.do" class="button is-primary">글 목록</a>
        </form>

    </section>
</div>

<%@ include file="../../include/footer.jsp" %>
</body>
</html>