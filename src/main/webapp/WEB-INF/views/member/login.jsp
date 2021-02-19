<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>login</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/assets/css/slicknav.css">
    <link rel="stylesheet" href="/resources/assets/css/flaticon.css">
    <link rel="stylesheet" href="/resources/assets/css/animate.min.css">
    <link rel="stylesheet" href="/resources/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="/resources/assets/css/themify-icons.css">
    <link rel="stylesheet" href="/resources/assets/css/slick.css">
    <link rel="stylesheet" href="/resources/assets/css/nice-select.css">
    <link rel="stylesheet" href="/resources/assets/css/style.css">
</head>

<body>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="/resources/assets/img/logo/logo.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <header>
        <!--? Header Start -->
        <div class="header-area header-transparent">
            <div class="main-header header-sticky">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <!-- Main Logo -->
                        <div class="col-xl-2 col-lg-2 col-md-1">
                            <div class="logo">
                                <a href="index.html"><img src="/resources/assets/img/logo/DOKI.png" width="200" height="122.4" alt=""></a>
                            </div>
                        </div>
                        <div class="col-xl-10 col-lg-10 col-md-10">
                            <div class="menu-main d-flex align-items-center justify-content-end">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav> 
                                        <ul id="navigation">
                                            <li><a href="index.html">Home</a></li>
                                            <li><a href="about.html">커뮤니티</a></li>
                                            <li><a href="blog.html">Blog</a>
                                                <ul class="submenu">
                                                    <li><a href="blog.html">Blog</a></li>
                                                    <li><a href="blog_details.html">Blog Details</a></li>
                                                    <li><a href="elements.html">Element</a></li>
                                                </ul>
                                            </li>
                                            <c:if test="${not empty sessionScope.loginId }">
                                            <li><a href="/member/mypage">마이페이지</a>
                                            	<ul class="submenu">
                                                    <c:if test="${not empty sessionScope.kakao_id }">
                                            			<li><a href="/member/kakaoLogOut">로그아웃</a></li>
                                            		</c:if>
                                            		<c:if test="${not empty sessionScope.loginId }">
                                            			<li><a href="/member/logOut">로그아웃</a></li>
                                            		</c:if>
                                                    <li><a href="blog_details.html">Blog Details</a></li>
                                                    <li><a href="elements.html">Element</a></li>
                                                </ul>
                                            </li>
                                            </c:if>
                                            <c:if test="${not empty sessionScope.kakao_id }">
                                            <li><a href="/member/mypage">마이페이지</a>
                                            	<ul class="submenu">
                                                    <li><a href="/member/logOut">로그아웃</a></li>
                                                    <li><a href="blog_details.html">Blog Details</a></li>
                                                    <li><a href="elements.html">Element</a></li>
                                                </ul>
                                            </li>
                                            </c:if>
                                            <c:if test="${empty sessionScope.kakao_id && empty sessionScope.loginId }">
                                            	<li><a href="/member/login">로그인/회원가입</a></li>
                                            </c:if>
                                            <!--  
                                            <c:choose>
	                                            <c:when test="${empty sessionScope.kakao_id && empty sessionScope.loginId }">
	                                            	<li><a href="/member/login">로그인/회원가입</a></li>
	                                            </c:when>
	                                              
	                                            <c:when test="${empty sessionScope.loginId }">
	                                            	<li><a href="/member/login">로그인/회원가입</a></li>
	                                            </c:when>
	                                            
	                                        </c:choose>-->
                                            
                                        </ul>
                                    </nav>
                                </div>
                                <div class="header-right-btn f-right d-none d-lg-block ml-30">
                                    <a href="#" class="header-btn">01654.066.456</a>
                                </div>
                            </div>
                        </div>   
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
    <main> 
        <!-- Hero Area Start -->
        <div class="slider-area2 slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center pt-50">
                            <h2></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Area End -->
        <!-- About Details Start -->
        <div class="about-details section-padding30">
            <div class="container">
                <div class="row">
                    
                        <div class="about-details-cap mb-50">
                            <div class="row">
                        <div class="col-12">
                            <h2 class="contact-title">로그인</h2>
                        </div>
                        
                            <form class="form-contact contact_form" action="/member/login2" method="post">
                                <div class="row">
                                   
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <input class="form-control valid" name="member_id" id="id" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ID'" placeholder="ID">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <input class="form-control valid" name="member_pw" id="pw" type="password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'PassWord'" placeholder="PassWord">
                                        </div>
                                    </div>
                                   
                                    <div class="col-sm-6">
	                                    <div class="form-group">
	                                    	<button type="submit" class="genric-btn primary-border">Login</button>
	                               		</div>
                                    </div>
                                   </div>
                             </form>
                                    
                                    <!-- 카카오 로그인  -->
                                    <div class="col-12">
		                               	<div class="form-group">
			                               	<div id="kakao_id_login"><a href="https://kauth.kakao.com/oauth/authorize?client_id=2e62014ff97c19cd48b281cffbf358a6&redirect_uri=http://localhost:8888/oauth&response_type=code">
											<img width="223" src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png"/></a></div>
		                               	</div>
		                            </div>
                                </div>
                       		    <br>
                                <br>
                                <div class="row">
                                <div class="col-12">
                            		<h2 class="contact-title">회원가입</h2>
                       			</div>
                       			
	                       			<div class="col-sm-6">
		                                    <div class="form-group">
		                                    	<a href="/member/joinForm" class="genric-btn primary-border e-large">일반 회원가입</a>
		                               		</div>
	                                </div>
                                </div>
                         		
                    </div>
                  
                </div>
            </div>
        </div>
        <!-- About Details End -->
        
             
    </main>
    <footer>
        <!-- Footer Start-->
        <div class="footer-area footer-padding">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                       <div class="single-footer-caption mb-50">
                         <div class="single-footer-caption mb-30">
                              <!-- logo -->
                             <div class="footer-logo mb-25">
                                 <a href="index.html"><img src="/resources/assets/img/logo/DOKI.png" width="200" height="122.4" alt=""></a>
                             </div>
                             <div class="footer-tittle">
                                 <div class="footer-pera">
                                     <p>Lorem ipsum dolor sit amet, adipiscing elit, sed do eiusmod tempor elit. </p>
                                </div>
                             </div>
                             <!-- social -->
                             <div class="footer-social">
                                 <a href="https://www.facebook.com/sai4ull"><i class="fab fa-facebook-square"></i></a>
                                 <a href="#"><i class="fab fa-twitter-square"></i></a>
                                 <a href="#"><i class="fab fa-linkedin"></i></a>
                                 <a href="#"><i class="fab fa-pinterest-square"></i></a>
                             </div>
                         </div>
                       </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-4 col-sm-5">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Company</h4>
                                <ul>
                                    <li><a href="index.html">Home</a></li>
                                    <li><a href="about.html">About Us</a></li>
                                    <li><a href="single-blog.html">Services</a></li>
                                    <li><a href="#">Cases</a></li>
                                    <li><a href="contact.html">  Contact Us</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Services</h4>
                                <ul>
                                    <li><a href="#">Commercial Cleaning</a></li>
                                    <li><a href="#">Office Cleaning</a></li>
                                    <li><a href="#">Building Cleaning</a></li>
                                    <li><a href="#">Floor Cleaning</a></li>
                                    <li><a href="#">Apartment Cleaning</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Get in Touch</h4>
                                <ul>
                                 <li><a href="#">152-515-6565</a></li>
                                 <li><a href="#"> Demomail@gmail.com</a></li>
                                 <li><a href="#">New Orleans, USA</a></li>
                             </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer-bottom area -->
        <div class="footer-bottom-area">
            <div class="container">
                <div class="footer-border">
                     <div class="row d-flex align-items-center">
                         <div class="col-xl-12 ">
                             <div class="footer-copy-right text-center">
                                 <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                             </div>
                         </div>
                     </div>
                </div>
            </div>
        </div>
        <!-- Footer End-->
    </footer>
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>

    <!-- JS here -->
    
    <script src="/resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="/resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="/resources/assets/js/popper.min.js"></script>
    <script src="/resources/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="/resources/assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="/resources/assets/js/owl.carousel.min.js"></script>
    <script src="/resources/assets/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="/resources/assets/js/wow.min.js"></script>
    <script src="/resources/assets/js/animated.headline.js"></script>
    <script src="/resources/assets/js/jquery.magnific-popup.js"></script>

    <!-- Nice-select, sticky -->
    <script src="/resources/assets/js/jquery.nice-select.min.js"></script>
    <script src="/resources/assets/js/jquery.sticky.js"></script>
    
    <!-- contact js -->
    <script src="/resources/assets/js/contact.js"></script>
    <script src="/resources/assets/js/jquery.form.js"></script>
    <script src="/resources/assets/js/jquery.validate.min.js"></script>
    <script src="/resources/assets/js/mail-script.js"></script>
    <script src="/resources/assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="/resources/assets/js/plugins.js"></script>
    <script src="/resources/assets/js/main.js"></script>
        
    </body>
</html>