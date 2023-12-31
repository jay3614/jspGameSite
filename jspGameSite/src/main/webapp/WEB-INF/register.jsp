<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/util.css?after">
<link rel="stylesheet" type="text/css" href="css/main.css?after">
<link rel="stylesheet" type="text/css" href="css/myCustom.css?after">
<title>회원가입</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<header>
		<div class="flex-c m-t-50">
			<a href="index"><img src="img/icons/logo1.png" alt="IMG-LOGO"></a>
		</div>
	</header>

	<section>
		<div class="d-flex flex-c">
			<form method = "post" action="regAction">
				<div class="p-t-55 m-b-150">
					<div class="row">
						<div>
							<!-- 아이디 -->
							<div class="register__input input-group">
								<p>ID<span class="m-r-92">*</span></p>
								<input type="text" class="form-control" aria-describedby="button-addon2" 
								name="id" placeholder="아이디(이메일)" required>
							</div>
							<div>
								<p class="errorMsg">보유하신 이메일을 입력해주세요.</p>
							</div>
	
							<!-- 닉네임 -->
							<div class="register__input input-group m-t-30">
								<p>닉네임<span>*</span></p>
								<input type="text" class="form-control" name="nickname" placeholder="닉네임" required>
							</div>
							
							<!-- 비밀번호 -->
							<div class="register__input input-group m-t-30">
								<p>비밀번호<span class="m-r-42">*</span></p>
								<input type="password" class="form-control" aria-describedby="button-addon2" name="password" placeholder="비밀번호" required>
							</div>
							<div>
								<p class="errorMsg">영어 소문자/숫자를 조합하여 4~20자리로 입력해주세요.</p>
							</div>
	
							<!-- 이름 -->
							<div class="register__input input-group m-t-30">
								<p>이름<span class="m-r-70">*</span></p>
								<input type="text" class="form-control"
									aria-describedby="button-addon2" name="name" placeholder="이름" required>
							</div>
							<div>
								<p class="errorMsg">이름을 입력해주세요.</p>
							</div>
							
							<!-- 전화번호 -->
							<div class="register__input input-group m-t-30">
								<p>
									전화번호<span>*</span>
								</p>
								<input type="text" class="form-control" name="phoneNumber" placeholder="000-0000-0000" required>
							</div>
							
							<!-- 성별 -->
							<div class="register__input input-group m-t-30 h-20-im">
								<p>성별<span class="m-r-70">*</span></p>
								<input type="radio" name="gender" value="남성" required><span class="m-r-20">남성</span>
   								<input type="radio" name="gender" value="여성" required><span>여성</span>
							</div>
						</div>
					</div>
					<button class="btn btn-danger btn-dark" type="submit">회원가입</button>
				</div>
			</form>
		</div>
	</section>
	
	<footer>
		<div class="flex-c">
			<p>© SpringBoot personal project All Rights Reserved.</p>
		</div>
	</footer>
	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
</body>
</html>