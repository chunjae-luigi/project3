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

</head>
<body>
<%@ include file="include/header.jsp" %>

<div class="content" id="content">

    <!-- Slider Start -->
    <section class="slider">
        <div class="container">
            <div class="columns is-justify-content-center">
                <div class="column is-9-desktop is-10-tablet">
                    <div class="block has-text-centered">
                        <span class="is-block mb-4 text-white is-capitalized">배너를 넣어보자</span>
                        <h1 class="mb-5">New hope for <br>near future</h1>
                        <p class="mb-6">Your small contribution means a lot. Natus officia amet <br>accusamus repellat magni reprehenderit dolorem.</p>
                        <a href="#" target="_blank" class="btn btn-main is-rounded">Donate Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Section Intro Start -->
    <section class="section intro">
        <div class="container">
            <div class="columns is-align-items-center is-desktop mb-6">
                <div class="column is-6-desktop">
                    <div class="section-title mb-0">
                        <span class="text-color">What we can do</span>
                        <h2 class="mt-4 content-title">We Believe that We can <br>Save More Lifes with you</h2>
                    </div>
                </div>
                <div class="column is-6-desktop">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt, dicta, iure. Esse quasi labore aperiam, dolorem amet voluptas soluta asperiores nostrum voluptate molestias numquam similique. Voluptate natus corporis ex, distinctio.</p>
                </div>
            </div>
            <div class="columns is-multiline is-justify-content-center">
                <div class="column is-3-desktop is-6-tablet">
                    <div class="intro-item mb-5 mb-lg-0">
                        <img src="images/about/image-1.jpg" alt="" class=" w-100">
                        <h4 class="mt-4 mb-3">Get inspired</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit, ducimus.</p>
                    </div>
                </div>
                <div class="column is-3-desktop is-6-tablet">
                    <div class="intro-item mb-5 mb-lg-0">
                        <img src="images/about/image-2.jpg" alt="" class=" w-100">
                        <h4 class="mt-4 mb-3">Give Donation</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit, ducimus.</p>
                    </div>
                </div>
                <div class="column is-3-desktop is-6-tablet">
                    <div class="intro-item">
                        <img src="images/about/image-3.jpg" alt="" class=" w-100">
                        <h4 class="mt-4 mb-3">Become a Volunteer</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit, ducimus.</p>
                    </div>
                </div>
                <div class="column is-3-desktop is-6-tablet">
                    <div class="intro-item">
                        <img src="images/about/image-1.jpg" alt="" class=" w-100">
                        <h4 class="mt-4 mb-3">Help The children</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit, ducimus.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
<footer id="ft" name="ft">
<%@ include file="include/footer.jsp" %>

    /* banner */
    <div class="footBnrFixed" id="footBnrFixed">
        <img src="${headPath }/resources/image/main/banner1.png" alt="수목원 가족여행">
        <a href="${headPath }/event1"></a>
        </div>
    <div>
        <button type="button" class="closebanner" onclick="closebanner()">
            <img src="${headPath }/resources/image/main/x.png" alt="닫기">
        </button>
    </div>

    /* quickMenu */
    <div class="quickMenu">
            <div class="quick_title">
                Quick
                <br>
                Menu
            </div>
            <div class="quick_btn">
                <ul>
                    <li>
                        <a href="${headPath }/notice/List.do">
                            <img src="${headPath }/resources/image/main/icon1.png" alt="아이콘1">
                            <br>
                            "공지사항"
                        </a>
                    </li>
                    <li>
                        <a href="${headPath }/vote/list.do">
                        <img src="${headPath }/resources/image/main/icon1.png" alt="아이콘1">
                        <br>
                        "출석체크"</a>
                    </li>
                    <li>
                        <a href="${headPath }/vote/list.do">
                        <img src="${headPath }/resources/image/main/icon1.png" alt="아이콘1">
                        <br>
                        "투표하기"</a>
                    </li>
                </ul>
            </div>
            <div class="quick_top">
                <a href="#">TOP</a>
            </div>
    </div>

    /* uiPopup */
    <div class="uiPopup">
        <div class="ui_body">
            <div>
                <a href="${headPath}/event2">
                    <img src="${headPath }/resources/image/main/popup1.png" alt="6모의고사">
                </a>
            </div>
        </div>
        <div class="ui_top">
            <div class="ui-day">
                <input type="checkbox" name="chk" id="chk" />
                <label for="chk">오늘 하루 열지않기</label>
                <button type="button" class="closebtn" onclick="closePopup();">
                    <img src="${headPath }/resources/image/main/x.png" alt="닫기">
                </button>
            </div>
        </div>
    </div>
    <script>
        function closePopup(){
            $(".uiPopup").hide();
        }
        function closebanner(){
            $(".footBnrFixed").hide();
        }
    </script>
<style>
        /* banner */
        .footBnrFixed {
            position: fixed;
            z-index: 999;
            bottom: 0;
            left: 0;
            right: 50%;
            width: 100%;
        }
        .footBnrFixed img {
            display: block;
            height : 80px;
            width: auto;
            margin: 0 auto;
        }
        .footBnrFixed a {
            position: absolute;
            bottom: 0;
            left: 50%;
            display: block;
            width: 500px;
            height: 84px;
            transform: translateX(-50%);
            -webkit-transform: translateX(-50%);
        }
        .footBnrFixed button {
            width: 10px;
            height: 10px;
            top: 1px;
            right: 1px;
        }

    /* quickMenu */

    .quickMenu {
        position: fixed;
        top: 15%;
        right: 2%;
        width: 90px;
        height: auto;
        text-align: center;
    }
    .quick_title {
        background-color: #f3bf00;
        color: white;
        font-weight: bold;
        border-radius: 9px 9px 0 0;
    }
    .quickMenu li {
        paddin-top: 5px;
        padding-bottom: 10px;
        height: 80px;
        font-size: 15px;
        text-align: center;

    }
    .quick_btn {
        background-color: white;
        border-top: #8a8a8a solid 0.1px;
    }
    .quick_btn a {
        height: 100%;
        margin: 0;
        padding: 0;
    }
    .quick_btn li:hover {
        background-color: #8a8a8a;
    }
    .quick_top {
        border-radius: 0 0 50% 50%;
        border-bottom: none;
        width: 100%;
        padding: 0;
        list-style: none;
        background-color: black;
        color: white;
        font-weight: bold;
    }




     /* uiPopup */
    .uiPopup {
        width: 400px;
        height: 300px;
        position: fixed;
        top: 30%;
        left: 20%;
        background-color: #fff;
        transform: translate(-50%, -50%);
        z-index: 10;
    }
    .ui_top {
        display: block;
        float: right;
    }

</style>


</footer>
</body>
</html>
