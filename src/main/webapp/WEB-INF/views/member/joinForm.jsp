<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>JoinForm</title>
    <script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script> <!-- jQuery -->
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
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
    
    <script type="text/javascript">
       function formCheck(){
         var id = document.getElementById("member_id");
         var pw = document.getElementById("member_pw");
         var pw2 = document.getElementById("member_pw2");
         var name = document.getElementById("member_name");
         
   
         if(id.value.length<3 || id.value.length>10 ){
            alert("아이디는 3글자에서 10글자 사이로 입력");
            return false;
            }
         if(pw.value == ""){
            alert("비밀번호를 입력해주세요");
            return false;
            }
         if(pw.value != pw2.value){
            alert("비밀번호를 정확하게 입력")
            return false;
            }
         if(name.value == ""){
            alert("이름을 입력해주세요");
            return false;
            }
   

      
         return true;
      }

   	 // 아이디 중복체크
      // function idCheck() {
   		//$.ajax({
   		//	url:"/member2/idCheck",
   		//	data:{
   		//		member_id: $("#member_id").val()
   					//컨트롤러의 매개변수랑 이름이 같아야함
   		//		},
   		//	success: function(data){
  			 //data는 컨트롤러에서 전송한 result
   		//		$("#idChecked").text(data);
   		//		},
   		//	error: function(e){
   		//		alert("통신실패");
   		//		console.log(e);
   		//		} 
   		//	});		

   		
   	}
    </script>
    
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
                
                <div class="section-top-border">
					<div class="row">
						<div class="col-lg-8 col-md-8">
							<h3 class="mb-30">회원가입</h3>
							<form action="/member/join" enctype="multipart/form-data" onsubmit="return formCheck();" method="post">
								<div class="mt-10">
									<c:if test="${empty sessionScope.kakao_name }">
									<input type="text" name="member_name" id="member_name" placeholder="Name"
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'" required
										class="single-input">
									</c:if>
									<c:if test="${not empty sessionScope.kakao_name }">
									<input type="text" name="member_name" id="member_name" placeholder="Name"
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'" required
										class="single-input" value="${sessionScope.kakao_name }" readonly="readonly">
									</c:if>
								</div>
								<!-- 카카오 회원가입까지 구현 후 수정하기_ 카카오 아이디 들어있으면 아이디 value로 넣기 -->
								<div class="mt-10">
									<c:if test="${empty sessionScope.kakao_id }">
									<input type="text" name="member_id" id="member_id" placeholder="ID"
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'ID'" required
										class="single-input">
									</c:if>
									<c:if test="${not empty sessionScope.kakao_id }">
									<input type="text" name="member_id" id="member_id" placeholder="ID"
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'ID'" required
										class="single-input" value="${sessionScope.kakao_id }" readonly="readonly">
									</c:if>	
									<!-- 회원가입 하고 중복체크 test하기 -->	
									<!-- <span><button type="button" class="genric-btn danger circle" onclick="idCheck();">아이디 중복체크</button></span> -->
									<!-- <span><h1 id="idChecked" ></h1></span> -->
									
								</div>
								<div class="mt-10">
									<input type="password" name="member_pw" id="member_pw" placeholder="PassWord"
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'PassWord'" required
										class="single-input">
								</div>
								<div class="mt-10">
									<input type="password" id="member_pw2" placeholder="PassWordCheck"
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'PassWordCheck'" required
										class="single-input">
								</div>
								<div class="mt-10">
									<input type="email" name="member_email" id="member_email" placeholder="Email address"
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email address'" required
										class="single-input">
								</div>
								<div class="mt-10">
									
								</div>
								<!-- 이미지 첨부 -->
								<div class="mt-10">
									<label for="image">image Upload</label>
						                 <input type="file" name="upload" id="gdsImg">
						                 
						                 <div class = "select_img"><img src=""></div>   <!-- 업로드할 이미지 미리보기 -->
						         
						            	 <script>   
						                 $("#gdsImg").change(function(){
						                  if(this.files && this.files[0]) {
						                   var reader = new FileReader;
						                   reader.onload = function(data) {
						                    $(".select_img img").attr("src", data.target.result).width(300);        
						                   }
						                   reader.readAsDataURL(this.files[0]);
						                  }
						                 });
						             	</script> 
								</div>
								<br>
								<button class="genric-btn primary-border" type="submit">회원가입하기</button>
								
							</form>
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