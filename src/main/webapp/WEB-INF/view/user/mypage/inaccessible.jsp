<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="shortcut icon" href="/img/logo_favicon.ico"> <!--favicon-->
    <link rel="icon" href="/img/logo_favicon.ico">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"> <!--icon-->
    <link rel="stylesheet" href="/css/mypage/mypage_withdrawdone.css"><!--css경로수정-->
    <link rel="stylesheet" href="/css/mypage/indexnew.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> <!-- 차트 링크 --> 
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> 
    <title>EUTCHAPEDIA</title>
</head>

<body>
   <jsp:include page="/WEB-INF/view/user/header.jsp"/>

      <h3 class="main-title">
        <div class='title-div'>
            
        </div>
     </h3>


    <div class='mybody-wrapper'>
        <div class='body-header'>
        	<div class='logosize'>
            	<img id="logo" src="/img/original.png">
            </div>
            <p></p>
            <div>
                <p class='ment'>마이페이지는 회원만 접근이 가능합니다.
                
                </p>
                <div id='ment2'>
                로그인 또는 회원가입을 통해 이용 부탁드립니다.
                </div>
            </div>
        </div>
        <div class='body-main'>

	                <div>
	                    <input type='button' id='inputdiv2' value='로그인 하러 가기' onclick="location.href='/login'"><!--메인뷰연결-->
	                </div>

        </div>
    </div>

	<jsp:include page="/WEB-INF/view/user/footer.jsp"/>	

    <!--부트스트랩이 jquery를 사용하고있어 어떠한 js파일보다 상위에 있어야함-->
    <script src="/js/jquery.min.js"></script>
    <!--부트스트랩 4버전부터 popper.js가필요함 bundle.min.js에 popper.js가 포함되어있음-->
    <script src="/js/bootstrap.bundle.min.js"></script>
   
  </body>
    
</html>