<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼</title>
    <%@ include file="include/head.jsp" %>
</head>
<body>
<%@ include file="include/header.jsp" %>

<div class="content">

    <section class="page-title bg-1">
        <div class="container">
            <div class="columns">
                <div class="column is-12">
                    <div class="block has-text-centered">
                        <h1 class="is-capitalize text-lg font-happy">페이지 이름</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="section blog-wrap container">
        <div class="container is-fluid">
            <c:forEach var="news" items="${newsList}">
                <div class="card" style="width: 30%; height: 580px; overflow: hidden; margin: 15px; display: inline-block;">
                    <div class="card-image">
                        <figure class="image is-4by3">
                            <img src="${news.img}">
                        </figure>
                    </div>
                    <div class="card-content">
                        <div class="media">
                            <p class="title is-4">${news.title}</p>
                        </div>

                        <div class="content">
                                ${news.content}
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>


</div>

<%@ include file="include/footer.jsp" %>
</body>
</html>
