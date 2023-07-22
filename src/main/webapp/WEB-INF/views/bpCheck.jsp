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
    <title>혈압 검사</title>
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
                        <h1 style="text-align: left; font-weight: bold;">혈압 검사</h1>
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
                                <li class="active">혈압 데이터 입력</li>
                                <li>검사 결과 확인</li>
                                <li>건강 기록</li>
                            </ul>
                            <!-- fieldsets -->
                        </div>

                        <div class="card_input">
                            <div class="ECG-body">
                                <h2 class="ECG-title"><img src="resources/images/checkmark.png" alt=""> 혈압 데이터 입력하기 </h2>
                                <p class="subtitle-des">일정 시간에 2~3일 간격으로 <br> 아침, 저녁 2회씩 측정을 권장해 드립니다.</p>
                                <br><br>
                                <div class="Blood_pressure_input">
                                <form action="${cpath}/bpResult" method="post">
								  <div class="pressure_input-block">
								    <input name="bp_high" class="pressure_input" type="number" id="수축기" required>
								    <label for="수축기 혈압">수축기(최고) 혈압 입력</label>
								  </div>
								  <br>
								  <div class="pressure_input-block">
								    <input name="bp_low" class="pressure_input" type="number" id="이완기" required>
								    <label for="이완기 혈압">이완기(최저) 혈압 입력</label>
								  </div>
								  <br><br>
								  <div class="ECG_test_section">
								    <button type="submit" class="ECG_test">검사하기</button>
								  </div>
								</form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>

    <section class="works works-fit">
        <div class="container">
            <div class="pre_check">
                <h2 class="subtitle">혈압 체크리스트 </h2>
                <p class="subtitle-des_ef">* 2가지 이상 증상이 나타난다면 전문의와 상담을 권유드립니다. </p>
                <br>
                <div class="col-sm-12">
                    <div class="col-sm-6 high_check">
                        <span class="subtitle-des_ef1_che"><img src="resources/images/checkmark.png" alt=""> 고혈압 전조증상</span>
                        <div class="check_wrap_pre">
                            <input type="checkbox" id="check_btn_pre" />
                            <label for="check_btn_pre"><span>머리가 무겁고 두통이 생긴다</span></label>
                        </div>
                        <div>
                            <input type="checkbox" id="check_btn_pre" />
                            <label for="check_btn_pre"><span>코피가 쉽게 난다</span></label>
                            <br>
                        </div>
                        <div>
                            <input type="checkbox" id="check_btn_pre" />
                            <label for="check_btn_pre"><span>얼굴에 열이 오르고 머리에 땀이 난다</span></label>
                            <br><input type="checkbox" id="check_btn_pre" />
                            <label for="check_btn_pre"><span>어깨나 못덜미가 뻣뻣하고 아프다</span></label>
                            <br><input type="checkbox" id="check_btn_pre" />
                            <label for="check_btn_pre"><span>현기증이나 난다</span></label>
                            <br><input type="checkbox" id="check_btn_pre" />
                            <label for="check_btn_pre"><span>귀울림이 생긴다</span></label>
                            <br><input type="checkbox" id="check_btn_pre" />
                            <label for="check_btn_pre"><span>손발 저림증상이 있다</span></label>
                            <br><input type="checkbox" id="check_btn_pre" />
                            <label for="check_btn_pre"><span>맥박이 빨라지곤 한다</span></label>
                            <br><input type="checkbox" id="check_btn_pre" />
                            <label for="check_btn_pre"><span>조금만 걸어도 숨이 찬다</span></label>
                        </div>
                    </div>
                    <div class="col-sm-6 high_check">
                        <span class="subtitle-des_ef1_che"><img src="resources/images/checkmark.png" alt=""> 저혈압 전조증상</span>
                        <div class="check_wrap_pre">
                            <input type="checkbox" id="check_btn_pre" />
                            <label for="check_btn_pre"><span>어지럽거나 실신을 한다</span></label>
                            <br>
                            <input type="checkbox" id="check_btn_pre" />
                            <label for="check_btn_pre"><span>몸이 피로하고 무기력하다</span></label>
                            <br>
                            <input type="checkbox" id="check_btn_pre" />
                            <label for="check_btn_pre"><span>창백하고 손발이 차다</span></label>
                            <br><input type="checkbox" id="check_btn_pre" />
                            <label for="check_btn_pre"><span>이유없이 자주 목이 마르다</span></label>
                            <br><input type="checkbox" id="check_btn_pre" />
                            <label for="check_btn_pre"><span>속이 메스껍거나 구토를 한다</span></label>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>
            <div class="row">
                <div class="container">
                    <h2 class="subtitle">혈압 관련 영상</h2>
                    <br><br>
                </div>
                <div class="iframebox">
                    <div class="col-sm-6">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/RjkD77zbMUM"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                            allowfullscreen></iframe>
                    </div>


                    <div class="col-sm-6">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/LzHMy2ScdhA"
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