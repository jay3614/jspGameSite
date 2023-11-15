<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.game.notice.Notice"%>
<%@page import="com.game.notice.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<title>Home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../vendor/owl Carousel/owl.carousel.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../css/util.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" type="text/css" href="../css/myCustom.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
</head>

<body class="animsition">
<%
	String id = null;

	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}
	
	int noticeId = 0;
	
	if(request.getParameter("id") != null) {
		noticeId = Integer.parseInt(request.getParameter("id"));
	}
	
	if(noticeId == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'notice'");
		script.println("</script>");
	}
	
	Notice notice = new NoticeDAO().getNotice(noticeId);
	Notice noticePrev = new NoticeDAO().getNotice(noticeId + 1);	// 이전글
	Notice noticeNext = new NoticeDAO().getNotice(noticeId - 1);	// 다음글
	
	// 아직 미사용
	NoticeDAO noticeDAO = new NoticeDAO();
	ArrayList<Notice> noticeList = noticeDAO.getNoticeList();
	//
	
	Calendar cal = Calendar.getInstance();
    int nowYear = cal.get(Calendar.YEAR);
    int nowMonth = cal.get(Calendar.MONTH) + 1;
    int nowDay = cal.get(Calendar.DAY_OF_MONTH);
%>

	<!-- Header -->
	<header class="header-v4">
		<div class="container-menu-desktop">
			<div class="top-bar">
				<div class="flex-sb-m h-full container">
					<div class="wrap-icon-header flex-w flex-l-m">
						<div
							class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart">
							<img class="top-menu" src="../img/icons/menu.png" alt="IMG-LOGO">
						</div>
					</div>
					
					<div class="left-top-bar">
						<a href="https://github.com/jay3614/jspGameSite"><img src="../img/icons/logo1.png" alt="IMG-LOGO"></a>
					</div>

					<div class="right-top-bar flex-w h-full">
						<%
							if(id == null) {
						%>
						<a href="../register" class="flex-c-m trans-04 p-lr-25">회원가입</a>
						<a href="../login" class="flex-c-m trans-04 p-lr-25">로그인</a>
						<%
							}else {
						%>
						<a href="../logoutAction.jsp" class="flex-c-m trans-04 p-lr-25">로그아웃</a>
						<%
							}
						%>
					</div>
				</div>
			</div>

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					<a href="../index" class="logo"> <img src="../img/icons/logo1.png" alt="IMG-LOGO"></a>
					<div class="menu-desktop">
						<ul class="customMenu expanded">
							<li><a href="notice">새소식</a>
								<ul class="sub-menu">
									<li><a href="notice">공지사항</a></li>
									<li><a href="update">업데이트</a></li>
									<li><a href="event">이벤트</a></li>
								</ul>
							</li>
							<li><a href="#">가이드</a>
								<ul class="sub-menu">
									<li><a href="#">게임정보</a></li>
									<li><a href="#">직업소개</a></li>
								</ul>
							</li>
							<li><a href="#">커뮤니티</a>
								<ul class="sub-menu">
									<li><a href="#">자유게시판</a></li>
									<li><a href="#">팬아트</a></li>
									<li><a href="#">커스터마이징 자랑</a></li>
								</ul>
							</li>
							<li><a href="#">미디어</a>
								<ul class="sub-menu">
									<li><a href="#">영상</a></li>
									<li><a href="#">스크린샷</a></li>
								</ul>
							</li>
							<li><a href="#">고객센터</a>
								<ul class="sub-menu">
									<li><a href="#">도움말/1:1문의</a></li>
									<li><a href="#">버그악용/불법프로그램 신고</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</header>

	<!-- 게임목록 메뉴 -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<div
					class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="header-cart-content flex-w js-pscroll">
				<p>빈칸 채우기용 글자1111111111</p>
				<p>빈칸 채우기용 글자1111111111</p>
				<p>빈칸 채우기용 글자1111111111</p>
				<p>빈칸 채우기용 글자1111111111</p>
				<p>빈칸 채우기용 글자1111111111</p>
				<p>빈칸 채우기용 글자1111111111</p>
				<p>빈칸 채우기용 글자1111111111</p>
				<p>빈칸 채우기용 글자1111111111</p>
				<p>빈칸 채우기용 글자1111111111</p>
				<p>빈칸 채우기용 글자1111111111</p>
				<p>빈칸 채우기용 글자1111111111</p>
			</div>
		</div>
	</div>
	<!-- 게임목록 메뉴 끝 -->
	
	
	<section class="bg0 p-t-40 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="row p-b-10 wrap-slick3">
						<ul class="test">
							<li class="float-l p-l-30"><a class="clblack" href="notice">공지사항</a></li>
							<li class="float-l p-l-30"><a class="clblack" href="update">업데이트</a></li>
							<li class="float-l p-l-30"><a class="clblack" href="event">이벤트</a></li>
						</ul>
						<span class="mnb_line" style="width: 60px; left: 30px;"></span>
					</div>
					<div class="test123">
						<div class="customMenu p-t-30 p-b-30 bor18 custom_div">
							<div class="">
								<h1>공지사항</h1>
							</div>
							<div class="custom_border">
								<span class=""><a href="notice" class="">목록</a></span>
							</div>
						</div>
						<p class="notice_detail_title">
							<img class="float-l m-r-7 m-t--4" src="../img/icons/notice_icon01.png"><span class=""><%= notice.getTitle() %></span>
						</p>
						<div class="notice_detail_time">
							<div class="float-r">
								<p class="float-l time_style"><img class="clock float-l" src="../img/icons/eye_new.png"><%= notice.getViewCount() %></p>
								<p class="float-l time_style"><img class="clock float-l" src="../img/icons/sub_date_new.png">
									<%
										int year = Integer.parseInt(notice.getDate().substring(0, 4));
										int month = Integer.parseInt(notice.getDate().substring(5, 7));
										int day = Integer.parseInt(notice.getDate().substring(8, 10));
										if(year == nowYear && month == nowMonth && day == nowDay) {
									%>
									<%= notice.getDate().substring(11, 16)%>
									<%
										}else {
									%>
									<%= notice.getDate().substring(0, 10)%>
									<%
										}
									%>
								</p>
							</div>
						</div>
						<div class="notice_detail_content">
							<p><%= notice.getContent() %></p>
						</div>
						<div class="notice_detail_pageMove">
							<ul>
								<li>
									<%
										if(noticePrev == null) {	// noticeId의 이전글이 없다면
									%>
									<p class="page_move_btn">
										<img class="clock3 float-l" src="../img/icons/page_up.png">이전글
									</p>
									<p class="float-l">
										이전글이 없습니다.
									</p>
									<%
										}else {	// noticeId의 이전글이 있다면
									%>
									<a class="page_move_btn" href="noticeDetail?id=<%= noticePrev.getId() %>">
										<img class="clock3 float-l" src="../img/icons/page_up.png">이전글
									</a>
									<a class="float-l" href="noticeDetail?id=<%= noticePrev.getId() %>">
										<%= noticePrev.getTitle() %>
									</a>
									<p class="fs-12 time_style float-r"><img class="clock2 float-l" src="../img/icons/sub_date_new.png">
										<%
										int yearP = Integer.parseInt(noticePrev.getDate().substring(0, 4));
										int monthP = Integer.parseInt(noticePrev.getDate().substring(5, 7));
										int dayP = Integer.parseInt(noticePrev.getDate().substring(8, 10));
										if(yearP == nowYear && monthP == nowMonth && dayP == nowDay) {
										%>
										<%= noticePrev.getDate().substring(11, 16)%>
										<%
											}else {
										%>
										<%= noticePrev.getDate().substring(0, 10)%>
										<%
											}
										%>
									</p>
									<%
										}
									%>
								</li>
								<li>
									<%
										if(noticeNext == null) {	// noticeId의 다음글이 없다면
									%>
									<p class="page_move_btn">
										<img class="clock3 float-l" src="../img/icons/page_down.png">다음글
									</p>
									<p class="float-l">
										다음글이 없습니다.
									</p>
									<%
										}else {	// noticeId의 이전글이 있다면
									%>
									<p class="page_move_btn">
										<a href="noticeDetail?id=<%= noticeNext.getId() %>">
											<img class="clock3 float-l" src="../img/icons/page_down.png">다음글
										</a>
									</p>
									<a class="float-l" href="noticeDetail?id=<%= noticeNext.getId() %>">
										<%= noticeNext.getTitle() %>
									</a>
									<p class="fs-12 time_style float-r"><img class="clock2 float-l" src="../img/icons/sub_date_new.png">
										<%
										int yearN = Integer.parseInt(noticeNext.getDate().substring(0, 4));
										int monthN = Integer.parseInt(noticeNext.getDate().substring(5, 7));
										int dayN = Integer.parseInt(noticeNext.getDate().substring(8, 10));
										if(yearN == nowYear && monthN == nowMonth && dayN == nowDay) {
										%>
										<%= noticeNext.getDate().substring(11, 16)%>
										<%
											}else {
										%>
										<%= noticeNext.getDate().substring(0, 10)%>
										<%
											}
										%>
									</p>
									<%
										}
									%>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-lg-3">
					<div class="side-menu">
						<div class="p-t-55 m-t-8">
							<h4 class="mtext-112 cl2 p-b-33">Categories</h4>
							<ul>
								<li class="bor18"><a href="#"
									class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-15 p-lr-4">
										Notice</a>
								</li>
								<li class="bor18"><a href="#"
									class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-15 p-lr-4">
										Review</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<!-- Footer -->
	<footer class="bg3 p-t-65 p-b-75">
		<div class="container">
			<div>
				<div class="footer_info">
					<ul>
						<li>
							<a href="#">회사소개</a>
						</li>
						<li>
							<a href="#">채용안내</a>
						</li>
						<li>
							<a href="#">이용약관</a>
						</li>
						<li>
							<a href="#">게임이용등급안내</a>
						</li>
						<li>
							<a href="#">개인정보처리방침</a>
						</li>
						<li>
							<a href="#">청소년보호정책</a>
						</li>
						<li>
							<a href="#">운영정책</a>
						</li>
						<li>
							<a href="#">사이트맵</a>
						</li>
					</ul>
				</div>
				<div class="footer_info">
					<p class="stext-107 cl7 ">
						<br>고객센터<a href="tel:031-123-1234" style="color: white;">
							031-123-1234</a>
						운영시간 평일 11:00 - 18:00 (토∙일, 공휴일 휴무) 점심시간 평일
						13:00 - 14:00 <b>1:1 문의하기는 게시판을 이용해 주세요</b>
					</p>
					<p>SpringBoot personal project All Rights Reserved</p>
					<div class="p-t-27">
						<a href="https://github.com/jay3614/jspGameSite" target="_blank">
							<img src="../img/icons/logo2.png" alt="COMPANY-LOGO">
						</a>
					</div>
				</div>
			</div>
		</div>
	</footer>


	<!--===============================================================================================-->
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<!--===============================================================================================-->
	<script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="../vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="../vendor/bootstrap/js/popper.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="../vendor/daterangepicker/moment.min.js"></script>
	<script src="../vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="../vendor/slick/slick.min.js"></script>
	<script src="../js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script src="../vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="../js/main.js"></script>
	<!--===============================================================================================-->
	<script src="../vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script>
		// 마우스 이벤트 리스너 등록
		const ul = document.querySelector("ul.test");
		ul.addEventListener("mousemove", (event) => {
			// 마우스가 올라가있는 <li> 요소 가져오기
			const li = event.target.closest("li");
		
			// <span>의 left 값 설정
			const span = document.querySelector(".mnb_line");
			
			if(li.textContent === "업데이트") {
				span.style.left = li.offsetLeft + 30 + "px";
				span.style.width = 60 + "px";
			}else if(li.textContent === "이벤트") {
				span.style.left = li.offsetLeft + 30 + "px";
				span.style.width = 45 + "px";
			}else if(li.textContent === "공지사항") {
				span.style.left = li.offsetLeft + 30 + "px";
				span.style.width = 60 + "px";
			}
			
		});
	</script>
	<!--===============================================================================================-->
	<script>
		const swiper = new Swiper('.swiper', {
			loop: true,
			
			pagination: {
				el: '.swiper-pagination',
			},
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			}
		});
	</script>
</body>
</html>