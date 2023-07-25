<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/plugins/admin/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/plugins/admin/fontawesome-all.css">
<link rel="stylesheet" href="resources/plugins/admin/Admin.css">
</style>

<title>ECG 서비스 사용 현황</title>
</head>

<body>
	<!-- main wrapper -->
	<div class="dashboard-main-wrapper">
		<!-- navbar -->
		<div class="dashboard-header">
			<!-- 로고 들어가는 부분-->
			<nav class="navbar navbar-expand-lg bg-white fixed-top">
				<a class="navbar-brand" href="main_ECG.html">HearTrack</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<!-- 네비바 나머지 부분-->
				<div class="collapse navbar-collapse " id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto navbar-right-top">
						<!-- 전체화면 보기 버튼 -->
						<a href="#" class="fullscreen btn-rounded btn-primary btn-sm"
							onclick="openFullScreenMode()" style="margin-right: 20px;">
							전체화면</a>
						<a href="#"
							class="close-fullscreen btn btn-rounded btn-primary btn-sm"
							onclick="closeFullScreenMode()" style="margin-right: 20px;">
							되돌리기</a>
						<!-- 공유 버튼 -->
						<a class="navbtn btn-info nav-link nav-user-img " href="#"
							id="navbarDropdownMenuLink2" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"
							style="margin-right: 30px;"> 페이지 공유</a>
						<div
							class="bavbtn dropdown-menu dropdown-menu-right nav-user-dropdown"
							aria-labelledby="navbarDropdownMenuLink2">
							<a id="capture" class="dropdown-item" href="#">화면 캡쳐</a> <a
								class="dropdown-item" href="#">XML</a> <a class="dropdown-item"
								href="#">PDF</a>
						</div>
					</ul>
				</div>
			</nav>
		</div>
		<!-- end navbar -->

		<!-- left sidebar -->
		<div class="nav-left-sidebar sidebar-dark">
			<div class="menu-list">
				<nav class="navbar navbar-expand-lg navbar-light">
					<a class="d-xl-none d-lg-none" href="#"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarNav" aria-controls="navbarNav"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav flex-column">
							<li class="nav-divider">Menu</li>
							<li class="nav-item "><a class="nav-link active"
								href="adminEcg"> <i class="fas fa-heartbeat"></i>ECG 서비스
									사용현황 <span class="badge badge-success">1</span>
							</a></li>
							<li class="nav-item "><a class="nav-link " href="adminUser">
									<i class="fas fa-chart-pie"></i>회원 관리 <span
									class="badge badge-success">2</span>
							</a></li>
							<li class="nav-item "><a class="nav-link " href="index">
									<!-- 메인서비스 페이지 url 달아주기--> <i class="fas fa-share-square"></i>서비스
									페이지로 <span class="badge badge-success">3</span>
							</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<!-- end left sidebar -->

		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="dashboard-wrapper">
			<div class="container-fluid  dashboard-content">
				<div class="row">
					<!--  zoom chart  -->
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">Deep 분석 시간</h5>
							<div class="card-body">
								<div id="c3chart_zoom"></div>
							</div>
						</div>
					</div>
					<!--  end zoom chart  -->

					<!-- pie chart  -->
					<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">분류불가 데이터의 비중</h5>
							<div class="card-body">
								<div id="c3chart_pie1"></div>
							</div>
						</div>
					</div>
					<!-- end pie chart  -->

					<!-- pie chart  -->
					<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">Deep 분석 오류 유형</h5>
							<div class="card-body">
								<div id="c3chart_pie2"></div>
							</div>
						</div>
					</div>
					<!-- end pie chart  -->
				</div>
				<!-- 첫번째 줄 끝나는 부분-->

				<!-- 두번째 줄 시작-->
				<div class="row d-flex align-items-center">
					<!-- dount chart  -->
					<div class="col-xl-6 col-lg-10 col-md-6 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">측정 결과</h5>
							<div class="card-body">
								<div id="c3chart_donut"></div>
							</div>
						</div>
					</div>

					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">혈압/혈당 검사 이용자</h5>
							<div class="card-body">
								<div id="c3chart_combine"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- end dount chart  -->
				<div class="row d-flex align-items-center">
					<!-- top selling products  -->
					<div class="col-xl-6 col-lg-10 col-md-12 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">DeepECG분석 시간</h5>
							<div class="card-body p-0">
								<div class="table-responsive">
									<table class="table">
										<thead class="bg-light">
											<tr class="border-0">
												<th class="border-0">DeepECG모델 버전</th>
												<th class="border-0">최소 / MIN</th>
												<th class="border-0">평균 / Average</th>
												<th class="border-0">중간 / Median</th>
												<th class="border-0">최대 / MAX</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td id="pyVersion">1.1.0.10(python)</td>
												<td id="minTime">0.606/sec</td>
												<td id="avgTime">0.808/sec</td>
												<td id="middleTime">0.973/sec</td>
												<td id="maxTime">1.997/sec</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-10 col-md-12 col-sm-12 col-12">
						<div class="row">
							<div class="col-12">
								<div class="card-group">
									<div class="card h-100">
										<!-- 카드의 높이를 h-100으로 지정하여 높이 맞춤 -->
										<div class="card-body">
											<c:forEach items="${ecgList}" var="list">
												<h5 class="text-muted">전체 측정 건수</h5>
												<div class="metric-value">
													<h1 id="ecgAll" class="mb-1">${list.useAll}건</h1>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="card h-100">
										<!-- 카드의 높이를 h-100으로 지정하여 높이 맞춤 -->
										<div class="card-body">
											<c:forEach items="${ecgList}" var="list">
												<h5 class="text-muted">심전도 측정 사용자 수</h5>
												<div class="metric-value">
													<h1 id="useEcg" class="mb-1">${list.useUser}명</h1>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="card h-100">
										<!-- 카드의 높이를 h-100으로 지정하여 높이 맞춤 -->
										<div class="card-body">
											<c:forEach items="${ecgList}" var="list">
												<h5 class="text-muted">1인당 평균 측정 수</h5>
												<div class="metric-value">
													<h1 id="useAvg" class="mb-1">${list.useAvg}회</h1>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>



				<!-- 두번쨰 줄 끝  -->
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- end footer -->
		<!-- ============================================================== -->
	</div>
	</div>
	<!-- 화면 캡처 기능 구현할려고 불러온 js -->
	<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.2/FileSaver.min.js"></script>
	<script src="resources/plugins/admin/capture.js"></script>
	<!-- 파일 안에 있는 jquery파일로 ajax문 실행에 오류가 발생해서 웹으로 받아옴 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="resources/plugins/admin/bootstrap.bundle.js"></script>
	<script src="resources/plugins/admin/jquery.slimscroll.js"></script>
	<script src="resources/plugins/admin/main-js.js"></script>

	<!-- c3 chart 라이브러리-->
	<script src="resources/plugins/admin/c3.min.js"></script>
	<script src="resources/plugins/admin/d3-5.4.0.min.js"></script>
	<script src="resources/plugins/admin/C3chartjs.js"></script>


</body>

</html>