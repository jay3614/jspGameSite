<!DOCTYPE html>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.game.notice.Notice"%>
<%@page import="com.game.notice.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<title>notice</title>
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
	ArrayList<Notice> updateList = noticeDAO.getUpdateList();
	ArrayList<Notice> list = noticeDAO.getUpdateList(pageNumber);
	
	Calendar cal = Calendar.getInstance();
    int nowYear = cal.get(Calendar.YEAR);
    int nowMonth = cal.get(Calendar.MONTH) + 1;
    int nowDay = cal.get(Calendar.DAY_OF_MONTH);
%>

	<jsp:include page="/WEB-INF/fragment/header.jsp" />	
	
	<section class="bg0 p-t-40 p-b-20">
		<div class="d-flex">
			<div class="d-flex m-auto">
				<div class="m-w-930 p-b-80 m-r-30">
					<div class="row p-b-10 wrap-slick3">
						<ul class="test">
							<li class="float-l p-l-30"><a class="clblack" href="notice">공지사항</a></li>
							<li class="float-l p-l-30"><a class="clblack" href="update">업데이트</a></li>
							<li class="float-l p-l-30"><a class="clblack" href="event">이벤트</a></li>
						</ul>
						<span class="mnb_line" style="width: 60px; left: 107px;"></span>
					</div>
					<div class="customMenu p-t-30 p-b-30 bor18">
						<div class="m-w-620">
							<h1>업데이트</h1>
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
				
					<table class="table bor18">
						<tbody>
							<%
								for(int i = 0; i < list.size(); i++) {
							%>
							<tr class="txt-middle">
								<td class="m-w-800">
									<a class="clblack" href="updateDetail?id=<%= list.get(i).getId() %>"><%= list.get(i).getTitle() %></a>
								</td>
								<td class="m-w-130">
									<img class="float-l m-t-5" src="../img/icons/sub_date_new.png" alt="시계 아이콘">&nbsp;
									<%
										int year = Integer.parseInt(list.get(i).getDate().substring(0, 4));
										int month = Integer.parseInt(list.get(i).getDate().substring(5, 7));
										int day = Integer.parseInt(list.get(i).getDate().substring(8, 10));
										if(year == nowYear && month == nowMonth && day == nowDay) {
									%>
									<%= list.get(i).getDate().substring(11, 16)%>
									<%
										}else {
									%>
									<%= list.get(i).getDate().substring(0, 10)%>
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
					<div class="product__pagination">
						<div class="pagination h-100 justify-content-center align-items-center">
							<%
								if(pageNumber != 1) {
							%>
							<a class="custom-btn custom-btn-success" href="update?pageNumber=<%= pageNumber - 1 %>">&lt;&lt;</a>
							<%
								}
							%>
							<%
								for(int i = 1; i <= updateList.size() / 10 + 1; i++) {
							%>
								<a class="custom-btn custom-btn-success" href="update?pageNumber=<%= i %>"><%= i %></a>
							<%
								}
							%>
							<%
								if(pageNumber == 1) {
							%>
							<a class="custom-btn custom-btn-success" href="update?pageNumber=<%= pageNumber + 1 %>">&gt;&gt;</a>
							<%
								}
							%>
						</div>
					</div>
				</div>
				
				<jsp:include page="/WEB-INF/fragment/side.jsp"/>
				
			</div>
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