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
    <!--부트스트랩 기능들의 css-->>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/signup/signup.css" type="text/css">
    <link rel="stylesheet" href="css/signup/index.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/logo_favicon.ico">
    <!--favicon-->
    <link rel="icon" href="img/logo_favicon.ico">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <!--icon-->
    <title>EUTCHAPEDIA</title>
</head>

<body>
<!-- 헤더 -->
    <jsp:include page="/WEB-INF/view/user/header.jsp"/>   
        
    <main class="main-body">
        <div class="login-main">
            <div class="logo">
                <img src="img/original.png" >
            </div>
            <h2 class="title">회원가입</h2>
            <div class="login-form">
                <form method="POST" action="/signup.do" name="signup-form" onsubmit="return checkForm(this)">
                    <div class="form-box"> 
                        <label>
                            <input class="input-nickname" type="text" name="memberNickname" id="input-nickname" placeholder="닉네임" autocomplete="off" required />
                        </label>
                        <span class="error" id="nickname-required">닉네임은 필수입니다.</span>
                    </div>
                    <div class="form-box">
                        <label>
                            <input class="input-email" type="email" name="memberEmail" id="input-email" placeholder="이메일" autocomplete="off" required />
                        </label> 
                        <span class="error" id="email-required">이메일은 필수입니다.</span>    
                    </div>
                    <div class="form-box">
                        <label>
                            <input class="input" type="password" name="memberPwd" id="input-password" placeholder="비밀번호" autocomplete="off" required />
                        </label>
                        <span class="error" id="password-required" style="padding:8px 0 5px 10px;">비밀번호는 필수입니다.</span>
                    </div>
                    <p>
                        <input class="login-button" type="submit" value="회원가입" />
                    </p>
                </form>
            </div>
           
            <div class="signup-block">
                이미 가입하셨나요?
                <button type="button" onclick="location.href='login'">로그인</button>
            </div>
            <!-- <hr class="bottom-line">

            <div id="naver-login">
                <a href="#"><img src="img/member/naver.PNG"  style="width: 311px; height: 44px;" /></a>
            </div> -->
        </div>
    </main>
  
    <!------------ footer ------------>

    <jsp:include page="/WEB-INF/view/user/footer.jsp"/>
    
    <!--부트스트랩이 jquery를 사용하고있어 어떠한 js파일보다 상위에 있어야함-->
    <script src="js/jquery.min.js"></script>
    <!--부트스트랩 4버전부터 popper.js가필요함 bundle.min.js에 popper.js가 포함되어있음-->
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/member/signup.js"></script>
</body>


</html>