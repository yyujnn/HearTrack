<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js">

<head>
    <!-- Basic Page Needs
        ================================================== -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="icon" href="resources/images/ht_favicon.png">
    <title>혈당 검사 결과</title>
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
    <link rel="stylesheet" href="resources/css/style4.css">
    <link rel="stylesheet" href="resources/css/style5.css">
	
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-straight/css/uicons-solid-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>

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
                        <h1 style="text-align: left; font-weight: bold;">혈당 검사 결과</h1>
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
                                <li class="active">혈당 데이터 입력</li>
                                <li class="active">검사 결과 확인</li>
                                <li>건강 기록</li>
                            </ul>
                            <!-- fieldsets -->
                        </div>


                        <div class="card_result_pre">
                            <div class="ECG-body">
                                <h2 class="ECG-title"><img src="resources/images/checkmark.png" alt=""> 혈당 검사 결과 확인하기 </h2>
                                <p class="subtitle-des">보름에 한번 식전, 매 식후 2시간 측정을 하여 확인하는 것을 권장해 드립니다.</p>
                                <div class="Blood_pressure_input">
                                    <span class="subtitle-des_ef">측정일시 : <fmt:formatDate value="${health.input_date}" pattern="yyyy.MM.dd HH:mm" />
									</span>
                                </div>
                            </div>
                            <div class="container_chart">

                                <div class="col-sm-6 ">
                                    <div>
                                        <h4 class="subtitle">공복 혈당</h4>
                                    </div>
                                    <div class="health-main">
                                        <div class="health-main__progress">
                                            <div class="progress-top">
                                            </div>
                                            <!-- .half-circle-progress -->
                                            <div class="half-circle-progress">
                                                <!-- //오른쪽 그래프 실행 될 때 .progress-right-on 추가  -->

                                                <!-- 프로그래스바 중앙 텍스트  -->
                                                <div class="progress-result">
                                                    <p class="progress-result__spot"><strong>${health.bs_emp}</strong> </p>
                                                    <br>
                                                    <p class="progress-result__spot"><span class="result_1">● </span>정상 </p>
                                                </div>
                                                <!-- //프로그래스바 중앙 텍스트  -->

                                                <!-- 왼쪽 프로그래스바 -->
                                                <div class="progress-left">
                                                    <div class="progress-left__inner">
                                                        <div class="progress-bar" style="transform: rotate(-70deg);">
                                                        </div> <!-- rotate 값: -45deg ~ -135deg : 음수 입니다.-->
                                                    </div>
                                                </div>
                                                <!-- //왼쪽 프로그래스바 -->

                                                <!-- 오른쪽 프로그래스바 -->
                                                <div class="progress-right">
                                                    <div class="progress-left__inner">
                                                        <div class="progress-bar" style="transform: rotate(45deg);">
                                                        </div> <!-- rotate 값: 45deg ~ 135deg : 양수 입니다.-->
                                                    </div>
                                                </div>
                                                <!-- //오른쪽 프로그래스바 -->

                                                <div class="progress-center-dot"></div> <!-- // 중앙 기준 점 -->

                                                <!-- 프로그래스바  숫자 영역  -->
                                                <div class="progress-thumb" style="transform: rotate(-73deg);">
                                                    <div class="progress-thumb__inner">
                                                        <p class="progress-circle"><span> 정상 </span></p>
                                                    </div>
                                                </div>
                                                <!-- //프로그래스바  숫자 영역  -->

                                            </div>
                                            <!-- //.half-circle-progress -->



                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 ">
                                    <div>
                                        <h4 class="subtitle">식후 혈당</h4>
                                    </div>
                                    <div class="half-circle-progress">
                                        <!-- //오른쪽 그래프 실행 될 때 .progress-right-on 추가  -->

                                        <!-- 프로그래스바 중앙 텍스트  -->
                                        <div class="progress-result">
                                            <p class="progress-result__spot"><strong>${health.bs_ful}</strong> </p>
                                            <br>
                                            <p class="progress-result__spot"><span class="result_1">● </span>정상 </p>
                                        </div>
                                        <!-- //프로그래스바 중앙 텍스트  -->

                                        <!-- 왼쪽 프로그래스바 -->
                                        <div class="progress-left">
                                            <div class="progress-left__inner">
                                                <div class="progress-bar" style="transform: rotate(-70deg);">
                                                </div> <!-- rotate 값: -45deg ~ -135deg : 음수 입니다.-->
                                            </div>
                                        </div>
                                        <!-- //왼쪽 프로그래스바 -->

                                        <!-- 오른쪽 프로그래스바 -->
                                        <div class="progress-right">
                                            <div class="progress-left__inner">
                                                <div class="progress-bar" style="transform: rotate(45deg);">
                                                </div> <!-- rotate 값: 45deg ~ 135deg : 양수 입니다.-->
                                            </div>
                                        </div>
                                        <!-- //오른쪽 프로그래스바 -->

                                        <div class="progress-center-dot"></div> <!-- // 중앙 기준 점 -->

                                        <!-- 프로그래스바  숫자 영역  -->
                                        <div class="progress-thumb" style="transform: rotate(-73deg);">
                                            <div class="progress-thumb__inner">
                                                <p class="progress-circle"><span> 정상 </span></p>
                                            </div>
                                        </div>
                                        <!-- //프로그래스바  숫자 영역  -->

                                    </div>
                                </div>
                            </div>
                            <div class="Blood_pressure_info">
                                <span class="pressure_info1"> <span class="result_1">●  </span> 정상 </span>
                                <span class="pressure_info2"> <span class="result_3">●  </span> 저혈압 </span>
                                <span class="pressure_info3"> <span class="result_2">●  </span> 고혈압 </span>
                            </div>
                            <div class="Blood_pressure_result">
                                <button class="ECG_test1"><i class="fi fi-ss-copy-alt"></i> 결과 복사</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        </div>
    </section>

    <section class="works works-fit">
        <div class="container">
            <h2 class="subtitle">혈당 조절 목표에 대해 </h2>

            <br>
            <div class="Blood_pressure_diff">
                <img class="Blood_pressure_diff_img" src="resources/images/bsugar.jpg"
                    alt="">
            </div>
            <br>
            <div class="row">
                <div class="container">
                    <h2 class="subtitle">혈당 검사에 대해서</h2>
                    <br><br>
                </div>
                <div class="iframebox">
                    <div class="col-sm-6">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/NBumehWoWE4"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                            allowfullscreen></iframe>
                    </div>
                    <div class="col-sm-6">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/HMRwDzbgGuE"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                            allowfullscreen></iframe>
                    </div>
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