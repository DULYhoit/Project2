<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h2 class="title">회원가입</h2>
            <div class="login-form">
                <form method="POST" action="/mypage/signup.do" name="signup-form">
                    <div class="form-box"> 
                        <label>
                            <input class="input-nickname" type="text" name="memberNickname" id="input-nickname" placeholder="닉네임" autocomplete="off" required />
                        </label>
                        <span class="error" id="nickname-required" style="font-size: 13px;"></span>
                    </div>
                    <div class="form-box">
                        <label>
                            <input class="input-email" type="email" name="memberEmail" id="input-email" placeholder="이메일" autocomplete="off" required />
                        </label> 
                        <!-- <span class="error" id="email-required">이미 가입된 이메일입니다.</span>    -->
                    </div>
                    <div class="form-box">
                        <label>
                            <input class="input" type="password" name="memberPwd" id="input-password" placeholder="비밀번호" autocomplete="off" required />
                        </label>
                        <!-- <span clas="error" id="password-required">정확하지 않은 비밀번호입니다.</span>     -->
                    </div>
                    <p>
                        <input class="login-button" type="submit" value="회원가입" />
                    </p>
                </form>
            </div>
</body>
</html>