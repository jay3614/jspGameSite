<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>header</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body class="animsition">
<%
	String id = null;

	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}
%>

	<!-- Header -->
	<header class="header-v4">
		<div class="container-menu-desktop">
			<div class="top-bar">
				<div class="flex-sb-m">
					<div class="wrap-icon-header flex-w flex-l-m">
						<div
							class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart">
							<img class="top-menu" src="${pageContext.request.contextPath}/img/icons/menu.png" alt="IMG-LOGO">
						</div>
					</div>
					
					<div class="left-top-bar">
						<a href="https://github.com/jay3614/jspGameSite"><img src="${pageContext.request.contextPath}/img/icons/logo1.png" alt="IMG-LOGO"></a>
					</div>

					<div class="right-top-bar flex-w h-full">
						<%
							if(id == null) {
						%>
						<a href="${pageContext.request.contextPath}/register" class="flex-c-m trans-04 p-lr-25">회원가입</a>
						<a href="${pageContext.request.contextPath}/login" class="flex-c-m trans-04 p-lr-25">로그인</a>
						<%
							}else {
						%>
						<a href="${pageContext.request.contextPath}/logoutAction" class="flex-c-m trans-04 p-lr-25">로그아웃</a>
						<%
							}
						%>
					</div>
				</div>
			</div>

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					<a href="../index" class="logo"> <img src="${pageContext.request.contextPath}/img/icons/logo1.png" alt="IMG-LOGO"></a>
					<div class="menu-desktop">
						<ul class="customMenu expanded">
							<li><a href="${pageContext.request.contextPath}/news/notice">새소식</a>
								<ul class="sub-menu">
									<li><a href="${pageContext.request.contextPath}/news/notice">공지사항</a></li>
									<li><a href="${pageContext.request.contextPath}/news/update">업데이트</a></li>
									<li><a href="${pageContext.request.contextPath}/news/event">이벤트</a></li>
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
</body>
</html>