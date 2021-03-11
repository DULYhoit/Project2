<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EUTCHAPEDIA</title>
	<link rel="stylesheet" href="/css/movie/index.css">
	<link rel="stylesheet" href="/css/main/about_us.css">
	<!--favicon-->
	<link rel="icon" href="/img/logo_favicon.ico">
	<link rel="shortcut icon" href="/img/logo_favicon.ico">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"><!--icon-->
	<link rel="stylesheet" href="/css/bootstrap-grid.min.css">
	<link rel="stylesheet" href="/css/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/view/user/header.jsp"/>
<!-- header 끝 -->

<div class="section">
    <main id="aboutus">

      <div class="about-section">
        <div class="about-inner-container">
          <h1 style="font-weight: bold; font-size: 44px; margin: 20px; margin-bottom: 50px;">About Us</h1>
          <p class="about-text">
            <i class="fas fa-quote-left" style="color:rgb(51,51,51); font-size:40px; margin-right: 20px;"></i>

            예전엔 모두 <strong>비슷한 영화</strong>를 보고 <strong>비슷한 음악</strong>을 들었죠. <br>
            박스오피스 1위 영화를 보거나, 모두 함께 음원 차트 1위인 곡을 듣곤 했던 것처럼.<br>
            하지만 때는 바야흐로 <strong>개취, 개개인의</strong> <span>취향</span>이 중요한 시대! <br>

            <span>읏챠피디아</span> 는 내가 본 <strong>영화를 평가하고 기록 할 수 있는</strong><span>콘텐츠 평가 서비스</span> 입니다. <br>

            지금 읏챠피디아에서 내 <strong>취향대로 <span>별점</span>과 <span>코멘트</span>를 남기고</strong> , <br>
            <strong>사용자들의 <span>'찐 리뷰'</span> 를 확인해 보세요!</strong>
            <i class="fas fa-quote-right" style="color:rgb(51,51,51); font-size:40px; margin-left: 20px;"></i>
          </p>
        </div>
      </div>

      <!--member_info-->

      <div class="member-wrap">
        <h2 class="member-title">we are <span class="member-color">EUTCHA<em>PEDIA</em></span></h2></br>

        <div class="member-outbox">

          <div id="member-container">
            <ul style="margin:auto">
              <li>
                <img src="/img/aboutus/jihyeon.png" alt="" width="200px">
                <h3>PM</h3>
                <h4>Lee Jihyeon</h4>
                <div class="member_inner">
                  <p>geniushyeon✌</p>
                  <i class="fas fa-quote-left"></i>
                  <p>못 하는게 엄서영</p><i class="fas fa-quote-right"></i><br>
                  <a target="_blank" href="https://github.com/geniushyeon"
                    style=" font-size:20px; text-decoration: none; color: #fff;">Contact 👉
                    <i class="fab fa-github" style="color:#fff; font-size:20px;"></i>
                  </a>
                </div>
              </li>

              <li>
                <img src="/img/aboutus/seowoo.png" alt="" width="200px">
                <h3>DEVELOPER</h3>
                <h4>Park Seowoo</h4>
                <div class="member_inner">
                  <p>seoow💛</p>
                  <i class="fas fa-quote-left"></i>
                  <p>Pick Me ! Pick Me!</p><i class="fas fa-quote-right"></i><br>
                  <a target="_blank" href="https://github.com/seoow"
                    style=" font-size:20px; text-decoration: none; color: #fff;">Contact 👉
                    <i class="fab fa-github" style="color:#fff; font-size:20px;"></i>
                  </a>
                </div>
              </li>

              <li>
                <img src="/img/aboutus/yoonji.png" alt="" width="200px">
                <h3>DEVELOPER</h3>
                <h4>Je Yoonji</h4>
                <div class="member_inner">
                  <p>yoonjije💟</p>
                  <i class="fas fa-quote-left"></i>
                  <p>HolyMoly🔥과카몰리</p><i class="fas fa-quote-right"></i><br>
                  <a target="_blank" href="https://github.com/yoonjije"
                    style=" font-size:20px; text-decoration: none; color: #fff;">Contact 👉
                    <i class="fab fa-github" style="color:#fff; font-size:20px;"></i>
                  </a>
                </div>
              </li>

              <li>
                <img src="/img/aboutus/minyoung.png" alt="" width="200px">
                <h3>DEVELOPER</h3>
                <h4>Lee Minyoung</h4>
                <div class="member_inner">
                  <p>chicc101👍</p>
                  <i class="fas fa-quote-left"></i>
                  <p>부족한게 엄서영</p><i class="fas fa-quote-right"></i><br>
                  <a target="_blank" href="https://github.com/chicc101"
                    style=" font-size:20px; text-decoration: none; color: #fff;">Contact 👉
                    <i class="fab fa-github" style="color:#fff; font-size:20px;"></i>
                  </a>
                </div>
              </li>

              <li>
                <img src="/img/aboutus/minjin.png" alt="" width="200px">
                <h3>DEVELOPER</h3>
                <h4>Kim Minjin</h4>
                <div class="member_inner">
                  <p>Kim-min-jin👍</p>
                  <i class="fas fa-quote-left"></i>
                  <p>개발자 되자.</p><i class="fas fa-quote-right"></i><br>
                  <a target="_blank" href="https://github.com/Kim-min-jin"
                    style=" font-size:20px; text-decoration: none; color: #fff;">Contact 👉
                    <i class="fab fa-github" style="color:#fff; font-size:20px;"></i>
                  </a>
                </div>
              </li>

              <li>
                <img src="/img/aboutus/yejin.png" alt="" width="200px">
                <h3>DEVELOPER</h3>
                <h4>Cha Yejin</h4>
                <div class="member_inner">
                  <p>chayezo😎</p>
                  <i class="fas fa-quote-left"></i>
                  <p>(ง •̀_•́)ง</p><i class="fas fa-quote-right"></i><br>
                  <a target="_blank" href="https://github.com/chayezo"
                    style=" font-size:20px; text-decoration: none; color: #fff;">Contact 👉
                    <i class="fab fa-github" style="color:#fff; font-size:20px;"></i>
                  </a>
                </div>
              </li>

              <li>
                <img src="/img/aboutus/eungyu.png" alt="" width="200px">
                <h3>DEVELOPER</h3>
                <h4>Kim Eungyu</h4>
                <div class="member_inner">
                  <p>DULYhoit✨</p>
                  <i class="fas fa-quote-left"></i>
                  <p>1억년 전 옛날이 너무나 그리워</p><i class="fas fa-quote-right"></i><br>
                  <a target="_blank" href="https://github.com/DULYhoit"
                    style=" font-size:20px; text-decoration: none; color: #fff;">Contact 👉
                    <i class="fab fa-github" style="color:#fff; font-size:20px;"></i>
                  </a>
                </div>
              </li>

              <li>
                <img src="/img/aboutus/jongwoong.png" alt="" width="200px">
                <h3>DEVELOPER</h3>
                <h4>Paek Jongwoong</h4>
                <div class="member_inner">
                  <p>St4rFi5h😘</p>
                  <i class="fas fa-quote-left"></i>
                  <p>요리보고 저리봐도 음음 알수없는 둘리</p><i class="fas fa-quote-right"></i><br>
                  <a target="_blank" href="https://github.com/St4rFi5h"
                    style=" font-size:20px; text-decoration: none; color: #fff;">Contact 👉
                    <i class="fab fa-github" style="color:#fff; font-size:20px;"></i>
                  </a>
                </div>
              </li>

            </ul>
          </div>

        </div>
      </div>


    </main>
    </div>
    
    
<!-- footer -->
<jsp:include page="/WEB-INF/view/user/footer.jsp"/>
<!-- footer 끝 -->

    
  <!-- scripts -->
  <script src="/js/jquery.min.js"></script>
  <script src="/js/bootstrap.bundle.min.js"></script>
</body>

</html>