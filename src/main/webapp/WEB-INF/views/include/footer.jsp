<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<c:set var="headPath" value="${pageContext.request.contextPath }"/>

<footer id="ft">
    <div class="ft_wrap2">
        <p class="copyright">
            <span><a href="${headPath }/WEB-INF/views/company/aboutEmail.jsp">이메일 무단 수집 거부</a></span>
            <span>티스푼</span>
            <span>서울시 금천구 가산로9길 54</span>
            <span>대표자 최상민</span>
            <span>사업자등록번호 XXX-XX-XXXXX</span>
            <span>통신판매신고번호 제XX-XXX호</span>
            <span class="end">부가통신사업신고 XXXXXX</span>
        </p>
        <p class="cp has-text-centered">COPYRIGHT 1981-2023 GROW&JOY INC. ALL RIGHTS RESERVED.</p>
    </div>
</footer>

<script>
    function loc(){
        var url = document.getElementById("sel").value;
        //location.href = url;  //현재 창에
        if(url!="") {
            var win = window.open(url); //새창에
        }
    }
</script>