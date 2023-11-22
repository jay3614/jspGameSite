<!DOCTYPE html>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.game.event.Event"%>
<%@page import="com.game.event.EventDAO"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<title>eventDetail</title>
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
</head>

<body class="animsition">
<%
	int eventId = 0;
	
	if(request.getParameter("id") != null) {
		eventId = Integer.parseInt(request.getParameter("id"));
	}
	
	if(eventId == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'notice'");
		script.println("</script>");
	}
	
	// 공지 타입만 나오도록 수정 필요
	Event event = new EventDAO().getEvent(eventId);
	
	EventDAO eventDAO = new EventDAO();
	ArrayList<Event> noticeList = eventDAO.getEventList();
	
	Calendar cal = Calendar.getInstance();
    int nowYear = cal.get(Calendar.YEAR);
    int nowMonth = cal.get(Calendar.MONTH) + 1;
    int nowDay = cal.get(Calendar.DAY_OF_MONTH);
%>

	<jsp:include page="/WEB-INF/fragment/header.jsp" />
	
	<section class="bg0 p-t-40 p-b-20 flex-c d-flex">
		<div class="d-flex">
			<div class="m-w-930 p-b-80 m-r-30">
				<div class="row p-b-10 wrap-slick3">
					<ul class="test">
						<li class="float-l p-l-30"><a class="clblack" href="notice">공지사항</a></li>
						<li class="float-l p-l-30"><a class="clblack" href="update">업데이트</a></li>
						<li class="float-l p-l-30"><a class="clblack" href="event">이벤트</a></li>
					</ul>
					<span class="mnb_line" style="width: 60px; left: 210px;"></span>
				</div>
				<div class="p-l-30">
					<div class="customMenu p-t-30 p-b-30 bor18 flex-sb">
						<div>
							<h1>이벤트</h1>
						</div>
						<div class="custom_border">
							<span><a href="notice">목록</a></span>
						</div>
					</div>
					<p class="notice_detail_title">
						<img class="float-l m-r-7 m-t--4" src="../img/icons/notice_icon01.png"><span><%= event.getTitle() %></span>
					</p>
					<div class="notice_detail_time">
						<div class="flex-sb m-lr-27">
							<p class="float-l time_style"><img class="clock float-l" src="../img/icons/sub_date_new.png">
								<%= event.getEventRange()%>
							</p>
							<p class="float-l time_style"><img class="clock float-l" src="../img/icons/eye_new.png"><%= event.getViewCount() %></p>
						</div>
					</div>
					<div class="notice_detail_content">
						<p><%= event.getContent() %></p>
					</div>
					<!-- 댓글칸 예정 -->
					<div>
					
					</div>
					<!--  -->
				</div>
			</div>
			
			<jsp:include page="/WEB-INF/fragment/side.jsp"/>
			
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/fragment/footer.jsp"/>

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
		const ul = document.querySelector("ul.test");
		ul.addEventListener("mousemove", (event) => {
			const li = event.target.closest("li");
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
</body>
</html>