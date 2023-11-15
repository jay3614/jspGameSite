<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/util.css?after">
<link rel="stylesheet" type="text/css" href="css/main.css?after">
<title>회원로그인</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
</head>
<body>
	
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="login-wrapper">
				<div class="login-header">
					<h1 class="logo">
						<a href="index"><img src="img/icons/logo1.png"></a>
					</h1>
				</div>
				<form method="post" action="loginAction.jsp" id="login-form">
					<input type="text" class="form-control" name="id" id="id" placeholder="ID(이메일)">
					<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호">
					<input type="submit" value="로그인">
				</form>

				<ul class="login-box">
					<li class="login-list"><a href="register" class="login-link trans-04">회원가입</a></li>
					<li class="login-list"><a href="findId" class="login-link trans-04">아이디 찾기</a></li>
					<li class="login-list"><a href="findPassword" class="login-link trans-04"> 비밀번호 찾기</a></li>
				</ul>
				<div class="social-login">
					<button type="button" onclick="location.href='#'"><img src="img/icons/google.svg"><span class="icon">Google 계정으로 로그인</span></button>
					<button type="button" onclick="location.href='#'"><img src="img/icons/naver.svg"><span class="icon">Naver 계정으로 로그인</span></button>
				</div>
			</div>
		</div>
	</div>
	<div class="login-footer">
		<p class="copyright">SpringBoot personal project All Rights Reserved.</p>
	</div>
</body>
</html>
