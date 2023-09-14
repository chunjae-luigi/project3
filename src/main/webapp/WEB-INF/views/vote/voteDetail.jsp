<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼::투표</title>
    <jsp:include page="../include/head.jsp" />
    <link rel="stylesheet" href="${path }/css/sub.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <jsp:include page="../include/header.jsp" />
    </header>
    <div class="container is-fullhd">
        <nav class="breadcrumb is-right" aria-label="breadcrumbs">
            <ul>
                <li><a href="/">HOME</a></li>
                <li class="is-active"><a href="${path }/vote/voteList.jsp" aria-current="page">투표 상세보기</a></li>
            </ul>
        </nav>
        <section>
            <h2>투표 상세보기</h2>
            <div>
                <p class="is-large">투표상세내용</p>
                <p class="is-large">${vote.title}</p>
                <p>조회수 : ${vote.visited}</p>
                <p>시작일 : ${vote.startDate}</p>
                <p>종료일 : ${vote.finishDate}</p>
                <p>상태 : ${vote.useYn}</p>
                <p>총 투표수 : ${cnt}</p>
            </div>
            <hr>
            <div>
                <input type="hidden" value="${vote.vno }" id="vno">
                <input type="hidden" value="${sid }" id="loginId">
                <input type="hidden" value="${path }" id="pathStr">
                <p>투표 선택지내역</p>
                <ul>
                    <c:forEach var="answer" items="${voteList }" varStatus="status">
                        <li>
                            <input type="radio" id="vote${status.count }" name="vote" value="${answer.lno }">
                            <label for="vote${status.count }">${answer.title }</label>
                        </li>
                    </c:forEach>
                </ul>
                <button type="button" class="voteBtn">투표하기</button>
                <script>
                    $(function(){
                        $(".voteBtn").on('click', function(){

                            var loginId = $("#loginId").val();
                            var pathStr = $("#pathStr").val();
                            if(loginId == ""){
                                alert("로그인을 부탁드립니다.");
                                location.href = pathStr + "/member/login.do";
                                return false;
                            }

                            var selCnt = $("input[name=vote]:checked").length;
                            if(selCnt < 1){
                                alert("보기를 선택 후 투표해주세요.");
                                return;
                            }

                            var vno = $("#vno").val();
                            if(confirm("투표 하시겠습니까?")){
                                var vno = vno;
                                var lno = $("input[name=vote]:checked").val();
                                var param = {
                                    vno: vno,
                                    lno: lno
                                };
                                $.ajax({
                                    url: pathStr + '/contents/bod/insertvote.mnt',
                                    type: 'POST',
                                    data:param,
                                    dataType: 'json',
                                    success:function(result) {
                                        alert(result.msg);
                                    },error: function (result) {
                                        console.log(result.responseText);
                                    }
                                });
                            }
                        });
                    });

                </script>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <jsp:include page="../include/footer.jsp" />
    </footer>
</div>
</body>
</html>
