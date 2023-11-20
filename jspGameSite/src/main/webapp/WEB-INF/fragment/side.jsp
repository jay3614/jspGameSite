<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.game.event.Event"%>
<%@page import="com.game.event.EventDAO"%>
<%@page import="com.game.notice.Notice"%>
<%@page import="com.game.notice.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<title>Home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
</head>

<body class="animsition">
	<%
		NoticeDAO noticeDAO = new NoticeDAO();
		ArrayList<Notice> noticeList = noticeDAO.getNoticeList();
		
		EventDAO eventDAO = new EventDAO();
		ArrayList<Event> eventList = eventDAO.getBannerList();
		
		Calendar cal = Calendar.getInstance();
	    int nowYear = cal.get(Calendar.YEAR);
	    int nowMonth = cal.get(Calendar.MONTH) + 1;
	    int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	%>

	<div class="col-md-4 col-lg-3">
		<div class="p-t-25 m-t-8 side_board">
			<div class="flex-sb">
				<h4 class="mtext-112 cl2 p-b-20">뉴스</h4>
				<a href="../news/notice">
					<img src="../img/icons/side_plus_button.png">
				</a>
			</div>
			<div class="p-b-25">
				<ul>
					<%
						for(int i = 0; i < 4; i++) {
					%>
					<li class="stext-111 cl2 text-truncate hov-ul">
						<a>
							<span class="cl1">공지</span>
							<%= noticeList.get(i).getTitle() %>
						</a>
					</li>
					<%
						}
					%>
				</ul>
			</div>
			<div>
				<div class="swiper swiper2">
					<div class="swiper-wrapper">
						<%
							for(int i = 0; i < eventList.size(); i++) {
						%>
						<div class="swiper-slide">
							<a href="#"><img class="event-img" id="event-img" src="<%=eventList.get(i).getImage() %>" style="width: 285px; height: 120px"></a>
							<p class="text-truncate"><%= eventList.get(i).getTitle() %></p>
							<p><%= i + 1 %>/<%= eventList.size() %></p>
						</div>
						<%
							}
						%>
					</div>
					<div class="swiper-button-prev swiper-button-prev2"></div>
					<div class="swiper-button-next swiper-button-next2"></div>
				</div>
			</div>
		</div>
	</div>
	
	<!--===============================================================================================-->
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<!--===============================================================================================-->
	<script>
		const swiper = new Swiper('.swiper2', {
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