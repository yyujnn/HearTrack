<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js">

<head>
    <!-- Basic Page Needs
        ================================================== -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="icon" href="resources/images/ht_favicon.png">
    <title>심전도 검사</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <!-- Mobile Specific Metas
        ================================================== -->
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- Template CSS Files
        ================================================== -->
    <!-- Twitter Bootstrs CSS -->
    <link rel="stylesheet" href="resources/plugins/bootstrap/bootstrap.min.css">
    <!-- Ionicons Fonts Css -->
    <link rel="stylesheet" href="resources/plugins/ionicons/ionicons.min.css">
    <!-- animate css -->
    <link rel="stylesheet" href="resources/plugins/animate-css/animate.css">
    <!-- Hero area slider css-->
    <link rel="stylesheet" href="resources/plugins/slider/slider.css">
    <!-- owl craousel css -->
    <link rel="stylesheet" href="resources/plugins/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="resources/plugins/owl-carousel/owl.theme.css">
    <!-- Fancybox -->
    <link rel="stylesheet" href="resources/plugins/facncybox/jquery.fancybox.css">
    <!-- template main css file -->
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/style2.css">
    <link rel="stylesheet" href="resources/css/style6.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    	let cpath = '${cpath}'
    </script>
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



    <section class="portfolio-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="portfolio-content" style="text-align: center;">
                        <h1 style="text-align: left; font-weight: bold;">심전도 검사</h1>
                        <!-- <div class="test_card" style="display: inline-block; width: 50%; border-radius: 8px;">
                            <div class="test_list">
                                <div class="test_btn_group" style="display: flex; flex-direction: column; ">

                                     <img src="https://cdn.pixabay.com/photo/2021/11/05/11/24/heart-6771075_1280.png" style="border-radius: 8px;" alt=""> 
                                     <video muted autoplay loop>
                                        <source src="resources/images/ecgtest.mp4" type="video/mp4">
                                    </video>  
                                </div>
                            </div>
                        </div> -->

                        <!-- multistep form -->
                        <div id="msform">
                            <!-- progressbar -->
                            <ul id="progressbar">
                                <li class="active">ECG 파일 첨부</li>
                                <li>검사 결과 확인</li>
                                <li>건강 기록</li>
                            </ul>
                            <!-- fieldsets -->
                        </div>

                        <div class="card_input">
						  <div class="ECG-body">
						    <h2 class="ECG-title"><img src="resources/images/checkmark.png" alt=""> 심전도(ECG) 파일 첨부하기 </h2>
						    <p class="subtitle-des">파일 첨부 가능한 유형(.pkl)</p>
						    <br><br><br>
						    <div id="uploadArea">
						      <form id="uploadForm" method="POST" enctype="multipart/form-data">
						        <label for="fileLabel" class="upload-area">
						          <span class="upload-area-icon">
						            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="340.531" height="419.116" viewBox="0 0 340.531 419.116">
						              <g id="files-new" clip-path="url(#clip-files-new)">
						                <path id="Union_2" data-name="Union 2" d="M-2904.708-8.885A39.292,39.292,0,0,1-2944-48.177V-388.708A39.292,39.292,0,0,1-2904.708-428h209.558a13.1,13.1,0,0,1,9.3,3.8l78.584,78.584a13.1,13.1,0,0,1,3.8,9.3V-48.177a39.292,39.292,0,0,1-39.292,39.292Zm-13.1-379.823V-48.177a13.1,13.1,0,0,0,13.1,13.1h261.947a13.1,13.1,0,0,0,13.1-13.1V-323.221h-52.39a26.2,26.2,0,0,1-26.194-26.195v-52.39h-196.46A13.1,13.1,0,0,0-2917.805-388.708Zm146.5,241.621a14.269,14.269,0,0,1-7.883-12.758v-19.113h-68.841c-7.869,0-7.87-47.619,0-47.619h68.842v-18.8a14.271,14.271,0,0,1,7.882-12.758,14.239,14.239,0,0,1,14.925,1.354l57.019,42.764c.242.185.328.485.555.671a13.9,13.9,0,0,1,2.751,3.292,14.57,14.57,0,0,1,.984,1.454,14.114,14.114,0,0,1,1.411,5.987,14.006,14.006,0,0,1-1.411,5.973,14.653,14.653,0,0,1-.984,1.468,13.9,13.9,0,0,1-2.751,3.293c-.228.2-.313.485-.555.671l-57.019,42.764a14.26,14.26,0,0,1-8.558,2.847A14.326,14.326,0,0,1-2771.3-147.087Z" transform="translate(2944 428)" fill="var(--c-action-primary)" />
						              </g>
						            </svg>
						          </span>
						          <span id="fileName" class="upload-area-title">드래그해서 파일을 올려주세요</span>
						          <span class="upload-area-description">
						            <br /><strong>Click!</strong>
						          </span>
						        </label>
						        <input type="file" name="file" id="fileLabel" class="files form-control form-control-sm" multiple style="display: none;">
						      </form>
						    </div>
						  </div>
						  <ul id="fileList" style="display: none;"></ul>
						  <br><br>
						  <div class="file_drag"></div>
						  <div class="ECG_test_section">
						    <button type="submit" id="submit-btn" class="ECG_test" onclick="send()">검사하기</button>
						  </div>
						</div>
                    </div>
                </div>

            </div>
        </div>
        </div>
    </section>

    <section class="works works-fit">
        <div class="container ECG_background_img">
            <h2 class="subtitle">부정맥이란? </h2>
            <p class="subtitle-des"><span class="subtitle-des_ef1">부정맥</span>은 비정상적인 심장의 리듬으로 <span
                    class="subtitle-des_ef">심장박동이 불규칙이거나, 너무 빠르거나, 너무 느린 경우</span>를 말합니다</p>


            <p class="subtitle-des">
                일반적으로 부정맥 진단을 위해 맥박수를 측정하는데, 정상인의 경우 <br> 몸 상태에 따라서 수면 혹은 안정된 상태에서는 박동수가 분당 60회 아래로 내려가기도 하고, <br> 흥분 혹은
                운동
                상태에서는
                분당 100회 위로 올라가기도 합니다. <br><br><br> 동방결절에서 발생하는 정상 전기자극으로 뛰지 않으면서, 맥박수가 분당 60회 미만이면 <br> 느린
                부정맥(bradyarrhythmia)이라
                하며, 분당
                100회 이상으로 빠르게 뛰면 빠른 부정맥(tachyarrhythmia)이라 합니다.
            </p>
            <br>
            <h3 class="subtitle">부정맥 초기증상</h3>
            <p class="subtitle-des"><br>- 이유 없는 <span class="subtitle-des_ef">가슴의 두근거림</span> <br> - 이유 없는 <span
                    class="subtitle-des_ef">호흡곤란</span> <br> - <span class="subtitle-des_ef">현기증</span>이나 <span
                    class="subtitle-des_ef">실신</span></p>
            <br>
            <br>
            <br>
            <br>
            <div class="row">
                <div class="container">
                    <h2 class="subtitle">부정맥의 종류</h2>
                    <br><br>
                </div>
                <div class="col-sm-3">
                    <figure class="wow fadeInLeft animated portfolio-item animated ECG_type_card"
                        data-wow-duration="300ms" data-wow-delay="0ms"
                        style="visibility: visible; animation-duration: 300ms; -webkit-animation-duration: 300ms; animation-delay: 0ms; -webkit-animation-delay: 0ms; animation-name: fadeInLeft; -webkit-animation-name: fadeInLeft;">
                        <div class="img-wrapper">
                            <img src="resources/images/맥박/심방세동.png" class="img-responsive" alt="portfolio items">
                        </div>
                        <figcaption class="figcaption_top">
                            <h4>
                                <a href="#" style="font-weight: bold;">
                                    심방세동
                                </a>
                            </h4>
                            <p class="subtitle-des">
                                <span style="color: red;">♥</span> 불규칙한 맥박
                            </p>
                        </figcaption>
                    </figure>
                </div>
                <div class="col-sm-3">
                    <figure class="wow fadeInLeft animated animated ECG_type_card" data-wow-duration="300ms"
                        data-wow-delay="300ms"
                        style="visibility: visible; animation-duration: 300ms; -webkit-animation-duration: 300ms; animation-delay: 300ms; -webkit-animation-delay: 300ms; animation-name: fadeInLeft; -webkit-animation-name: fadeInLeft;">
                        <div class="img-wrapper">
                            <img src="resources/images/맥박/서맥.png" class="img-responsive" alt="portfolio items">
                        </div>
                        <figcaption class="figcaption_top">
                            <h4>
                                <a href="#" style="font-weight: bold;">
                                    서맥성
                                </a>
                            </h4>
                            <p class="subtitle-des">
                                <span style="color: red;">♥</span> 1분 60회 미만
                            </p>
                        </figcaption>
                    </figure>
                </div>

                <div class="col-sm-3">
                    <figure class="wow fadeInLeft animated animated ECG_type_card" data-wow-duration="300ms"
                        data-wow-delay="600ms"
                        style="visibility: visible; animation-duration: 300ms; -webkit-animation-duration: 300ms; animation-delay: 300ms; -webkit-animation-delay: 300ms; animation-name: fadeInLeft; -webkit-animation-name: fadeInLeft;">
                        <div class="img-wrapper">
                            <img src="resources/images/맥박/빈맥.png" class="img-responsive" alt="">
                        </div>
                        <figcaption class="figcaption_top">
                            <h4>
                                <a href="#" style="font-weight: bold;">
                                    빈맥성
                                </a>
                            </h4>
                            <p class="subtitle-des">
                                <span style="color: red;">♥</span> 1분 100회 이상
                            </p>
                        </figcaption>
                    </figure>
                </div>

                <div class="col-sm-3">
                    <figure class="wow fadeInLeft animated animated ECG_type_card" data-wow-duration="300ms"
                        data-wow-delay="900ms"
                        style="visibility: visible; animation-duration: 300ms; -webkit-animation-duration: 300ms; animation-delay: 600ms; -webkit-animation-delay: 600ms; animation-name: fadeInLeft; -webkit-animation-name: fadeInLeft;">
                        <div class="img-wrapper">
                            <img src="resources/images/맥박/조기박동.png" class="img-responsive" alt="">
                        </div>
                        <figcaption class="figcaption_top">
                            <h4>
                                <a href="#" style="font-weight: bold;">
                                    조기박동
                                </a>
                            </h4>
                            <p class="subtitle-des">
                                <span style="color: red;">♥</span> 엇박자로 뛰는 맥박
                            </p>
                        </figcaption>
                    </figure>
                </div>

            </div>
        </div>
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
                        <h2 class="title wow fadeInDown" data-wow-delay=".3s" data-wow-duration="500ms">나를 위한 만족도 조사
                            </h1>
                            <p class="wow fadeInDown" data-wow-delay=".5s" data-wow-duration="500ms">당신이 경험한 이야기를 우리에게
                                나누어 주세요.<br>우리는 당신의 이야기로 더욱 만족스러운 서비스를 제공 드릴 것을 약속드립니다</p>
                            <a href="https://forms.gle/JH1Ya6SnKUn6boTA6" class="btn btn-default btn-contact wow fadeInDown" data-wow-delay=".7s" data-wow-duration="500ms">참여하기</a>
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
                        <script>
                            document.write(new Date().getFullYear())
                        </script>
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
    </footer> <!-- /#footer -->

    <!-- Template Javascript Files
	================================================== -->
    <!-- jquery -->
    <script src="resources/plugins/jQurey/jquery.min.js"></script>
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
    <script src="resources/js/ecgCheck.js"></script>
</body>

</html>