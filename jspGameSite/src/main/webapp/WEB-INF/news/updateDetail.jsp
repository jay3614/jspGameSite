<!DOCTYPE html>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.game.notice.Notice"%>
<%@page import="com.game.notice.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<title>updateDetail</title>
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
	int updateId = 0;
	
	if(request.getParameter("id") != null) {
		updateId = Integer.parseInt(request.getParameter("id"));
	}
	
	if(updateId == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'notice'");
		script.println("</script>");
	}
	
	// 업데이트 타입만 나오게 수정 필요
	Notice update = new NoticeDAO().getNotice(updateId);
	Notice updatePrev = new NoticeDAO().getNotice(updateId + 1);
	Notice updateNext = new NoticeDAO().getNotice(updateId - 1);
	
	NoticeDAO noticeDAO = new NoticeDAO();
	ArrayList<Notice> noticeList = noticeDAO.getUpdateList();
	
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
					<span class="mnb_line" style="width: 60px; left: 107px;"></span>
				</div>
				<div class="p-l-30">
					<div class="customMenu p-t-30 p-b-30 bor18 flex-sb">
						<div>
							<h1>업데이트</h1>
						</div>
						<div class="custom_border">
							<span><a href="notice">목록</a></span>
						</div>
					</div>
					<p class="notice_detail_title"><%= update.getTitle() %>
					</p>
					<div class="notice_detail_time">
						<div class="float-r">
							<p class="float-l time_style"><img class="clock float-l" src="../img/icons/eye_new.png"><%= update.getViewCount() %></p>
							<p class="float-l time_style"><img class="clock float-l" src="../img/icons/sub_date_new.png">
								<%
									int year = Integer.parseInt(update.getDate().substring(0, 4));
									int month = Integer.parseInt(update.getDate().substring(5, 7));
									int day = Integer.parseInt(update.getDate().substring(8, 10));
									if(year == nowYear && month == nowMonth && day == nowDay) {
								%>
								<%= update.getDate().substring(11, 16)%>
								<%
									}else {
								%>
								<%= update.getDate().substring(0, 10)%>
								<%
									}
								%>
							</p>
						</div>
					</div>
					<div class="notice_detail_content">
						<p><%= update.getContent() %></p>
					</div>
					<div class="notice_detail_pageMove">
						<ul>
							<li>
								<%
									if(updatePrev == null) {
								%>
								<p class="page_move_btn">
									<img class="clock3 float-l" src="../img/icons/page_up.png">이전글
								</p>
								<p class="float-l">
									이전글이 없습니다.
								</p>
								<%
									}else {
								%>
								<a class="page_move_btn" href="updateDetail?id=<%= updatePrev.getId() %>">
									<img class="clock3 float-l" src="../img/icons/page_up.png">이전글
								</a>
								<a class="float-l" href="updateDetail?id=<%= updatePrev.getId() %>">
									<%= updatePrev.getTitle() %>
								</a>
								<p class="fs-12 time_style float-r"><img class="clock2 float-l" src="../img/icons/sub_date_new.png">
									<%
									int yearP = Integer.parseInt(updatePrev.getDate().substring(0, 4));
									int monthP = Integer.parseInt(updatePrev.getDate().substring(5, 7));
									int dayP = Integer.parseInt(updatePrev.getDate().substring(8, 10));
									if(yearP == nowYear && monthP == nowMonth && dayP == nowDay) {
									%>
									<%= updatePrev.getDate().substring(11, 16)%>
									<%
										}else {
									%>
									<%= updatePrev.getDate().substring(0, 10)%>
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
									if(updateNext == null) {	// noticeId의 다음글이 없다면
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
									<a href="updateDetail?id=<%= updateNext.getId() %>">
										<img class="clock3 float-l" src="../img/icons/page_down.png">다음글
									</a>
								</p>
								<a class="float-l" href="updateDetail?id=<%= updateNext.getId() %>">
									<%= updateNext.getTitle() %>
								</a>
								<p class="fs-12 time_style float-r"><img class="clock2 float-l" src="../img/icons/sub_date_new.png">
									<%
									int yearN = Integer.parseInt(updateNext.getDate().substring(0, 4));
									int monthN = Integer.parseInt(updateNext.getDate().substring(5, 7));
									int dayN = Integer.parseInt(updateNext.getDate().substring(8, 10));
									if(yearN == nowYear && monthN == nowMonth && dayN == nowDay) {
									%>
									<%= updateNext.getDate().substring(11, 16)%>
									<%
										}else {
									%>
									<%= updateNext.getDate().substring(0, 10)%>
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
				span.style.left = li.offsetLeft + 25 + "px";
				span.style.width = 60 + "px";
			}else if(li.textContent === "이벤트") {
				span.style.left = li.offsetLeft + 27 + "px";
				span.style.width = 45 + "px";
			}else if(li.textContent === "공지사항") {
				span.style.left = li.offsetLeft + 25 + "px";
				span.style.width = 60 + "px";
			}
		});
	</script>
</body>
</html>