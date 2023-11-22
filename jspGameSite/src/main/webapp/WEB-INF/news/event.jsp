<!DOCTYPE html>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.game.event.Event"%>
<%@page import="com.game.event.EventDAO"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<title>event</title>
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
<link rel="stylesheet" type="text/css" href="../css/myCustom.css?after">
<!--===============================================================================================-->
</head>

<body class="animsition">
<%
	int pageNumber = 1;
	
	if(request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	EventDAO eventeDAO = new EventDAO();
	ArrayList<Event> eventList = eventeDAO.getEventList();
	
	Calendar cal = Calendar.getInstance();
    int nowYear = cal.get(Calendar.YEAR);
    int nowMonth = cal.get(Calendar.MONTH) + 1;
    int nowDay = cal.get(Calendar.DAY_OF_MONTH);
%>

	<jsp:include page="/WEB-INF/fragment/header.jsp" />
	
	<section class="bg0 p-t-40 p-b-20 flex-c d-flex">
		<div class="d-flex">
			<div class="m-w-1050 p-b-80 m-r-30">
				<div class="row p-b-10 wrap-slick3">
					<ul class="test">
						<li class="float-l p-l-30"><a class="clblack" href="notice">공지사항</a></li>
						<li class="float-l p-l-30"><a class="clblack" href="update">업데이트</a></li>
						<li class="float-l p-l-30"><a class="clblack" href="event">이벤트</a></li>
					</ul>
					<span class="mnb_line" style="width: 45px; left: 210px;"></span>
				</div>
				<div class="customMenu p-t-30 p-b-30 bor18">
					<div class="m-w-620">
						<h1>이벤트</h1>
					</div>
					<div class="m-w-310">
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
				
				<!--  -->
				<div class="d-flex flex-w p-l-30">
					<%
						for(int i = 0; i < eventList.size(); i++) {
					%>
					<div class="m-r-30 m-t-30 event-div">
						<div class="bg0">
							<div class="flex-col-l txt-center">
								<a href="eventDetail?id=<%= eventList.get(i).getId() %>">
									<img src="<%= eventList.get(i).getImage() %>" style="width: 285px; height: 120px" alt="">
								</a>
							</div>
							<div class="m-tb-10 txt-center">
								<a class="cl2" href="eventDetail?id=<%= eventList.get(i).getId() %>">
									<%= eventList.get(i).getTitle() %>
								</a>
							</div>
							<div class="d-flex flex-c event-div2">
								<p class="cl9 m-t-15 fs-12">
									<img class="float-l m-t-1" src="../img/icons/date_icon_new.png">&nbsp;&nbsp;<%= eventList.get(i).getEventRange() %>
								</p>
							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>
				<!--  -->
				
				<div class="product__pagination">
					<div class="pagination h-100 justify-content-center align-items-center">
						<%
							if(pageNumber != 1) {
						%>
						<a class="custom-btn custom-btn-success" href="event?pageNumber=<%= pageNumber - 1 %>">&lt;&lt;</a>
						<%
							}
						%>
						<%
							for(int i = 0; i < (eventList.size() + 1) / 10 + 1; i++) {
						%>
							<a class="custom-btn custom-btn-success" href="event?pageNumber=<%= i + 1 %>"><%= i + 1 %></a>
						<%
							}
						%>
						<%
							if(pageNumber == 1) {
						%>
						<a class="custom-btn custom-btn-success" href="event?pageNumber=<%= pageNumber + 1 %>">&gt;&gt;</a>
						<%
							}
						%>
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