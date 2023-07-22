<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js">

<head>
    <!-- Basic Page Needs
        ================================================== -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="icon" href="resources/images/ht_favicon.png">
    <title>건강기록</title>
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
    <link rel="stylesheet" href="resources/css/style4.css">
    <link rel="stylesheet" href="resources/css/style5.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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




    <section class="works works-fit">

        <div class="container">
            <h4 class="subtitle subtitle_start">나의 건강기록</h4>
            <div class="wrapper">

                <div class="clash-card barbarian">
                    <div class="clash-card__image clash-card__image--barbarian">
                        <img class="ecgmain_Card2"
                            src="https://cdn.pixabay.com/photo/2020/08/03/09/39/medical-5459631_1280.png"
                            alt="barbarian" />
                    </div>
                    <div class="clash-card__level clash-card__level--barbarian"><fmt:formatDate value="${userInfo.user_accdate}" pattern="yy.MM.dd" />(최근 접속)</div>
                    <div class="clash-card__unit-name">${userInfo.user_name}님</div>
                    <div class="clash-card__unit-description">
                        HearTrack과 함께<br> 건강을 디자인하세요.
                    </div>

                    <div class="clash-card__unit-stats clash-card__unit-stats--barbarian clearfix">
                        <div class="one-third">
                            <div class="stat-value stat_none">${userInfo.user_gender}성</div>
                        </div>

                        <div class="one-third">
                            <div class="stat-value stat_none">${userInfo.user_age}세</div>
                        </div>

                        <div class="one-third no-border">
                            <div class="stat-value stat_none">정보 변경</div>
                        </div>

                    </div>

                </div> <!-- end clash-card barbarian-->

                <div class="clash-card barbarian">
                    <div class="clash-card__image clash-card__image--barbarian">
                        <img class="ecgmain_Card1"
                            src="https://cdn.pixabay.com/photo/2013/07/13/10/25/heart-157178_1280.png"
                            alt="barbarian" />
                    </div>
                    <div class="clash-card__level clash-card__level--barbarian"><fmt:formatDate value="${LatestEcg.input_date}" pattern="yy.MM.dd" />(최근 기록)</div>
                    <div class="clash-card__unit-name">ECG</div>
                    <div class="clash-card__unit-description">
                        정기적인 심전도 검사가 <br> 심장 건강을 지킵니다.
                    </div>

                    <div class="clash-card__unit-stats clash-card__unit-stats--barbarian clearfix">
                        <div class="one-third">
                            <div class="stat">${empty LatestEcg.hr ? '-' : LatestEcg.hr}</div>
                            <div class="stat-value">평균BPM</div>
                        </div>

                        <div class="one-third one-third_a">
                            <div class="stat-value stat_none">${empty LatestEcg.resultsText ? '-' : LatestEcg.resultsText}</div>
                        </div>

                        <div class="one-third no-border one-third_a">
                            <div class="stat-value stat_none"> <a class="qqq wow animated smooth-scroll"
                                    data-wow-delay=".5s" href="#feature" data-section="#feature">바로 가기</a></div>
                        </div>

                    </div>

                </div> <!-- end clash-card barbarian-->
            </div> <!-- end wrapper -->

            <br><br><br>

            <div class="wrapper">

                <div class="clash-card barbarian">
                    <div class="clash-card__image clash-card__image--barbarian">
                        <img class="ecgmain_Card3"
                            src="resources/images/card3.png"
                            alt="barbarian" />
                    </div>
                    <div class="clash-card__level clash-card__level--barbarian"><fmt:formatDate value="${LatestBp.input_date}" pattern="yy.MM.dd" />(최근 기록)</div>
                    <div class="clash-card__unit-name">혈압</div>
                    <div class="clash-card__unit-description">
                        <p class="subtitle-des_ef1"><span class="result_2">● </span>고혈압 의심</p>
                    </div>

                    <div class="clash-card__unit-stats clash-card__unit-stats--barbarian clearfix">
                        <div class="one-third">
                            <div class="stat">${LatestBp.bp_high}</div>
                            <div class="stat-value">최고혈압</div>
                        </div>

                        <div class="one-third one-third_a">
                            <div class="stat">${LatestBp.bp_low}</div>
                            <div class="stat-value">최저혈압</div>
                        </div>

                        <div class="one-third no-border one-third_a">
                            <div class="stat-value stat_none"> <a class="qqq wow animated smooth-scroll"
                                    data-wow-delay=".5s" href=".bp_record" data-section=".bp_record">바로 가기</a></div>
                        </div>

                    </div>

                </div> <!-- end clash-card barbarian-->

                <div class="clash-card barbarian">
                    <div class="clash-card__image clash-card__image--barbarian">
                        <img class="ecgmain_Card4" src="resources/images/char5.png" alt="barbarian" />
                    </div>
                    <div class="clash-card__level clash-card__level--barbarian"><fmt:formatDate value="${LatestBs.input_date}" pattern="yy.MM.dd" />(최근 기록)</div>
                    <div class="clash-card__unit-name">혈당</div>
                    <div class="clash-card__unit-description">
                        <p class="subtitle-des_ef1"><span class="result_1">● </span>건강</p>
                    </div>

                    <div class="clash-card__unit-stats clash-card__unit-stats--barbarian clearfix">
                        <div class="one-third">
                            <div class="stat">${empty LatestBs.bs_emp ? '-' : LatestBs.bs_emp}</div>
                            <div class="stat-value">공복혈당</div>
                        </div>

                        <div class="one-third one-third_a">
                            <div class="stat">${empty LatestBs.bs_ful ? '-' : LatestBs.bs_ful}</div>
                            <div class="stat-value">식후혈당</div>
                        </div>

                        <div class="one-third no-border one-third_a">
                            <div class="stat-value stat_none"> <a class="qqq wow animated smooth-scroll"
                                    data-wow-delay=".5s" href="#bs_record" data-section="#bs_record">바로 가기</a></div>
                        </div>

                    </div>

                </div> <!-- end clash-card barbarian-->
            </div> <!-- end wrapper -->





        </div>

    </section>

    <section id="feature">
        <div class="container">
            <div class="container_ECG_record">
                <span class="subtitle">나의 ECG</span>
                <span>
                    <a href="ecgCheck" class="button_ECG btnPush_ECG">다시 검사하기</a>
                </span>
            </div>
            <div class="ECG_record">
                <h4 class="subtitle2">최근 ECG 그래프</h4>
                <div class="col-sm-9">
                    <img class="ECG_record_IMG"
                        src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkWXPK2vuqd2o3vqZBCRRmmNHrch6FKST7SA&usqp=CAU" />
                </div>
                <div class="col-sm-3 ECG_Result">
                    <p class="subtitle-des_ef1">${userInfo.user_name}님의 검사 기록</p>
                    <table class="ecg_result_table">
                        <thead>
                            <tr>
                                <th>내용</th>
                                <th>결과</th>
                            </tr>
                        </thead>
                        <tr>
                            <td>검사날짜</td>
                            
                            <td><fmt:formatDate value="${LatestEcg.input_date}" pattern="yy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <td>검사결과</td>
                            <td><span class="result_1">● </span> 정상</td>
                        </tr>
                        <tr>
                            <td>P파</td>
                            <td>0.45</td>
                        </tr>
                        <tr>
                            <td>QRS파</td>
                            <td>0.68</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="ECG_record_List">
                <h4 class="subtitle2">최근 검사 기록</h4>
                <div class="ECG_record_table_box">
                    <table class="ECG_record_table">
                        <thead>
                            <tr>
                                <th>검사 날짜</th>
                                <th>검사 결과</th>
                                <th>확인 하기</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${MyEcgList}" var= "ecgList" >
                        	<tr>
                                <td>yy-mm-dd${ecgList.input_date}</td>
                                <td>정상</td>
                                <td><a href="">다시 보기</a></td>
                            </tr>	
                        	</c:forEach>
                            <tr>
                                <td>yy-mm-dd</td>
                                <td>정상</td>
                                <td><a href="">다시 보기</a></td>
                            </tr>
                            <tr>
                                <td>yy-mm-dd</td>
                                <td>정상</td>
                                <td><a href="">다시 보기</a></td>
                            </tr>
                            <tr>
                                <td>yy-mm-dd</td>
                                <td>정상</td>
                                <td><a href="">다시 보기</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section> <!-- /#feature -->
    
    
    
    <section id="feature" class="bp_record">
        <div class="container">
            <div class="container_ECG_record">
                <span class="subtitle">나의 혈압</span>
                <span>
                    <a href="bpCheck" class="button_ECG btnPush_ECG">다시 검사하기</a>
                </span>
            </div>
            <br>
            <div class="container_ECG_record">
                <h4 class="subtitle2">최근 검사 기록</h4>
                <div class="btn_Test">
                    <h4 class="subtitle2"><a href="">+ 더 보기</a></h4>
                </div>
            </div>
            <div class="table-responsive">
                <table class="blood_pre_table">
                    <thead>
                        <tr>
                            <th scope="col" class="col_th">검사 날짜</th>
                            <th scope="col" class="col_th">최고혈압</th>
                            <th scope="col" class="col_th">최저혈압</th>
                            <th scope="col" class="col_th">검사 결과</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    
						<c:set var="previousDate" value="" />
						<c:set var="count" value="1" />
						
						<c:forEach items="${MyBpList}" var="item">
						    <c:set var="formattedDate" value="${fn:substring(item.input_date, 0, 8)}" />
						    <c:if test="${previousDate != formattedDate}">
						        <c:set var="count" value="1" />
						    </c:if>
						    <tr>
						        <td class="noBorder noBorder_td"><fmt:formatDate value="${item.input_date}" pattern="MM.dd HH:mm" /></td>
						        <td class="noBorder noBorder_td">${item.bp_high}</td>
						        <td class="noBorder noBorder_td">${item.bp_low}</td>
						        <td class="noBorder noBorder_td"></td>
						    </tr>
						    <c:set var="previousDate" value="${formattedDate}" />
						    <c:set var="count" value="${count + 1}" />
						</c:forEach>








                        <tr>
                            <td class="noBorder noBorder_td">ㅎㅇ</td>
                            <td class="noBorder noBorder_td">60</td>
                            <td class="noBorder noBorder_td">80</td>
                            <td class="noBorder noBorder_td"><span class="result_1">●</span> 건강</td>
                        </tr>
                        <tr>
                            <td class="noBorder noBorder_td">23.07.18_2</td>
                            <td class="noBorder noBorder_td">160</td>
                            <td class="noBorder noBorder_td">180</td>
                            <td class="noBorder noBorder_td"><span class="result_2">●</span> 고혈압 의심</td>
                        </tr>
                        <tr>
                            <td class="noBorder noBorder_td">23.07.18_3</td>
                            <td class="noBorder noBorder_td">60</td>
                            <td class="noBorder noBorder_td">80</td>
                            <td class="noBorder noBorder_td"><span class="result_1">●</span> 건강</td>
                        </tr>
                        <tr>
                            <td class="noBorder noBorder_td">23.07.18_4</td>
                            <td class="noBorder noBorder_td">6</td>
                            <td class="noBorder noBorder_td">8</td>
                            <td class="noBorder noBorder_td"><span class="result_3">●</span> 저혈압</td>
                        </tr>
                        <tr>
                            <td class="noBorder noBorder_td">23.07.17_1</td>
                            <td class="noBorder noBorder_td">60</td>
                            <td class="noBorder noBorder_td">80</td>
                            <td class="noBorder noBorder_td"><span class="result_1">●</span> 건강</td>
                        </tr>
                        <tr>
                            <td class="noBorder noBorder_td">23.07.17_2</td>
                            <td class="noBorder noBorder_td">60</td>
                            <td class="noBorder noBorder_td">80</td>
                            <td class="noBorder noBorder_td"><span class="result_1">●</span> 건강</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section> <!-- /#feature -->
    
    <section class="works" id="bs_record">
        <div class="container blood_sugar_container">
            <div class="container_ECG_record">
                <span class="subtitle">나의 혈당</span>
                <span>
                    <a href="bsCheck" class="button_ECG btnPush_ECG">다시 검사하기</a>
                </span>
            </div>
            <br>
            <div class="container_ECG_record">
                <h4 class="subtitle2">최근 검사 기록</h4>
                <div class="btn_Test">
                    <h4 class="subtitle2"><a href="">+ 더 보기</a></h4>
                </div>
            </div>
            <div class="table-responsive">
                <table class="blood_sugar_table">
                    <thead>
                        <tr>
                            <th scope="col" class="col_th">검사 날짜</th>
                            <th scope="col" class="col_th">공복 혈당</th>
                            <th scope="col" class="col_th">식후 혈당</th>
                            <th scope="col" class="col_th">검사 결과</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                   		<c:set var="previousDate" value="" />
						<c:set var="count" value="1" />
						
						<c:forEach items="${MyBsList}" var="item">
						    <c:set var="formattedDate" value="${fn:substring(item.input_date, 0, 8)}" />
						    <c:if test="${previousDate != formattedDate}">
						        <c:set var="count" value="1" />
						    </c:if>
						    <tr>
						        <td class="noBorder noBorder_td"><fmt:formatDate value="${item.input_date}" pattern="yy.MM.dd" />_${count}</td>
						        <td class="noBorder noBorder_td">${item.bs_emp}</td>
						        <td class="noBorder noBorder_td">${item.bs_ful}</td>
						        <td class="noBorder noBorder_td"></td>
						    </tr>
						    <c:set var="previousDate" value="${formattedDate}" />
						    <c:set var="count" value="${count + 1}" />
						</c:forEach>
                   		
                    
                        <tr>
                            <td class="noBorder noBorder_td">23.07.18_1</td>
                            <td class="noBorder noBorder_td">60</td>
                            <td class="noBorder noBorder_td">80</td>
                            <td class="noBorder noBorder_td"><span class="result_1">●</span> 건강</td>
                        </tr>
                        <tr>
                            <td class="noBorder noBorder_td">23.07.18_2</td>
                            <td class="noBorder noBorder_td">160</td>
                            <td class="noBorder noBorder_td">180</td>
                            <td class="noBorder noBorder_td"><span class="result_2">●</span> 당뇨 의심</td>
                        </tr>
                        <tr>
                            <td class="noBorder noBorder_td">23.07.18_3</td>
                            <td class="noBorder noBorder_td">60</td>
                            <td class="noBorder noBorder_td">80</td>
                            <td class="noBorder noBorder_td"><span class="result_1">●</span> 건강</td>
                        </tr>
                        <tr>
                            <td class="noBorder noBorder_td">23.07.18_4</td>
                            <td class="noBorder noBorder_td">6</td>
                            <td class="noBorder noBorder_td">8</td>
                            <td class="noBorder noBorder_td"><span class="result_3">●</span> 저혈당</td>
                        </tr>
                        <tr>
                            <td class="noBorder noBorder_td">23.07.17_1</td>
                            <td class="noBorder noBorder_td">60</td>
                            <td class="noBorder noBorder_td">80</td>
                            <td class="noBorder noBorder_td"><span class="result_1">●</span> 건강</td>
                        </tr>
                        <tr>
                            <td class="noBorder noBorder_td">23.07.17_2</td>
                            <td class="noBorder noBorder_td">60</td>
                            <td class="noBorder noBorder_td">80</td>
                            <td class="noBorder noBorder_td"><span class="result_1">●</span> 건강</td>
                        </tr>
                    </tbody>
                </table>
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
    </footer> <!-- /#footer -->



    <!-- The Modal -->
    <!-- The Modal -->
    <!-- The Modal -->
    <!-- The Modal -->
    <!--
    <div class="modal fade" id="Modi_info_Modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="Modi_info_Modal-header">-->
    <!-- Modal Header 
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
-->
    <!-- Modal body 
                <div class="Modi_info_Modal-body">
                    <div class="container_login">
                        <h2 class="Modi_info_Modal-title">HearTrack</h2>
                        <h4 class="Modi_info_Modal-subtitle ">회원정보수정</h4>-->
    <!-- Form
                        <form action="" method="post" class="Modi_info_id">
                            <p>Password 변경</p>
                            <div class="input__block">
                                <input type="password" placeholder="변경할 비밀번호 입력" class="input" id="password" />
                            </div>
                            <p>신장 변경</p>
                            <div class="input__block">
                                <input type="password" placeholder="변경할 비밀번호 입력" class="input" id="password" />
                            </div>
                            <p>몸무게 변경</p>
                            <div class="input__block">
                                <input type="password" placeholder="변경할 비밀번호 입력" class="input" id="password" />
                            </div>
                            <div>
                                <p>또는</p>
                            </div>
 -->
    <!-- Modi in button 
                            <button class="Modi_info__btn">
                                변경
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
-->


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