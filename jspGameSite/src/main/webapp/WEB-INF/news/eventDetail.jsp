<!DOCTYPE html>
<%@page import="com.game.member.Member"%>
<%@page import="com.game.member.MemberDAO"%>
<%@page import="java.io.PrintWriter"%>
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
	String id = null;

	id = (String)session.getAttribute("id");

	MemberDAO memberDAO = new MemberDAO();
	Member member = memberDAO.getMember(id);
	
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
	
	Event event = new EventDAO().getEvent(eventId);
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
					<div class="reply_wrap">
						<div class="reply_title">
							<h2>
							댓글<span>리플수123</span>	<!-- replyList.size() -->
							</h2>
						</div>
						<ul class="reply_ul">
							<%
								for(int i = 0; i < 6; i++){	// replyList.size()
							%>
							<li>
								<div class="reply">
									<p>
										<span class="reply_id">아이디</span>
										<span class="reply_time">작성일 2023.11.22</span>
									</p>
									<p class="reply_text">댓글 내용</p>
								</div>
							</li>
							<%
								}
							%>
						</ul>
					</div>
					<div class="reply_page">
						<a class="" href="#"><img src="../img/icons/reply_prev.png"></a>
						
						<%
							for(int i = 1; i <= 91 / 10 + 1; i++) {	// replyList.size()
						%>
						<a class="" href="#"><%= i %></a>
						<%
							}
						%>
						<a class="" href="#"><img src="../img/icons/reply_next.png"></a>
					</div>
					<div class="comment_form_wrap">
						<div class="comment_form">
							<form method="post" action="${pageContext.request.contextPath}/commentAction" id="comment-form">
								<%
									if(id == null) {
										
									}else {
								%>
								<input type="hidden" name="replyer" value="<%= member.getNickname() %>">
								<%
									}
								%>
								<textarea class="comment" name="comment" rows="10" cols="30" maxlength="200"></textarea>
								<div class="comment_btn">
									<div class="float-r m-r-9">
										<div class="word_count float-l">
											<span>(</span>
											<span class="commentCount">0</span>
											<span>/200)</span>
										</div>
										<button class="btn01_g" type="submit">등록</button>
									</div>
								</div>
								
							</form>
						</div>
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
	<!--===============================================================================================-->
	<script>
	$('.comment').keyup(function (e) {
		let comment = $(this).val();
		
		// 글자수 세기
		if (comment.length == 0 || comment == '') {
			$('.commentCount').text('0');
		} else {
			$('.commentCount').text(comment.length);
		}
	});
	</script>
</body>
</html>