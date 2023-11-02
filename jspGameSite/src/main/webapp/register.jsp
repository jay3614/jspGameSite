<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/util.css?after">
<link rel="stylesheet" type="text/css" href="css/main.css?after">
<title>회원가입</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
</head>

<body>

	<header class="header-v4">
		<div class="container-menu-desktop">
			<div class="top-bar">
				<div class="flex-sb-m h-full container">
					<div class="left-top-bar">
						<a href="https://github.com/jay3614/jspGameSite"><img src="img/icons/logo1.png" alt="IMG-LOGO"></a>
					</div>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m trans-04 p-lr-25">회원가입</a>
						<a href="#" class="flex-c-m trans-04 p-lr-25">로그인</a>
						<a href="#" class="flex-c-m trans-04 p-lr-25">로그아웃</a>
					</div>
				</div>
			</div>
		</div>
	</header>

	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="login-wrapper">
				<div class="row">
					<div>
						<!-- 아이디 -->
						<div class="orderBy__input input-group m-b--2">
							<p>ID<span class="m-r-92">*</span></p>
							<input type="text" class="form-control" aria-describedby="button-addon2" 
							placeholder="아이디(이메일)" required>
						</div>
						<div>
							<p class="errorMsg">보유하신 이메일을 입력해주세요.</p>
						</div>
						<span class="fieldError" style="color: red; font-size: 12px;">ㅁㄴㅇㄹ</span><!-- 에러 메세지 -->

						<!-- 비밀번호 -->
						<div class="orderBy__input input-group m-b--2 m-t-30">
							<p>비밀번호<span class="m-r-42">*</span></p>
							<input type="password" class="form-control" aria-describedby="button-addon2" placeholder="비밀번호" required>
						</div>
						<div>
							<p class="errorMsg">영어 소문자/숫자를 조합하여 4~20자리로 입력해주세요.</p>
						</div>
						<span class="fieldError" style="color: red; font-size: 12px;">ㅁㄴㅇㄻㄴㅇㄹ</span><!-- 에러 메세지 -->

						<!-- 이름 -->
						<div class="orderBy__input input-group m-b--2 m-t-30">
							<p>이름<span class="m-r-70">*</span></p>
							<input type="text" class="form-control"
								aria-describedby="button-addon2" placeholder="이름" required>
						</div>
						<div>
							<p class="errorMsg">이름을 입력해주세요.</p>
						</div>
						<span class="fieldError" style="color: red; font-size: 12px;" >ㅁㄴㅇㄻㄴㅇㄹ</span><!-- 에러 메세지 -->
						
						<!-- 성별 -->
						<div class="orderBy__input input-group m-b--2 m-t-30">
							<p>성별<span class="m-r-70">*</span></p>
							<!-- 남/여 radio 선택버튼으로 변경해야함 -->
							<input type="text" class="form-control" aria-describedby="button-addon2" placeholder="성별" required>
						</div>
						<span class="fieldError" style="color: red; font-size: 12px;" >둘 중 하나를 반드시 선택해주세요.</span><!-- 에러 메세지 -->
						
						<!-- 닉네임 -->
						<div class="orderBy__input input-group m-b--2 m-t-30">
							<p>닉네임<span>*</span></p>
							<input type="text" class="form-control" placeholder="닉네임" required>
						</div>
						<span class="fieldError" style="color: red; font-size: 12px;" >asdfasdf</span>
						
						<!-- 전화번호 -->
						<div class="orderBy__input input-group m-b--2 m-t-30">
							<p>
								전화번호<span>*</span>
							</p>
							<input type="text" class="form-control" placeholder="000-0000-0000" required>
						</div>
						<span class="fieldError" style="color: red; font-size: 12px;" >휴대폰 번호만 입력해주세요.</span><!-- 에러 메세지 -->
					</div>
				</div>
				<button class="btn btn-danger btn-dark">Sign In</button>
			</div>
			<button class="btn btn btn-danger btn-dark w-full">Sign In</button>
		</div>
	</div>
	
	<div class="login-footer">
		<p class="copyright">SpringBoot personal project All Rights Reserved.</p>
	</div>
	
</body>
</html>