<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="headPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>공지사항 상세보기</title>
    <jsp:include page=".././include/head.jsp" />
</head>

<body>
<jsp:include page="../include/header.jsp" />
<div style="display: flex; min-height: 80vh;">
    <jsp:include page="./adminBoardList.jsp" />
    <div class="container" style="margin-top: 20px;">
        <h2 class="title">공지사항 수정</h2>
        <div class="container">
                <form action="${headPath}/admin/Update.do" method="post" >
                    <table class="table" id="myTable">
                        <tbody>
                        <tr>
                            <th style="background-color:#dcdcdc">글 제목</th>
                            <td>
                                <input type="hidden" name="no" id="no" placeholder="제목 입력" maxlength="98" value="${notice.no }">
                                <input type="text" name="title" id="title" placeholder="제목 입력" maxlength="98" value="${notice.title }" required>
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">글 내용</th>
                            <td>
                                <textarea name="content" id="content" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required>${notice.content }</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" class="submit success button" value="글 등록" >
                                <a class="button" href="${headPath }/admin/List.do">글 목록</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
        </div>
    </div>
</div>
            <jsp:include page=".././include/footer.jsp" />
        </body>

    </html>
