<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.game.video.VideoDAO"%>
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
<link rel="stylesheet" type="text/css" href="../css/util.css?after">
<link rel="stylesheet" type="text/css" href="../css/main.css?after">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
<link rel="stylesheet" type="text/css" href="../css/myCustom.css?after">
</head>

<body class="animsition">
<%
	String id = null;

	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}
	
	int pageNumber = 1;
	
	if(request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	NoticeDAO noticeDAO = new NoticeDAO();
	ArrayList<Notice> noticeList = noticeDAO.getNoticeList();
	ArrayList<Notice> updateList = noticeDAO.getUpdateList();
	ArrayList<Notice> noticeAfterSec = noticeDAO.getNoticeAfter();
	
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
						<a href="register.jsp" class="flex-c-m trans-04 p-lr-25">회원가입</a>
						<a href="login.jsp" class="flex-c-m trans-04 p-lr-25">로그인</a>
						<%
							}else {
						%>
						<a href="logoutAction.jsp" class="flex-c-m trans-04 p-lr-25">로그아웃</a>
						<%
							}
						%>
					</div>
				</div>
			</div>

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					<a href="/index" class="logo"> <img src="../img/icons/logo1.png" alt="IMG-LOGO"></a>
					<div class="menu-desktop">
						<ul class="customMenu expanded">
							<li><a href="#">새소식</a>
								<ul class="sub-menu">
									<li><a href="news/notice.jsp">공지사항</a></li>
									<li><a href="news/update.jsp">업데이트</a></li>
									<li><a href="news/event.jsp">이벤트</a></li>
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
	
	<section class="bg0 p-t-20 p-b-20">
		<div>
			<ul>
				<li class="float-l p-l-30"><a href="news/notice.jsp">공지사항</a></li>
				<li class="float-l p-l-30"><a href="news/update.jsp">업데이트</a></li>
				<li class="float-l p-l-30"><a href="news/event.jsp">이벤트</a></li>
			</ul>
		</div>
	</section>
	
	<section class="bg0 p-t-40 p-b-20">
		<div class="container">
			
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="customMenu p-b-30">
						<div class="col-lg-8">
							<h1>공지사항</h1>
						</div>
						<div class="col-lg-4">
							<div class="bor17 of-hidden pos-relative">
								<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55"
									type="text" name="search" placeholder="Search">
			
								<button
									class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
									<i class="zmdi zmdi-search"></i>
								</button>
							</div>
						</div>
					</div>
				
					<table class="table bor18">
						<tbody>
							<%
								ArrayList<Notice> list = noticeDAO.getNoticeList(pageNumber);
								for(int i = 0; i < list.size(); i++) {
									
							%>
							<tr>
								<td class="col-lg-9">
									<a class="clblack" href="noticeView.jsp?id=<%= list.get(i).getId() %>"><%= list.get(i).getTitle() %></a>
								</td>
								<td class="col-lg-3">
									<img class="float-l mt-1" src="../img/icons/sub_date_new.png" alt="시계 아이콘">&nbsp;
									<%
										int year = Integer.parseInt(list.get(i).getRegDate().substring(0, 4));
										int month = Integer.parseInt(list.get(i).getRegDate().substring(5, 7));
										int day = Integer.parseInt(list.get(i).getRegDate().substring(8, 10));
										if(year == nowYear && month == nowMonth && day == nowDay) {	// 현재날짜와 같다면 날짜가 아닌 시간 표시
									%>
									<%= list.get(i).getRegDate().substring(11, 16)%>
									<%
										}else {
									%>
									<%= list.get(i).getRegDate().substring(0, 10)%>
									<%
										}
									%>
								</td>
							</tr>
							<%
								}
							%>
							</tbody>
					</table>
					<!--  -->
					<div class="product__pagination">
						<div class="pagination h-100 justify-content-center align-items-center">
							<%
								if(pageNumber != 1) {
							%>
							<a class="custom-btn custom-btn-success" href="notice.jsp?pageNumber=<%= pageNumber - 1 %>">&lt;&lt;</a>
							<%
								}
							%>
							<%
								for(int i = 0; i < (noticeList.size() + 1) / 10 + 1; i++) {
							%>
								<a class="custom-btn custom-btn-success" href="notice.jsp?pageNumber=<%= i + 1 %>"><%= i + 1 %></a>
							<%
								}
							%>
							<%
								if(pageNumber == 1) {
							%>
							<a class="custom-btn custom-btn-success" href="notice.jsp?pageNumber=<%= pageNumber + 1 %>">&gt;&gt;</a>
							<%
								}
							%>
						</div>
					</div>
					<!--  -->
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
	<!-- <script>
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
	</script> -->
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