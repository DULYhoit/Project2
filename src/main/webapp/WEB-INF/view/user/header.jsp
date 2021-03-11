<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

 <header id="header">
 
      <div class="wrapper">
        <div class="navbar">
        
          <div class="navbar_logo">
            <a href="/"><img id="logo" src="/img/original.png"> <!-- 이미지파일 이동 시 경로 확인!-->
             </a></div>

          <div class="menu">
            <ul>
              <li><a href="/aboutus">ABOUT US</a></li>
              <li><a href="/movie/movierate">평가하기</a></li>
              <li><a href="/notice/list">고객센터</a></li>
            </ul>
          </div>

          <!--검색창 -->
          <div class="searchbar">
            <form method="GET" action="/search?findStr=${param.findStr }" autocomplete="on">
              <div class="search_box">
                <div class="icon"><i class="fas fa-search"></i>
                  <input type="text" name="findStr" value="${param.findStr }" placeholder=" 작품 제목, 배우,감독을 검색해보세요.">
                  <button class="search_btn" type="submit"> <i class="fas fa-times" id="delete"></i> 
                  </button>
                </div>
              </div>
            </form>
          </div>

    <%   if(session.getAttribute("memberEmail") != null) {   %>

        <div class="menu">
            <ul>
              <li><a href="/logout">로그아웃</a></li>
              <li><a href="/mypage/index"><i class="far fa-user" id="usermy"></i></a></li><!-- 마이페이지 -->
            </ul>
          </div>
          
        
        <% } else if (session.getAttribute("admincheck") != null) { %> 
        
         
          <div class="menu">
            <ul>
              <li><a href="/admin/adminhome" id="admin_home">관리자 홈</a></li><!-- 관리자 홈으로  -->
              <li><a href="/logout">로그아웃</a></li>
              <li><a href="/mypage/index"><i class="far fa-user" id="usermy"></i></a></li><!-- 마이페이지 -->
            </ul>
          </div>
          
        
         <% } else { %> 
             
            <div class="menu">
            <ul>
              <li><a href="/login">로그인</a></li>
              <li><a href="/signup">회원가입</a></li>
            </ul>
          </div>
          
       <% } %>  
   
         </div>
      </div> 

    </header>