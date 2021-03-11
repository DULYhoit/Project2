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
    <link rel="stylesheet" href="/css/mypage/mypage_edit(ver3).css"><!--css경로수정-->
    <link rel="stylesheet" href="/css/mypage/indexnew.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> <!-- 차트 링크 --> 
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> 
    <title>EUTCHAPEDIA</title>
</head>

<body>
<jsp:include page="/WEB-INF/view/user/header.jsp"/>
        

      <h3 class="main-title">
        
        <div class='title-div'>
            <a class='atag' href='/mypage/index'>마이페이지
         <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-bookmark-heart" viewBox="0 0 16 16">
             <path fill-rule="evenodd" d="M8 4.41c1.387-1.425 4.854 1.07 0 4.277C3.146 5.48 6.613 2.986 8 4.412z"/>
             <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
           </svg>
        </a>
         </div>
        
     </h3>  
     
      <div class='mybody-wrapper'>
            <!-- <a  href="/mypage.html">
               <img data-bs-toggle="tooltip" data-bs-placement="top" title="마이페이지로 이동" src="/img/arrow-left-short.svg" alt="" width="50" height="50" > 
            </a> -->
            <div class='maintitle'> 
            <h1 class='bodytitle'>나의정보수정</h1>
            </div>
            <form class="formbox"  method="post" action="edit.do" onsubmit="#" enctype="multipart/form-data" >
            	<c:set var="name" value='/img/mypage/originprofile.jpg' />
            	<c:set var="name2" value='${member.memberPhoto}' />
            	<c:choose>
            		<c:when test="${name == name2}"> 
                		<img class='profile' id='profile'  src='${member.memberPhoto}' width="200px"; height="250px">
                	</c:when>
                	<c:when test="${name != name2}">
               			 <img class='profile' id='profile'  src='/static/upload/${member.memberPhoto}' width="200px"; height="250px">
                	</c:when>
				</c:choose>
                <div class='inputbox-div'>
                    <label for='profile'>프로필 사진 변경
                    </label>
                    
                    <input class='inputbox' name='profileimg' id='fileinput' type='file' accept="image/*" onchange="previewImage(this)" / >
                  
                	<input type='hidden' name='memberPhoto' value='${member.memberPhoto}'>
                
                   
                </div>
                <div class='inputbox-div'>
                    <label>닉네임<br>
                    <span id="info">""</span>
                    </label>
                    <input class='inputbox' id='memberNickname' name='memberNickname' type='text' placeholder="한글,영문,숫자 최대 8자 이하 가능" value="${member.memberNickname }">
                </div>

                <div class='inputbox-div'>
                    <label>이메일</label>
                    <input class='inputbox' name='memberEmail' id=email type='email' value="${member.memberEmail }" readonly>
                </div>

               
                <div class='inputbox-div'>
                  <label>현재 비밀번호
                  <span><input type='button' id='changebtn' value='변경' onclick='changepwd()'></span>
                  <span id="info">비밀번호 형식에 맞게 다시 설정해 주세요.</span>
                  </label>
                  <input class='inputbox' id='nowpwd' type='password' value="123456789" readonly>
                  <input class='inputbox' id='nowpwd' name='memberPwd' type='hidden' value="${member.memberPwd}" readonly>
                  <input class='inputbox' id='nowpwd' name='memberPwdSalt' type='hidden' value="${member.memberPwdSalt}">
              </div>

              <div id='changepwddiv'>
                <div class='inputbox-div'>
                    <label>변경할 비밀번호<br>
                    <span id="info" class="infopwd">비밀번호 형식에 맞게 다시 설정해 주세요.</span>
                    </label>
                    <input class='inputbox' id='chgpwd1' name='memberPwdChange' type='password' placeholder="소문자,숫자,특수문자 포함 8자 이상 가능">
                </div>
                
                <div class='inputbox-div'>
                    <label>변경할 비밀번호 확인<br>
                    <span class="infopwd2"></span>
                    </label>
                    <input class='inputbox' id='password2' type='password'>
                </div>
              </div>
                <div class='inputbox-div'>
                    <label>소개
                    <span id="info">..</span> 
                    </label>
                    <textarea class='inputbox' id='introduce' name='memberIntroduce' placeholder="간단한 소개를 남겨보세요!">${member.memberIntroduce}</textarea>
                </div>

                <div class='inputbox-div'>
                    <input class='inputbox' id='inputbox' type='submit' value='수정 완료'>
                </div>

                <p class='withdraw'>회원탈퇴를 원하시면 <a href="/mypage/withdraw">여기</a>를 클릭하세요</p>

                <!-- <div class='inputbox-div'>
                    <input class='inputbox' id='inputbox' type='button' value='회원 탈퇴' onclick="location.href='/mypage_withdraw.html'">
                </div>
                 -->
            </form>
            
    </div>
	<jsp:include page="/WEB-INF/view/user/footer.jsp"/>
    <!--부트스트랩이 jquery를 사용하고있어 어떠한 js파일보다 상위에 있어야함-->
    <script src="/js/jquery.min.js"></script>
    <!--부트스트랩 4버전부터 popper.js가필요함 bundle.min.js에 popper.js가 포함되어있음-->
    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/mypage/mypage_edit.js">></script>
    <script>
     
     
        $(function() {
            $("#fileinput").on('change', function(){
                readURL(this);
            });
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
               var reader = new FileReader();
               reader.onload = function (e) {
                  $('#profile').attr('src', e.target.result);
               }
               reader.readAsDataURL(input.files[0]);
            }
        }

        function changepwd() {
          $("#changepwddiv").css('display','block');
          $("#chgpwd1").focus(); 
        }
    

    </script>
  </body>
    
</html>