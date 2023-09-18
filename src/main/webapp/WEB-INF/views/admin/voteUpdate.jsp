<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>투표 목록</title>
    <jsp:include page="../include/head.jsp" />
    <style>
        #editSubmit {display:none;}
        .answer_area {background-color:#fff!important;border-radius:5px;}

        .vote_li.box {border:4px solid #fff;}
        .vote_li.box.check {border:4px solid #ff4057;}
    </style>
    <script type="text/javascript" src="${path }/resources/ckeditor/ckeditor.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp" />
<div class="column">
    <h1 class="is-size-3 has-text-weight-semibold">투표 관리 - 수정하기</h1>
    <form action="${path }/vote/edit.do" method="post" class="mt-5">
        <table class="table is-fullwidth is-bordered">
            <colgroup>
                <col style="width:20%;">
                <col style="width:auto;">
            </colgroup>
            <tbody>
            <tr>
                <th class="has-text-centered">제목</th>
                <td>
                    <input type="hidden" name="vno" id="vno" value="${vote.vno }" >
                    <input type="text" name="title" id="title" class="input" placeholder="제목 입력" value="${vote.title }" maxlength="98" required>
                </td>
            </tr>
            <tr>
                <th class="has-text-centered">내용</th>
                <td>
                    <textarea name="content" id="content" class="textarea" placeholder="내용 입력" rows="8" cols="100" maxlength="1400" required>${vote.content }</textarea>
                    <script>
                        CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path }/util/imageUpload.do'});
                    </script>
                </td>
            </tr>
            <tr>
                <th class="has-text-centered">시작일</th>
                <td>
                    <input type="date" name="startDate" id="startDate" class="input" value="${vote.startDate}" required>
                </td>
            </tr>
            <tr>
                <th class="has-text-centered">종료일</th>
                <td>
                    <input type="date" name="finishDate" id="finishDate" class="input" value="${vote.finishDate}" required>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="buttons is-right">
            <button type="submit" class="button is-mainColor">수정</button>
            <a href="${path }/admin/VoteMemberListAdmin.do" class="button is-success">목록</a>
        </div>
    </form>
</div>
</body>
</html>