<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="icon" href="resources/images/ht_favicon.png">
    <title>글작성</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="resources/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/plugins/ionicons/ionicons.min.css">
    <link rel="stylesheet" href="resources/plugins/animate-css/animate.css">
    <link rel="stylesheet" href="resources/plugins/slider/slider.css">
    <link rel="stylesheet" href="resources/plugins/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="resources/plugins/owl-carousel/owl.theme.css">
    <link rel="stylesheet" href="resources/plugins/facncybox/jquery.fancybox.css">
	<link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/style2.css">
    <link rel="stylesheet" href="resources/css/style3.css">
	<link rel="stylesheet" href="resources/css/style5.css">
	<link rel="stylesheet" href="resources/css/style7.css">
	
	
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style>
		.sidebar .widget {
		  margin-bottom: 40px;
		  padding: 15px;
		  border: 1px solid #dedede;
		}
		
		
		.pressure_input{
			box-shadow: none;
		}
				
	</style>

</head>

<body>
    <!--
        ==================================================
        Header Section Start
        ================================================== -->
    <header id="top-bar" class="navbar-fixed-top animated-header">
        <div class="container">
            <div class="navbar-header">
                <!-- responsive nav button -->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- /responsive nav button -->

                <!-- logo -->
                <div class="navbar-brand">
                    <a href="index">
                        <img src="resources/images/logo.png" alt="">
                    </a>
                </div>
                <!-- /logo -->
            </div>
            <!-- main menu -->
            <nav class="collapse navbar-collapse navbar-right" role="navigation">
                <div class="main-menu">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="index">Home</a>
                        </li>
                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">검사하기<span
                                    class="caret"></span></a>
                            <div class="dropdown-menu">
                                <ul>
                                    <li><a href="ecgCheck">심전도 검사</a></li>
                                    <li><a href="bpCheck">혈압 검사</a></li>
                                    <li><a href="bsCheck">혈당 검사</a></li>
                                </ul>
                            </div>
                        </li>
                        
                        
                        <li><a href="healthRecord">Pages건강기록</a></li>
                        <li><a href="community">Service커뮤니티</a></li>

                        <li>
						    <% if (session.getAttribute("user_id") != null) { %>
						        <a href="logout">로그아웃</a>
						    <% } else { %>
						        <a href="login">Contact로그인</a>
						    <% } %>
						</li>

                    </ul>
                </div>
            </nav>
            <!-- /main nav -->
        </div>
    </header>
 
 	 <section id="blog-full-width" style="background-color: #ededed; ">
	    
	    
	    <section id="feature">
	        <div class="container">
	            <div class="container_ECG_record">
	                <span class="subtitle">게시글 쓰기</span>
	
	 
	                <span>
	                    <a href="" class="button_ECG btnPush_ECG">등록하기</a>
	                </span>
	
	            </div>
	            <div>
	                <div class="Blood_pressure_input add_write_section">
	                    <form action="">
	                        <p class="subtitle-des_ef1 pressure_input" style="background-color: #fff;"><strong>내용 입력</strong></p>
	                        <textarea class="pressure_input text_ar" name="" id="" cols="30" rows="10"></textarea>
	                    </form>
	                </div>
	            </div>
	            <div class="container">
	                <div class="health_Card">
	                    <div class="card-container">
	                        <div class="card_fr">
	                            <div class="front">
	                                ECG
	                            </div>
	                        </div>
	                    </div>
	                    <div class="card-container">
	                        <div class="card_fr">
	                            <div class="front">
	                                <p class="subtitle-des">
	                                    <img src="resources/images/혈당아이콘.png" alt=""> 나의 공복혈당은 <span class="subtitle-des_ef">
	                                        80mg/dl
	                                    </span>이고, 식후혈당은 <span class="subtitle-des_ef"> 120mg/dl </span> 입니다.
	                                </p>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="card-container">
	                        <div class="card_fr">
	                            <div class="front">
	                                <p class="subtitle-des">
	                                    <img src="resources/images/혈압아이콘.png" alt=""> 나의 공복혈당은 <span class="subtitle-des_ef">
	                                        80mg/dl
	                                    </span>이고, 식후혈당은 <span class="subtitle-des_ef"> 120mg/dl </span> 입니다.
	                                </p>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="artboard">
	                        <div class="button_add">
	                            <div class="links">
	                                <span>
	                                    <div class="checks etrans">
	                                        <input type="radio" id="add_ECG" value="add_ECG" name="add_result">
	                                        <label for="add_ECG">ECG</label>
	                                    </div>
	                                    <div class="checks etrans">
	                                        <input type="radio" id="add_Pre" value="add_ECG" name="add_result">
	                                        <label for="add_Pre">혈압</label>
	                                    </div>
	                                    <div class="checks etrans">
	                                        <input type="radio" id="add_Sug" value="add_ECG" name="add_result">
	                                        <label for="add_Sug">혈당</label>
	                                    </div>
	                                </span>
	                                <div class="overlay"><a>나의 건강정보 공유하기</a></div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	    </section>
	  </section>






    <!--
            ==================================================
            Call To Action Section Start
            ================================================== -->
    <section id="call-to-action">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <h2 class="title wow fadeInDown" data-wow-delay=".3s" data-wow-duration="500ms">나를 위한  <strong> 만족도 조사</strong>
                            </h1>
                            <p class="wow fadeInDown" data-wow-delay=".5s" data-wow-duration="500ms">당신이 경험한 이야기를 우리에게
                                나누어 주세요.<br>우리는 당신의 이야기로 더욱 만족스러운 서비스를 제공 드릴 것을 약속드립니다</p>
                            <a href="https://forms.gle/JH1Ya6SnKUn6boTA6"
                                class="btn btn-default btn-contact wow fadeInDown" data-wow-delay=".7s"
                                data-wow-duration="500ms">참여하기</a>
                    </div>
                </div>

            </div>
        </div>
    </section>

    

    <!--
                    ==================================================
                    Footer Section Start
                    ================================================== -->
    <footer id="footer">
        <div class="container">
            <div class="col-md-8">
                <p class="copyright">Copyright &copy; <span>
                        <script>document.write(new Date().getFullYear())</script>
                    </span> HearTrack All Rights Reserved.
                </p>
                <p><a href="">개인정보 처리방침</a> | <a href="">이용약관</a></p>
            </div>
            <div class="col-md-4">
                <!-- Social Media -->
                <ul class="social">
                    <li>
                        <a href="http://wwww.fb.com/themefisher" class="Facebook">
                            <i class="ion-social-facebook"></i>
                        </a>
                    </li>
                    <li>
                        <a href="http://wwww.twitter.com/themefisher" class="Twitter">
                            <i class="ion-social-twitter"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="Linkedin">
                            <i class="ion-social-linkedin"></i>
                        </a>
                    </li>
                    <li>
                        <a href="http://wwww.fb.com/themefisher" class="Google Plus">
                            <i class="ion-social-googleplus"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </footer>

    <!-- Template Javascript Files
	================================================== -->
    <!-- jquery -->
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Form Validation -->
    <script src="resources/plugins/form-validation/jquery.form.js"></script>
    <script src="resources/plugins/form-validation/jquery.validate.min.js"></script>
    <!-- owl carouserl js -->
    <script src="resources/plugins/owl-carousel/owl.carousel.min.js"></script>
    <!-- bootstrap js -->
    <script src="resources/plugins/bootstrap/bootstrap.min.js"></script>
    <!-- wow js -->
    <script src="resources/plugins/wow-js/wow.min.js"></script>
    <!-- slider js -->
    <script src="resources/plugins/slider/slider.js"></script>
    <!-- Fancybox -->
    <script src="resources/plugins/facncybox/jquery.fancybox.js"></script>
    <!-- template main js -->
    <script src="resources/js/main.js"></script>

    <script src="resources/js/community.js"></script>

</body>

</html>