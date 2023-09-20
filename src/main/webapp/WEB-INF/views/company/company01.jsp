<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼::인사말</title>
    <%@ include file="../include/head.jsp" %>
    <style>

        @font-face {
            font-family: 'HakgyoansimWoojuR';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimWoojuR.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }


        @font-face {
            font-family: 'SBAggroB';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }


        .page .intro .intro_tit { font-family: SBAggroB; font-size: 50px; display: block; width: 800px; margin: 50px auto; letter-spacing:-0.048em; }
        .page .intro .intro_con { font-family: HakgyoansimWoojuR; font-size: 20px; display: block; width: 800px; height: 300px; margin: 50px auto;  }
    </style>

</head>

<body>
<%@ include file="../include/header.jsp" %>

<div class="content">

    <section class="page-title bg-01">
        <div class="container">
            <div class="columns">
                <div class="column is-12">
                    <div class="block has-text-centered">
                        <h1 class="is-capitalize text-lg font-happy">인사말</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="section blog-wrap container">
        <section class="page" id="page1">
            <div class="intro">
                <h3 class="intro_tit"><img src="./image/sub/icon2.png" alt="별">Grow & Joy</h3>
                <p class="intro_con">교육브랜드 Grow & Joy는
                    학생의 성장을 돕고 즐거움과 기쁨을 선사합니다. <br><br>

                    성장 (Grow) : "그로우"는 성장과 발전을 의미합니다. 티스푼는 학생들이 더 나은 사람으로 성장하도록 돕고, 동시에 지속적인 발전과 성장을 추구합니다.<br><br>
                    즐거움 (Joy) : 교육 과정에서 즐거움과 기쁨을 경험하는 것 또한 중요합니다. 티스푼는 학생들이 학습을 통해 새로운 경험과 지식을 얻는 동시에 즐거움을 느끼는 것을 강조합니다.<br>
            </div>

        </section>
    </section>


</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
