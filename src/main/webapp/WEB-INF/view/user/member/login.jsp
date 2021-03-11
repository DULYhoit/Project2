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
    <!--부트스트랩 기능들의 css-->>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login/login.css" type="text/css">
    <link rel="stylesheet" href="css/login/index.css">
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
                    <img src="img/original.png">
                </div>
                <h2 class="title">로그인</h2>
                <div class="login-form">
                    <form method="POST" id="login-form" action="/login.do" onsubmit="return login();">
                        <p>
                            <input class="input-email" type="email" name="memberEmail" id="email" placeholder="이메일" />
                           <!--  <span id="searchclear"><i class="fas fa-times"></i></span> -->
                            
                        </p>
                        <p>
                            <input class="input" type="password" name="memberPwd" id="pwd" placeholder="비밀번호">
                            <!-- <span id="searchclear"><i class="fas fa-times"></i></span> -->
                            </input>
                        </p>
                        <p>
                            <input class="login-button" type="submit" value="로그인">
                        </p>
                    </form>
                </div>
                <div class="password-block">
                    <button type="button" onclick="location.href='/findpassword'">비밀번호를 잊어버리셨나요?</button>
                </div>
                <div class="signup-block">
                    계정이 없으신가요?
                    <button type="button" onclick="location.href='/signup'">회원가입</button>
                </div>
                <!-- <hr class="bottom-line" >

                <div id="naver-login">
                    <a href="#"><img src="img/member/naver.PNG" style="width: 311px; height: 44px;" /></a>
                </div> -->
            </div>
        </main>

        <!------------ footer ------------>

        <jsp:include page="/WEB-INF/view/user/footer.jsp"/>
   

    <!-- scripts -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/member/login.js"></script>
    <!-- <script>
        var $ipt = $('#email'),
            $clearIpt = $('#searchclear');

        $ipt.keydown(function () {
            $("#searchclear").toggle(Boolean($(this).val()));
        });

        $clearIpt.toggle(Boolean($ipt.val()));
        $clearIpt.click(function () {
            $("#email").val('').focus();
            $(this).hide();
        });

        var $ipt = $('#pwd'),
            $clearIpt = $('#searchclear');

        $ipt.keyup(function () {
            $("#searchclear").toggle(Boolean($(this).val()));
        });

        $clearIpt.toggle(Boolean($ipt.val()));
        $clearIpt.click(function () {
            $("#pwd").val('').focus();
            $(this).hide();
        });

    </script> -->

</body>


</html>