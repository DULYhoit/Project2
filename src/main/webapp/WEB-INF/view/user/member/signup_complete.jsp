<%@page import= "kr.or.eutchapedia.login.vo.MemberVoTemp" %>
<%@page import= "kr.or.eutchapedia.login.vo.MemberVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 	
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
<link rel="stylesheet" href="css/signup/signup_complete.css"
	type="text/css">
<link rel="stylesheet" href="css/signup/index.css">
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
		<div class="welcome">
			<img class=logo src="img/original.png" width="300px" height="50px">
			<h2 class="title">EUTCHAPEDIA의 회원이 되신것을 환영합니다.</h2>
			<div class="member-email">
				<span>회원님의 메일주소는 <b>${memberEmail }</b>입니다.
				</span>
			</div>
		</div>
		<hr style="width: 500px;"/>
		<div class="btns">
			<button type="button" onclick="location.href='login'">로그인</button>
			<button type="button" onclick="location.href='/'">메인으로가기</button>
		</div>
	</main>
	<!------------ footer ------------>

	<jsp:include page="/WEB-INF/view/user/footer.jsp" />
	<!--부트스트랩이 jquery를 사용하고있어 어떠한 js파일보다 상위에 있어야함-->
	<script src="js/jquery.min.js"></script>
	<!--부트스트랩 4버전부터 popper.js가필요함 bundle.min.js에 popper.js가 포함되어있음-->
	<script src="js/bootstrap.bundle.min.js"></script>
</body>


</html>