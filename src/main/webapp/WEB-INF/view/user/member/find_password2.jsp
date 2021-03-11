<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!--그리드시스템을 위한 css파일-->
<link rel="stylesheet" href="css/bootstrap-grid.min.css">
<!--reboot.css 는 태그속성들이 다른 브라우저에서 호환이 가능하게끔 스타일을 맞춰주는 css파일 -->
<link rel="stylesheet" href="css/bootstrap-reboot.min.css">
<!--부트스트랩 기능들의 css-->
>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/login/find_password2.css"
	type="text/css">
<link rel="stylesheet" href="css/login/index.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="img/logo_favicon.ico">
<!--favicon-->
<link rel="icon" href="img/logo_favicon.ico">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<!--icon-->
<title>EUTCHAPEDIA</title>
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/view/user/header.jsp" />

	<main class="main-body">
		<div class="find-password-main">
			<div class="first-title">
				<p class="x" onclick="location.href='/login'">X</p>
				<h2 class="password-reset">비밀번호 변경</h2>
			</div>
			<hr class="bottom-line">
			<div class="second-title">
				<div class="password-eamil">
					<h2 class="password-forget">인증번호를 받으셨나요?</h2>
					<p class="write-email">입력하신 이메일을 확인 후,</p>
					<p class="write-email">이메일로 전송된 인증번호를 입력해 주세요.</p>
				</div>
			</div>
			<div class="find-password-form">
				<form method="POST" action="/findpassword2">
					<p>
						<input type="hidden" name="dice" value="${dice}">
						<input type="hidden" name="memberEmail" value="${memberEmail}">					
						<input class="input" type="text" name="number" placeholder="인증번호" />
					</p>
					<p>
						<input class="find-password-button" type="submit" value="인증번호 입력하기" >
					</p>
				</form>
			</div>
		</div>
	</main>

	<!------------ footer ------------>

	<jsp:include page="/WEB-INF/view/user/footer.jsp" />

	<!--부트스트랩이 jquery를 사용하고있어 어떠한 js파일보다 상위에 있어야함-->
	<script src="js/jquery.min.js"></script>
	<!--부트스트랩 4버전부터 popper.js가필요함 bundle.min.js에 popper.js가 포함되어있음-->
	<script src="js/bootstrap.bundle.min.js"></script>
	<script>
		window.onload=function(){ 
		alert("이메일이 발송되었습니다. 인증번호를 입력해주세요."); }
	</script>
</body>


</html>