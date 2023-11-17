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
<link rel="stylesheet" type="text/css" href="css/myCustom.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
</head>

<body class="animsition">
	<%
		EventDAO eventDAO = new EventDAO();
		ArrayList<Event> eventList = eventDAO.getBannerList();
		
		NoticeDAO noticeDAO = new NoticeDAO();
		ArrayList<Notice> noticeList = noticeDAO.getNoticeList();
		ArrayList<Notice> updateList = noticeDAO.getUpdateList();
		ArrayList<Notice> noticeAfterSec = noticeDAO.getNoticeAfter();
		
		VideoDAO videoDAO = new VideoDAO();
		ArrayList<Video> videoList = videoDAO.getList();
	%>

	<jsp:include page="/WEB-INF/fragment/header.jsp" />
	
	<!-- 본문 시작 -->
	<section class="eventSection bg0 p-t-50 p-b-20">
		<div class="container">
			<div>
				<div>
					<div>
						<div class="swiper">
							<div class="swiper-wrapper">
								<%
									for(int i = 0; i < eventList.size(); i++) {
								%>
								<div class="swiper-slide">
									<a href="#"><img class="event-img" id="event-img" src="<%=eventList.get(i).getImage() %>"></a>
								</div>
								<%
									}
								%>
							</div>
							<div class="swiper-pagination"></div>
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="bg0 p-t-20 p-b-20 noticeSection">
		<div class="row notice">
			<div class="notice1">
				<p class="type"><%= updateList.get(0).getTypes() %></p><br>
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

	<!-- 미디어 섹션 -->
	<section class="media bg2 p-t-20 p-b-20">
		<div class="mediaSection">
			<h2>영상<img class="icon" src="img/icons/icon-plus.png" alt="plus button"></h2>
			
			<%
				for(int i = 0; i < videoList.size(); i++) {
			%>
			<div class="screenshot">
				<div class="bg0 media-video">
					<div class="flex-col-l">
						<a href="#">
							<img src="https://img.youtube.com/vi/<%= videoList.get(i).getYoutubeLink() %>/mqdefault.jpg" alt="">
							<span><%= videoList.get(i).getTitle() %></span><br>
							<span class="stext-105 cl3">작성자: <%= videoList.get(i).getWriter() %></span>
						</a>
						<p>조회수: <%= videoList.get(i).getViewCount() %></p>
						<p>업로드: <%= videoList.get(i).getDate() %></p>
					</div>
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
					<div class="flex-col-l">
						<a href="#">
							<img src="https://img.youtube.com/vi/<%= videoList.get(i).getYoutubeLink() %>/mqdefault.jpg" alt="">
							<span><%= videoList.get(i).getTitle() %></span><br>
							<span class="stext-105 cl3">작성자: <%= videoList.get(i).getWriter() %></span>
						</a>
						<p>조회수: <%= videoList.get(i).getViewCount() %></p>
						<p>업로드: <%= videoList.get(i).getDate() %></p>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/fragment/footer.jsp"/>
	
	<!--===============================================================================================-->
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
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