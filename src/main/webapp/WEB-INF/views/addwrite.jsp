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
    <title>커뮤니티</title>
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
    <link rel="stylesheet" href="resources/css/community.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/style2.css">
    <link rel="stylesheet" href="resources/css/style3.css">
    <link rel="stylesheet" href="resources/css/style5.css">
    <link rel="stylesheet" href="resources/css/style7.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
	// 카테고리
    function filterByCategory(category) {
        console.log(category); // 카테고리 값 출력
        
        $("article").hide(); // 모든 게시물 숨기기
        $("article[data-category='" + category + "']").show(); // 선택한 카테고리 게시물만 보이기
    }
    
    
    // 댓글
    var user_id = '${userInfo.user_id}'; // 로그인 되어있는 user_id

	 // [함수] 초기 댓글 리스트 가져옴
	 function getInitialComments() {
	   // ajax 요청을 통해 초기 댓글 리스트 가져오기
	   $.ajax({
	     url: 'getComments',
	     success: function (res) {
	       console.log(res);  // select all 해온 댓글리스트 commRes (+user_name)
	
	       // 리스트순서를 돌며, 
	       for (var i = 0; i < res.length; i++) {
	         var comm = res[i]; // [i]번 순서의 댓글 객체 1개
	         var p_num = comm.p_num; // 반복문을 통해 숫자 p_num 하나씩 가져온다.
	         var commlistDiv = $('div[id="comment-list-' + p_num + '"]'); // 해당하는 댓글추가할 <div>
	
	         var comment = document.createElement("div"); // 변수 comment = div를 생성.
	         comment.className = "comment"; // className = comment
	         comment.innerHTML = "<span class='comment-user'>" + res[i].user_name + ": </span> " + res[i].content; // innerHTML = 유저아이디 : + [내용] 으로 이뤄짐
	
	         //console.log(comment)
	         commlistDiv.append(comment); // 만든 div를 append
	       }
	
	     },
	     error: function (xhr, status, error) {
	       console.log('에러!');
	     }
	   });
	 }
	
	
	
	 // [함수] 조회해온 댓글리스트를(=res) 화면단에 띄움
	 function addComment(p_num, res) { // 변수 p_num 과 조회한 Arraylist res
	   // "comment-input-" + p_num : 각각의 게시글에 해당하는 입력창의 id 
	   var commentInput = document.getElementById("comment-input-" + p_num); // <input>선택
	   var commentList = document.getElementById("comment-list-" + p_num); // 댓글이 추가될 위치 선택
	
	   if (commentInput.value !== "") { // input 비어있지 않을때
	
	     for (let i = 0; i < res.length; i++) {
	
	       var comment = document.createElement("div"); // 변수 comment = div를 생성.
	       comment.className = "comment"; // className = comment
	       comment.innerHTML = "<span class='comment-user'>" + res[i].user_name + ": </span> " + res[i].content; // innerHTML = 유저아이디 : + [내용] 으로 이뤄짐
	       commentList.appendChild(comment); // 만든 div를 append
	       commentInput.value = ""; // 해당하는 input 창 clean 
	     }
	   }
	   var commentButton = document.getElementById("comment-button-" + p_num);     // 해당게시글의 버튼 선택
	   commentButton.style.color = "rgb(199, 235, 245)";         // 댓글 추가 후 버튼 색상 초기화
	 }
	
	
	
	 // [document ready event]
	 $(function () {
	   getInitialComments(); // document load 후 초기 댓글 띄우기
	
	   $('.review_upload').on('click', function () {
	
	     var rvbtn = $(this);
	     var id = rvbtn.attr('id');
	     var p_num = id.replace('comment-button-', '');
	     var content = $('input[id="comment-input-' + p_num + '"]').val();
	
	
	     console.log('p_num >>', p_num);
	     console.log('content >>', content);
	     console.log('user_id >>', user_id);
	
	     $.ajax({
	       url: 'commentReg',
	       method: 'POST',
	       dataType: 'json',
	       data: {
	         content: content,
	         p_num: p_num,
	         user_id: user_id
	       },
	       success: function (res) { // res 로 받을 것 = p_num 으로 보내준 값에 해당하는 content, user_name
	
	         console.log(res);
	
	         //해당 댓글 추가란 비우기
	         $('div[id="comment-list-' + p_num + '"]').empty();
	
	         addComment(p_num, res);
	
	
	       },
	       error: function (xhr, status, error) {
	         console.log('에러!');
	       }
	     });
	   });
	 });
</script>

</head>

<body>
   

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
                        <img src="resources/images/logo.png" alt="" stlye="width : 130px" !important>
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

    <section id="blog-full-width" style="background-color: #dae0e6; ">
        <div class="container">
            <div class="row">
                <div class="col-md-4" style="width : 20%" !important>
                    <div class="sidebar">
                        
                        <div class="author widget" style="background-color: #fff;border-radius: 10px; margin-bottom: 10px">
                            <img class="img-responsive" src="resources/images/profile_img.png.webp">
                            <div class="author-body text-center">
                                <div class="author-img">
                                   
                                    <%-- 여성인 경우 --%>
									<c:if test="${userInfo.user_gender eq '여'}">
									  <img src="resources/images/woman.png">
									</c:if>
									
									<%-- 남성인 경우 --%>
									<c:if test="${userInfo.user_gender eq '남'}">
									  <img src="resources/images/man.png">
									</c:if>
                                </div>
                                <div class="author-bio">
                                    <h4>${userInfo.user_name}</h4>
                                    <p>Discover the joy of a healthy, happy life!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                	
                </div>
                
               
                <div class="col-md-4" style="width: 50% !important;">
                <!-- ================================================================================== -->
                	<!--  <iframe src="${pageContext.request.contextPath}/addwrite_frame" width="100%" height="1000" frameborder="0" allowfullscreen></iframe>-->
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
				<!-- ================================================================================== -->
				</div>
                <!-- Sidebar -->
                <div class="col-md-4" style="width : 30%;" !important>
                    <div class="sidebar">
                        <div class="categories widget">
                            <h3 class="widget-head">Categories</h3>
                            <ul>
                                <li>
                                    <a href="#" onclick="filterByCategory('공지')">◼ 공지사항</a> <span class="badge">1</span>
                                    	
                                </li>
                                <li>
                                    <a href="">◼ 일반</a> <span class="badge">2</span>
                                </li>
                                
                                
                            </ul>
                        </div>

                        <div class="recent-post widget">
                            <h2>최근 게시물</h2>
                            <ul>
                                <li>
                                    <a href="#">${comlist[0].content}</a><br>
                                    <time><fmt:formatDate pattern="yyyy년 MM월 dd일 a h시 mm분" value="${comlist[0].input_date}" /></time>
                                </li>
                                <li>
                                    <a href="#">${comlist[1].content}</a><br>
                                    <time><fmt:formatDate pattern="yyyy년 MM월 dd일 a h시 mm분" value="${comlist[1].input_date}" /></time>
                                </li>
                                <li>
                                    <a href="#">${comlist[2].content}</a><br>
                                    <time><fmt:formatDate pattern="yyyy년 MM월 dd일 a h시 mm분" value="${comlist[2].input_date}" /></time>
                                   
                                </li>

                            </ul>

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