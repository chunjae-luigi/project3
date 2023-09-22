<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<c:set var="headPath" value="${pageContext.request.contextPath }"/>
<style>
    #ft {
        border-top: 1px solid #333;
        box-sizing: border-box;
        padding-bottom: 42px;
    }
    .footer-wrap {
        min-width: 1140px;
        color: #000;
        font-size: 13px;
        font-weight: normal;
    }
    .footerV18 {
        position: relative;
        width: 1200px;
        margin: 42px auto 0;
        padding-left: 200px;
        text-align: left;
    }
    .footerV18 .logo {
        position: absolute;
        left: 0;
        top: 0;
        width: 200px;
        height: 60px;
        background: url(${headPath}/resources/image/common/logo_gray.png) 0 0 no-repeat;
        text-indent: -999em;
    }
    .footerV18 .company {
        width: 555px;
        margin: 0 40px;
        display: inline-block;
        font-size: 16px;
    }
    .footerV18 .company h2 {
        font-size: 24px !important;
    }
    .footerV18 .company p {
        font-size: 16px !important;
    }
    .footerV18 .cs {
        display: inline-block;
        width: 300px;
        padding-top: 47px;
    }
    .footerV18 .foot-sns {
        display: flex;
        align-items: center;
        position: absolute;
        top: 30px;
    }
    .footerV18 .foot-sns a {
        display: inline-block;
        width: 28px;
        height: 28px;
        margin-right: 12px;
    }
    .footerV18 .foot-side {
        display: inline-block;
    }

    .mainV18 a {
        color: inherit;
        text-decoration: none;
    }
    .foot-cscenter .tit {
        position: relative;
        padding-bottom: 8px;
        font-size: 12px;
        color: #000;
        font-weight: 700;
        line-height: normal;
    }
    .foot-cscenter .open-time {
        padding-bottom: 4px;
        font-size: 11px;
        color: #999;
        font-weight: 500;
        line-height: normal;
    }
    .foot-cscenter .open-time .time {
        padding-left: 4px;
        font-size: 11px;
        color: #000;
        font-weight: 500;
        opacity: 1;
    }
    .foot-cscenter .open-time.lunch {
        padding-bottom: 0;
    }

    .foot-cscenter a {
        display: inline-block;
        width: 284px;
        padding: 16px 0 16px 16px;
        background: #f7f7f7;
        border-radius: 8px;
        text-decoration: none;
    }

</style>
<footer id="ft">
<%--    <div class="ft_wrap2">--%>
<%--        <p class="copyright">--%>
<%--            <span><a href="${headPath }/WEB-INF/views/company/aboutEmail.jsp">이메일 무단 수집 거부</a></span>--%>
<%--            <span>티스푼</span>--%>
<%--            <span>서울시 금천구 가산로9길 54</span>--%>
<%--            <span>대표자 최상민</span>--%>
<%--            <span>사업자등록번호 XXX-XX-XXXXX</span>--%>
<%--            <span>통신판매신고번호 제XX-XXX호</span>--%>
<%--            <span class="end">부가통신사업신고 XXXXXX</span>--%>
<%--        </p>--%>
<%--        <p class="cp has-text-centered">COPYRIGHT 1981-2023 GROW&JOY INC. ALL RIGHTS RESERVED.</p>--%>
<%--    </div>--%>


    <div class="footer-wrap">
        <div class="footerV18">
            <span class="logo">티스푼</span>
            <div class="foot-cont company">
                <h2>티스푼</h2>
                <p>대표이사 : 최상민 / 서울시 금천구 가산로9길 54, 1004</p>
                <p>사업자등록번호 : 1004-00-8282 / 통신판매업 신고 : 제 10-1004호</p>
                <p>전화번호 : 1588-1004 / E-mail : tspoon@edu.co.kr</p>
                <p>개인정보보호책임자 : 황교진 / 소비자피해보상보험 SGI 서울보증</p>
                <p class="tPad15">호스팅서비스:㈜티스푼</p>
                <p class="copyright">COPYRIGHT © TSPOON ALL RIGHTS RESERVED.</p>
            </div>
            <div class="foot-side">
            <div class="foot-cont cs">
                <div class="foot-cscenter">
                    <a href="/cscenter/">
                        <p class="tit">고객센터</p>
                        <div class="open-time"><span>운영시간</span> <span class="time">오전 10시 ~ 오후 5시 (주말, 공휴일 휴무)</span></div>
                        <div class="open-time lunch"><span>점심시간</span> <span class="time">오후 11시 00분 ~ 오후 1시 00분</span></div>
                    </a>
                </div>
            </div>
            <div class="foot-sns">
                <a href="https://www.instagram.com/genia.academy/"><img src="http://fiximage.10x10.co.kr/web2021/cscenter/icon_sns_instagram.png" alt="insta"></a>
                <a href="#"><img src="http://fiximage.10x10.co.kr/web2021/cscenter/icon_sns_facebook.png" alt="facebook"></a>
                <a href="https://www.youtube.com/channel/UCgJ8iR8g3_7Cx-kqZZAcRrQ"><img src="http://fiximage.10x10.co.kr/web2021/cscenter/icon_sns_you.png" alt="yotube"></a>
            </div></div>

        </div>
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