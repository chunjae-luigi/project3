<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="headPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼</title>
    <%@ include file="include/head.jsp" %>
    <link rel="stylesheet" href="${headPath}/resources/css/main.css">
    <style>

        /* 하단 고정 배너 */
        .footBnrFixed {
            position: fixed;
            z-index: 999;
            bottom: 0;
            left: 0;
            right: 0;
            width: 100%;
        }

        .footBnrFixed img {
            display: block;
            height : 100px;
            width: 80%;
            margin: 0 auto;
        }
/*
        .footBnrFixed a {
            position: absolute;
            bottom: 0;
            left: 50%;
            display: block;
            width: 500px;
            height: 84px;
            transform: translateX(-50%);
            -webkit-transform: translateX(-50%);
        }*/

    </style>
</head>
<body>
<%@ include file="include/header.jsp" %>

<div class="content">

    <!-- Slider Start -->
    <section class="slider">
        <div class="container">
            <div class="columns is-justify-content-center">
                <div class="column is-9-desktop is-10-tablet">
                    <div class="block has-text-centered">
                        <span class="is-block mb-4 text-white is-capitalized">Empower Learning Together with Tspoon</span>
                        <h1 class="mb-5">함께하는 학습,<br>티스푼과 함께하세요!</h1>
                        <p class="mb-6">자녀의 학습을 한 눈에 관리하고,<br>최신 교육 트렌드를 커뮤니티에서 이야기해보세요</p>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <%-- 미니 게시판 --%>


    <div class="page_wrap">
        <ul class="board_lst">
            <li class="item1">
                <div class="board_tit">
                    <h3>공지사항</h3>
                    <a href="${headPath }/notice/List.do" class="btn_more">+</a>
                </div>
                <ul class="board_con" style="list-style-type: none">
                    <c:forEach var="notice" items="${noticeList}">
                        <li><a href="${headPath }/notice/Get.do?no=${notice.no}">${notice.title}<span class="date">${notice.regdate}</span></a></li>
                    </c:forEach>
                    <c:if test="${empty noticeList}">
                        <li class="no_date">
                            등록된 공지사항이 없습니다.
                        </li>
                    </c:if>
                </ul>
            </li>

            <li class="item2">
                <div class="board_tit">
                    <h3>자유게시판</h3>
                    <a href="${headPath }/board/free/list.do" class="btn_more">+</a>
                </div>
                <ul class="board_con" style="list-style-type: none">
                    <c:forEach var="free" items="${freeList}">
                        <li><a href="${headPath }/free/detail.do?fno=${free.fno}">${free.title}<span class="date">${free.regdate}</span></a></li>
                    </c:forEach>
                    <c:if test="${empty freeList}">
                        <li class="no_date">
                            등록된 게시글이 없습니다.
                        </li>
                    </c:if>
                </ul>
            </li>
        </ul>
    </div>



    <!-- Section Intro END -->
    <section class="section video">
        <div class="container">
            <div class="columns is-desktop">
                <div class="column is-8-desktop">
                    <div class="video-content">
                        <h2 class="mt-4 mb-6 is-relative text-lg text-white">We Make a Difference <br>in their Life</h2>
                    </div>
                </div>
            </div>
            <div class="columns">
                <div class="column is-12">
                    <div class="video-block">
                        <div class="img-block">
                            <img src="images/bg/bg-3.jpg" alt="">
                        </div>
                        <a data-video-id="sXoKSD8QJEA" class="videoplay">
                            <i class="icofont-ui-play"></i>
                        </a>
                    </div>
                </div>
            </div>

            <div class="counter-section">
                <div class="columns is-multiline">
                    <div class="column is-3-desktop is-6-tablet">
                        <div class="counter-item-2 pt-5">
                            <span class="counter-stat  text-color">18</span>
                            <p>Years of Experience</p>
                        </div>
                    </div>
                    <div class="column is-3-desktop is-6-tablet">
                        <div class="counter-item-2 pt-5">
                            <span class="counter-stat has-text-weight-bold text-color">1,460</span>
                            <p>Active Volunteer</p>
                        </div>
                    </div>
                    <div class="column is-3-desktop is-6-tablet">
                        <div class="counter-item-2 pt-5">
                            <span class="counter-stat  text-color">92</span>
                            <p>Availble Country</p>
                        </div>
                    </div>
                    <div class="column is-3-desktop is-6-tablet">
                        <div class="counter-item-2 pt-5">
                            <span class="counter-stat text-color">54</span>
                            <p >Million People Helped</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section gallery">
        <div class="container">
            <div class="columns is-justify-content-center">
                <div class="column is-8-desktop is-10-tablet">
                    <div class="section-title has-text-centered">
                        <span class="text-color">Our Gallery</span>
                        <h2 class="mt-4 mb-5 is-relative content-title">We connect with people across different sectors. we take risksand we always keep learning.</h2>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="gallery-wrap">
                <div class="columns is-multiline">
                    <div class="column is-4-desktop is-12-tablet">
                        <div class="gallery-item">
                            <a href="images/gallery/1.jpg" class="gallery-popup">
                                <img src="images/gallery/1.jpg" alt="" class=" w-100">
                            </a>
                        </div>
                    </div>
                    <div class="column is-4-desktop is-12-tablet">
                        <div class="gallery-item">
                            <a href="images/gallery/2.jpg" class="gallery-popup">
                                <img src="images/gallery/2.jpg" alt="" class=" w-100">
                            </a>
                        </div>
                    </div>
                    <div class="column is-4-desktop is-12-tablet">
                        <div class="gallery-item">
                            <a href="images/gallery/3.jpg" class="gallery-popup">
                                <img src="images/gallery/3.jpg" alt="" class=" w-100">
                            </a>
                        </div>
                    </div>
                    <div class="column is-4-desktop is-12-tablet">
                        <div class="gallery-item">
                            <a href="images/gallery/4.jpg" class="gallery-popup">
                                <img src="images/gallery/4.jpg" alt="" class=" w-100">
                            </a>
                        </div>
                    </div>

                    <div class="column is-4-desktop is-12-tablet">
                        <div class="gallery-item">
                            <a href="images/gallery/5.jpg" class="gallery-popup">
                                <img src="images/gallery/5.jpg" alt="" class=" w-100">
                            </a>
                        </div>
                    </div>
                    <div class="column is-4-desktop is-12-tablet">
                        <div class="gallery-item">
                            <a href="images/gallery/6.jpg" class="gallery-popup">
                                <img src="images/gallery/6.jpg" alt="" class=" w-100">
                            </a>
                        </div>
                    </div>
                    <div class="column is-6-desktop is-12-tablet">
                        <div class="gallery-item">
                            <a href="images/gallery/9.jpg" class="gallery-popup">
                                <img src="images/gallery/9.jpg" alt="" class=" w-100">
                            </a>
                        </div>
                    </div>
                    <div class="column is-6-desktop is-12-tablet">
                        <div class="gallery-item">
                            <a href="images/gallery/8.jpg" class="gallery-popup">
                                <img src="images/gallery/8.jpg" alt="" class=" w-100">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section>
        <div class="container">
            <div class="column">
                <div class="column lg-12">
                    <div class="section-divider"></div>
                </div>
            </div>
        </div>
    </section>

    <!-- Section About Start -->
    <section class="section causes">
        <div class="container">
            <div class="columns is-justify-content-center">
                <div class="column is-7-desktop is-8-tablet">
                    <div class="section-title has-text-centered">
                        <span class="text-color">Latest Events</span>
                        <h2 class="mt-4 mb-5 is-relative content-title">Our Recent Causes <br> to serve better</h2>
                        <p class="mb-5">We provide services in the area of IFRS and management reporting, helping companies to reach their highest level.</p>
                    </div>
                </div>
            </div>

            <div class="columns is-multiline is-justify-content-center">
                <div class="column is-4-desktop is-6-tablet">
                    <div class="cause-item">
                        <img src="images/about/image-1.jpg" class=" w-100" alt="...">

                        <div class="card-body">
                            <h3 class="mb-4"><a href="cause-single.html">Save Poor Childrens</a></h3>

                            <ul class="list-inline border-bottom border-top py-3 mb-4">
                                <li class="list-inline-item"><i class="icofont-check text-color mr-2"></i>Goal:	<span>$890</span></li>
                                <li class="list-inline-item"><i class="icofont-check text-color mr-2"></i>Raised: <span>$390</span></li>
                            </ul>
                            <p class="card-text mb-5">Save poor child by supporting text below as a natural lead-in to additional content.</p>

                            <a href="donation.html" class="btn btn-main is-rounded">Donate Now</a>
                        </div>
                    </div>
                </div>

                <div class="column is-4-desktop is-6-tablet">
                    <div class="cause-item">
                        <img src="images/about/image-2.jpg" class=" w-100" alt="...">

                        <div class="card-body">
                            <h3 class="mb-4"><a href="cause-single.html">Clean Drink Water</a></h3>

                            <ul class="list-inline border-bottom border-top py-3 mb-4">
                                <li class="list-inline-item"><i class="icofont-check text-color mr-2"></i>Goal:	<span>$890</span></li>
                                <li class="list-inline-item"><i class="icofont-check text-color mr-2"></i>Raised: <span>$390</span></li>
                            </ul>
                            <p class="card-text mb-5">Save poor child by supporting text below as a natural lead-in to additional content.</p>

                            <a href="donation.html" class="btn btn-main is-rounded">Donate Now</a>
                        </div>
                    </div>
                </div>
                <div class="column is-4-desktop is-6-tablet">
                    <div class="cause-item">
                        <img src="images/about/image-3.jpg" class=" w-100" alt="...">

                        <div class="card-body">
                            <h3 class="mb-4"><a href="cause-single.html">Fund for Education</a></h3>

                            <p class="card-text mb-4">Save poor child by supporting text below as a natural lead-in to additional content. </p>
                            <p class="card-text mb-4">Quia vitae ab maxime cum quod neque .</p>

                            <a href="donation.html" class="btn btn-main is-rounded">Donate Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Section About End -->
    <div class="cta-block section">
        <div class="container">
            <div class="columns is-justify-content-center ">
                <div class="column is-7-desktop is-12-tablet">
                    <div class="cta-content has-text-centered">
                        <i class="icofont-diamond text-lg text-color"></i>
                        <h2 class="text-white text-lg mb-6 mt-4">We can’t help everyone, but everyone can help someone</h2>
                        <a href="donation.html" class="btn btn-main is-rounded">Make a donation</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section class="section latest-blog">
        <div class="container">
            <div class="columns is-justify-content-center is-desktop">
                <div class="column is-7-desktop has-text-centered">
                    <div class="section-title">
                        <span class="h6 text-color">Latest News</span>
                        <h2 class="mt-4 content-title">Latest articles to enrich knowledge</h2>
                    </div>
                </div>
            </div>

            <div class="columns is-multiline is-justify-content-center">
                <div class="column is-4-desktop is-6-tablet">
                    <div class="blog-item">
                        <img src="images/blog/blog_1.jpg" alt="" class="">

                        <div class="card-body mt-2">
                            <span class="text-sm text-color is-uppercase has-text-weight-bold">January 3, 2019</span>
                            <h3 class="mb-3"><a href="blog-single.html" class="">We can make a difference in families lives</a></h3>
                            <p class="mb-4">Aspernatur obcaecati unde, quasi nihil neque, voluptatem. Consectetur.</p>
                        </div>
                    </div>
                </div>

                <div class="column is-4-desktop is-6-tablet">
                    <div class="blog-item">
                        <img src="images/blog/blog_2.jpg" alt="" class="">

                        <div class="card-body mt-2">
                            <span class="text-sm text-color is-uppercase has-text-weight-bold">January 3, 2019</span>
                            <h3 class="mb-3"><a href="blog-single.html" class="">A place where start new life with peace</a></h3>
                            <p class="mb-4">Aspernatur obcaecati unde, quasi nihil neque, voluptatem. Consectetur.</p>
                        </div>
                    </div>
                </div>

                <div class="column is-4-desktop is-6-tablet">
                    <div class="blog-item">
                        <img src="images/blog/blog_3.jpg" alt="" class="">

                        <div class="card-body mt-2">
                            <span class="text-sm text-color is-uppercase has-text-weight-bold">January 3, 2019</span>
                            <h3 class="mb-3"><a href="blog-single.html" class="">Build school for poor childrens</a></h3>
                            <p class="mb-4">Aspernatur obcaecati unde, quasi nihil neque, voluptatem. Consectetur.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="volunteer section ">
        <div class="container">
            <div class="columns is-multiline">
                <div class="column is-7-desktop is-12-tablet">
                    <div class="volunteer-content">
                        <img src="images/bg/image-5.jpg" alt="" class="">
                        <h2 class="text-lg mb-5 mt-3">We can’t help everyone, but everyone can help someone</h2>
                        <p>Assumenda reiciendis delectus dolore incidunt molestias omnis quo quaerat voluptate, eligendi perspiciatis ipsa laudantium nesciunt officia, odit nemo quidem hic itaque. Fugiat.</p>

                        <h2 class="mt-6 mb-5">Trusted worldwide partner</h2>
                        <div class="clients-wrap">
                            <a href="#">
                                <img src="images/clients/client1.png" alt="" class="">
                            </a>
                            <a href="#">
                                <img src="images/clients/client2.png" alt="" class="">
                            </a>
                            <a href="#">
                                <img src="images/clients/client4.png" alt="" class="">
                            </a>
                            <a href="#">
                                <img src="images/clients/client5.png" alt="" class="">
                            </a>
                            <a href="#">
                                <img src="images/clients/client6.png" alt="" class="">
                            </a>
                        </div>
                    </div>
                </div>

                <div class="column is-5-desktop is-12-tablet">
                    <div class="volunteer-form-wrap">
                        <span class="text-white">Join With us</span>
                        <h2 class="mb-6 text-lg text-white">Become A Volunteer</h2>
                        <form action="#" class="volunteer-form">
                            <div class="mb-4">
                                <input type="text" class="input" placeholder="Full Name">
                            </div>
                            <div class="mb-4">
                                <input type="email" class="input" placeholder="Emaill Address">
                            </div>
                            <div class="mb-4">
                                <input type="text" class="input" placeholder="Phone Number">
                            </div>
                            <div class="mb-4">
                                <input type="text" class="input" placeholder="Adress ">
                            </div>
                            <div class="mb-4">
                                <input type="text" class="input" placeholder="Occupation">
                            </div>
                            <div class="mb-4">
                                <textarea name="#" id="#" cols="30" rows="6" class="input" placeholder="Your Message"></textarea>
                            </div>

                            <a href="#" class="btn btn-main is-rounded mt-5">Send Message</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


<%@ include file="include/footer.jsp" %>

    <div class="footBnrFixed" id="footBnrFixed">
        <img src="${headPath }/resources/image/main/banner1.png" alt="가족선물">
    </div>
</body>
</html>
