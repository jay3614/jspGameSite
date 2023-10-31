<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.game.video.Video"%>
<%@page import="com.game.video.VideoDAO"%>
<%@page import="com.game.notice.Notice"%>
<%@page import="com.game.notice.NoticeDAO"%>
<%@page import="com.game.event.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.game.event.EventDAO"%>
<html>
<head>
<title>Home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/owl Carousel/owl.carousel.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>

<body class="animsition">
<%
	String userID = null;

	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	
	EventDAO eventDAO = new EventDAO();
	ArrayList<Event> eventList = eventDAO.getList();
	
	NoticeDAO noticeDAO = new NoticeDAO();
	ArrayList<Notice> noticeList = noticeDAO.getNoticeList();
	ArrayList<Notice> updateList = noticeDAO.getUpdateList();
	ArrayList<Notice> noticeAfterSec = noticeDAO.getNoticeAfter();
	
	VideoDAO videoDAO = new VideoDAO();
	ArrayList<Video> videoList = videoDAO.getList();
%>

	<!-- Header -->
	<header class="header-v4">
		<div class="container-menu-desktop">
			<div class="top-bar">
				<div class="flex-sb-m h-full container">
					<div class="wrap-icon-header flex-w flex-l-m">
						<div
							class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart">
							<img class="top-menu" src="img/icons/menu.png" alt="IMG-LOGO">
						</div>
					</div>
					
					<div class="left-top-bar">
						<a href="https://github.com/jay3614/gameSite"><img src="img/icons/logo1.png" alt="IMG-LOGO"></a>
					</div>

					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m trans-04 p-lr-25"> LOG IN </a>
						<a href="#" class="flex-c-m trans-04 p-lr-25"> LOGOUT </a>
					</div>
				</div>
			</div>

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					<a href="/index" class="logo"> <img src="img/icons/logo1.png" alt="IMG-LOGO"></a>
					<div class="menu-desktop">
						<ul class="customMenu expanded">
							<li><a href="#">새소식</a>
								<ul class="sub-menu">
									<li><a href="#">공지사항</a></li>
									<li><a href="#">업데이트</a></li>
									<li><a href="#">이벤트</a></li>
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
	
	
	<!-- 본문 시작 -->
	<section class="eventSection bg0 p-t-50 p-b-20">
		<div class="container">
			<div>
				<div>
					<div>
						<div class="imgDiv">
							<a href="#"><img class="event-img" id="event-img" src="<%=eventList.get(0).getImage()  %>"></a>
						</div>
					
						<div class="wrap-slick2">
							<div class="slick2">
								<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
									<div class="block2">
										<div class="block2-txt flex-w flex-t p-t-14">
											<div class="block2-txt-child1 flex-col-l ">
											<%
												for(int i = 0; i < eventList.size(); i++) {
											%>
												<input class="eventImage" id="<%= eventList.get(i).getId() %>" type="hidden" value="<%= eventList.get(i).getImage() %>">
												<span
													class="event-title stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6" id="<%= eventList.get(i).getId() %>"
													 onclick="changeImg()">
													<%= eventList.get(i).getTitle() %>
												</span>
											<%
												}
											%>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="bg0 p-t-20 p-b-20 noticeSection">
		<div class="row notice">
			<div class="notice1">
				<p class="type">업데이트</p><br>
				<a class="title" href="#"><%= updateList.get(0).getTitle() %></a>
				<p class="content"><%= updateList.get(0).getContent() %></p>
			</div>
			
			<div class="notice2">
 				<p class="type"><%= noticeList.get(0).getTypes() %></p><br>
				<a class="title" href="#"><%= noticeList.get(0).getTitle() %></a>
				<p class="content"><%= noticeList.get(0).getContent() %></p>
			</div>
			
			<div class="notice3">
				<ul>
					<%
						for(int i = 0; i < noticeAfterSec.size(); i++) {
					%>
					<li>
						<span class="type">공지</span>
						<a class="title" href="#"><%= noticeAfterSec.get(i).getTitle() %></a>
					</li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
		
	</section>
	
	<section class="guide bg8 p-t-30 p-b-20">
		<div class="row guideSection">
			<div class="guide1">
				<p>자바스토리<br>게임정보</p>
				<a href="#"><img src="img/test/btn_off.png" alt="IMG-LOGO"></a>
			</div>
			
			<div class="guide2">
				<a href="#"><img src="img/test/banner1.png" alt="IMG-LOGO"></a>
			</div>
			
			<div class="guide3">
				<a href="#"><img src="img/test/banner2.png" alt="IMG-LOGO"></a>
			</div>
			
			<div class="guide4">
				<a href="#"><img src="img/test/banner3.png" alt="IMG-LOGO"></a>
			</div>
		</div>
	</section>

	<section class="media bg2 p-t-20 p-b-20">
		<div class="mediaSection">
			<h2>영상<img class="icon" src="img/icons/icon-plus.png" alt="plus button"></h2>
			
			<%
				for(int i = 0; i < videoList.size(); i++) {
			%>
			<div class="screenshot">
				<div class="bg0 media-video">
					<a href="#">
						<img th:src="'https://img.youtube.com/vi/' + <%= videoList.get(i).getYoutubeLink() %> + '/mqdefault.jpg'" alt="">
						<div class="flex-col-l">
							<span text="<%= videoList.get(i).getTitle() %>"></span>
							<span class="stext-105 cl3" text="<%= videoList.get(i).getWriter() %>"></span>
						</div>
					</a>
				</div>
			</div>
			<%
				}
			%>
			
			<h2>스크린샷<img class="icon" src="img/icons/icon-plus.png" alt="plus button"></h2>
			
			<!-- 스크린샷으로 고쳐야함 -->
			<%
				for(int i = 0; i < videoList.size(); i++) {
			%>
			<div class="screenshot">
				<div class="bg0 media-video">
					<a href="#">
						<img th:src="'https://img.youtube.com/vi/' + <%= videoList.get(i).getYoutubeLink() %> + '/mqdefault.jpg'" alt="">
						<div class="flex-col-l">
							<span text="<%= videoList.get(i).getTitle() %>"></span>
							<span class="stext-105 cl3" text="<%= videoList.get(i).getWriter() %>"></span>
						</div>
					</a>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</section>
	
	<!-- 본문 끝 -->
	
	
	<!-- Footer -->
	<footer class="bg3 p-t-65 p-b-32">
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
						<a href="https://github.com/jay3614/gameSite" target="_blank">
							<img src="img/icons/logo2.png" alt="COMPANY-LOGO">
						</a>
					</div>
				</div>
			</div>
		</div>
	</footer>


	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
		function changeImg() {
			
			var spanAll = document.querySelectorAll(".slick2 span");
			var span = event.target;
			
			var id = event.target.id;
			var src = $(event.currentTarget).closest(".block2").find("input[id='" + id + "']").val();
			
			document.getElementById("event-img").setAttribute("src", src);
			
			for (var spanElement of spanAll) {
				spanElement.style.textDecoration = "none";
			}
			span.style.textDecoration = "underline";
		}
	</script>
</body>
</html>