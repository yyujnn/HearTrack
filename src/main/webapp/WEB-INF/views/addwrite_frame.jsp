<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<!DOCTYPE html>
<html class="no-js">

<head>
    <!-- Basic Page Needs
        ================================================== -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="icon" href="resources/images/ht_favicon.png">
    <title>HearTrack - 건강기록</title>
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
    <link rel="stylesheet" href="resources/css/style3.css">
    <link rel="stylesheet" href="resources/css/style5.css">
    <link rel="stylesheet" href="resources/css/style7.css">

</head>

<body>

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
                        <p class="subtitle-des_ef1 pressure_input"><strong>내용 입력</strong></p>
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
                                    <img src="./images/혈당아이콘.png" alt=""> 나의 공복혈당은 <span class="subtitle-des_ef">
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
                                    <img src="./images/혈압아이콘.png" alt=""> 나의 공복혈당은 <span class="subtitle-des_ef">
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
</body>

</html>