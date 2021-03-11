<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EUTCHAPEDIA</title>
<link rel="stylesheet" href="/css/movie/index.css">
<link rel="stylesheet" href="/css/main/index_main.css">
	<!--favicon-->
	<link rel="icon" href="/img/logo_favicon.ico">
	<link rel="shortcut icon" href="/img/logo_favicon.ico">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"><!--icon-->
	<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon -->
 	<script src="/js/jquery.min.js"></script>
 	<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> <!-- slick js-->
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" /><!-- slick css -->
	<link rel="stylesheet" href="/css/bootstrap-grid.min.css">
	<link rel="stylesheet" href="/css/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<!-- header -->
<jsp:include page="header.jsp"/>
<!-- header 끝 -->

  <div class="section">
  
    <main>
	
      <section id="movie" style="margin: auto; display: inline-block;">
	
	        <!--박스오피스 슬라이드 -->
	        <div class="main_slider">
	          <h1 class="slider_title">박스오피스</h1>
	          <div class="movie_slider" id="box_office">
	            <div class="movie_box">
	          	  <a href="movie/detail?movieDocId=F50568">
	                <div class="poster">
	                  <img src="https://an2-img.amz.wtchn.net/image/v2/1a5dc00efec3b2d32c0836e35f630250.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPalF3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFek16YzNOakF6TkRRME9EZzROemcwSWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqb3lPREI5LklNVE5ocjVRNV9kTm1BblBpemx5OUJqRHZOU19xQzBpWXM0X2dlUU9BS3c" alt="" class="movie_img">
	                  <div class="rank">1</div>
	                  <div class="movie_info">
	                    <h4 class="movie_title">미나리</h4>
	                    <p><div class="movie_yearNnation">2020<span>·</span>미국</div></p>
	                    <p><div class="movie_average">평균<span>★</span>4.2</div></p>
	                    <div class="movie_total">예매율 38%<span>·</span>누적 관객 1,009명</div>
	                  </div>
	                </div>
	              </a>
	            </div>
	            
	          <div class="movie_box">
	             <a href="/movie/detail?movieDocId=F52778">
	                <div class="poster">
	                  <img
	                    src="https://an2-img.amz.wtchn.net/image/v2/5c4501b3753a6912b02b1d64ab123fde.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPalF3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFek16YzNOelkxTkRBNE5EWTBPVFV4SWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqb3lPREI5Lms2OU0tOTFZWlF2SmR4bkswSnRXdGhXOC0wakpVYjRVVjdibnpQTi1oWGc"
	                    alt="" class="movie_img">
	                  <div class="rank">2</div>
	                  <div class="movie_info">
	                    <h4 class="movie_title">라야와 마지막 드래곤</h4>
	                    <p><div class="movie_yearNnation">2021<span>·</span>미국</div></p>
	                    <p><div class="movie_average">평균<span>★</span>4.0</div></p>
	                    <div class="movie_total">예매율 19%<span>·</span>누적 관객 702명</div>
	                  </div>
	                </div>
	              </a>
	            </div>
	            
	
	            <div class="movie_box">
	              <a href="/movie/detail?movieDocId=F52107">
	                <div class="poster">
	                  <img
	                    src="https://an2-img.amz.wtchn.net/image/v2/c630199272ddb9a3fdee668009d04582.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPalF3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFeE9UQTJOakkxTWpFek1UVXdOemt4SWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqb3lPREI5LnM2OEU4Yk1GVm1vR3pIMU5BaThuSno5cnQxeHVkWjNiaE1kdV9mbVE1bjg"
	                    alt="" class="movie_img">
	                  <div class="rank">3</div>
	                  <div class="movie_info">
	                    <h4 class="movie_title">극장판 귀멸의 칼날 무한열차편</h4>
	                    <p><div class="movie_yearNnation">2020<span>·</span>일본</div></p>
	                    <p><div class="movie_average">평균<span>★</span>4.2</div></p>
	                    <div class="movie_total">예매율 21%<span>·</span>누적 관객 39만명</div>
	                  </div>
	                </div>
	              </a>
	            </div>
	
	
	            <div class="movie_box">
	              <a href="/movie/detail?movieDocId=K22837">
	                <div class="poster">
	                  <img
	                    src="https://an2-img.amz.wtchn.net/image/v2/b3e1c6558536377a16b30e406e9ac8f8.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPalF3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFek9UYzNNelF4TnpNM056a3hOemM0SWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqb3lPREI5LkdLZmZPdi1UZmdveU81WjEwYk9hM3kwMHJpZ28ydlM5R2dYdmg1eGFmaDA"
	                    alt="" class="movie_img">
	                  <div class="rank">4</div>
	                  <div class="movie_info">
	                    <h4 class="movie_title">고백</h4>
	                    <p><div class="movie_yearNnation">2019<span>·</span>한국</div></p>
	                    <p><div class="movie_average">평균<span>★</span>2.2</div> </p>
	                    <div class="movie_total">예매율 4.9%<span>·</span>누적 관객 2만명</div>
	                  </div>
	                </div>
	              </a>
	            </div>
	
	            <div class="movie_box">
	              <a href="/movie/detail?movieDocId=F04812">
	                <div class="poster">
	                  <img
	                    src="https://an2-img.amz.wtchn.net/image/v2/5260600ae1e8e83334a7aaac6e2708d8.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPalF3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFeU56WTRPRGszTVRBd01Ua3pNamd4SWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqb3lPREI5LmMxUGhJTndSVGlHa2FaTWVvci1faDN1VjYzLW1RLW9NOTlrRDJBMGNzLVU"
	                    alt="" class="movie_img">
	                  <div class="rank">5</div>
	                  <div class="movie_info">
	                    <h4 class="movie_title">중경삼림 리마스터링</h4>
	                    <p><div class="movie_yearNnation">1994<span>·</span>홍콩</div></p>
	                    <p><div class="movie_average">평균<span>★</span>3.0</div></p>
	                    <div class="movie_total">예매율 4.6%<span>·</span>누적 관객 2만명</div>
	                  </div>
	                </div>
	              </a>
	            </div>
	
	            <!-- 추가 -->
	            <div class="movie_box">
	              <a href="/movie/detail?movieDocId=F52167">
	                <div class="poster">
	                  <img
	                    src="https://an2-img.amz.wtchn.net/image/v2/612c4dc5b5b7b0df57bcf7aa02402dd2.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPalF3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpBNU9UZzFNakE1TURjeU56VTFNVEkzSWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqb3lPREI5Lmp3NllkRWtRTkE1UFBRTWdRMFRPOGRRRDMwcE1xLVY2RnBNbTY2UWNaWWs"
	                    alt="" class="movie_img">
	                  <div class="rank">6</div>
	                  <div class="movie_info">
	                    <h4 class="movie_title">소울</h4>
	                    <p><div class="movie_yearNnation">2020<span>·</span>미국</div></p>
	                    <p><div class="movie_average">평균<span>★</span>3.3</div></p>
	                    <div class="movie_total">예매율 2.5%<span>·</span>누적 관객 192만명</div>
	                  </div>
	                </div>
	              </a>
	            </div>
	
	            <div class="movie_box">
	              <a href="/movie/detail?movieDocId=K21625">
	                <div class="poster">
	                  <img
	                    src="https://an2-img.amz.wtchn.net/image/v2/b89f051acb35c22408133f662fdd6537.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPalF3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFeU56VXdOekV5TmpNek9EVXlNVEV6SWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqb3lPREI5LkpDNXZISFE3dEVNb0dPam8xa0tKUXplVFZPcl9mdGMxWEx2VmVtU2ZzQ00"
	                    alt="" class="movie_img">
	                  <div class="rank">7</div>
	                  <div class="movie_info">
	                    <h4 class="movie_title">미션 파서블</h4>
	                    <p><div class="movie_yearNnation">2020<span>·</span>한국</div></p>
	                    <p><div class="movie_average">평균<span>★</span>2.4</div></p>
	                    <div class="movie_total">예매율 1.8%<span>·</span>누적 관객 37만명</div>
	                  </div>
	                </div>
	              </a>
	            </div>
	
	            <div class="movie_box">
	             <a href="/movie/detail?movieDocId=F52586">
	                <div class="poster">
	                  <img
	                    src="https://an2-img.amz.wtchn.net/image/v2/113395e2343fbc6420fd90a97d39ff7c.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPalF3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFeE5UVTVNalV3TmpZeE56ZzJNRFV6SWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqb3lPREI5LkVfNWV1d25TcUFLV3BldWNWZTI0SV9oc3pNR0lMNU9IdW1icTZEOTZGUVk"
	                    alt="" class="movie_img">
	                  <div class="rank">8</div>
	                  <div class="movie_info">
	                    <h4 class="movie_title">톰과 제리</h4>
	                    <p><div class="movie_yearNnation">2021<span>·</span>미국</div></p>
	                    <p><div class="movie_average">평균<span>★</span>2.4</div></p>
	                    <div class="movie_total">예매율 0.9%<span>·</span>누적 관객 11명</div>
	                  </div>
	                </div>
	              </a>
	            </div>
	
	            <div class="movie_box">
	              <a href="/movie/detail?movieDocId=F52587">
	                <div class="poster">
	                  <img
	                    src="https://an2-img.amz.wtchn.net/image/v2/cfc17ab3a41866cb42de195f030701af.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPalF3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFeU9UTXpOVEl4TlRJeU56VTJPVEV3SWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqb3lPREI5LkxuNkRyMjQtYlFkSGs3S01QemVJeS1uODdwTk9JMjIzRXp3TzFTMTNRa2c"
	                    alt="" class="movie_img">
	                  <div class="rank">9</div>
	                  <div class="movie_info">
	                    <h4 class="movie_title">퍼펙트 케어</h4>
	                    <p><div class="movie_yearNnation">2020<span>·</span>영국</div></p>
	                    <p><div class="movie_average">평균<span>★</span>3.5</div></p>
	                    <div class="movie_total">예매율 2%<span>·</span>누적 관객 6,265명</div>
	                  </div>
	                </div>
	              </a>
	            </div>
	
	            <div class="movie_box">
	              <a href="/movie/detail?movieDocId=F52508">
	                <div class="poster">
	                  <img
	                    src="https://an2-img.amz.wtchn.net/image/v2/e245637ecbe8e033ef707de5c585c2a2.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPalF3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFeE5UVXdNakV6TnpVMk1EUXdNekUySWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqb3lPREI5LkIxS0d3TXVpc2NhYkJ2d0g4WHVEYmc2SF9xQUdyQmpPSFpFZWdxdG1jLXM"
	                    alt="" class="movie_img">
	                  <div class="rank">10</div>
	                  <div class="movie_info">
	                    <h4 class="movie_title">호라이즌 라인</h4>
	                    <p><div class="movie_yearNnation">2020<span>·</span>미국</div></p>
	                    <p><div class="movie_average">평균<span>★</span>2.6</div></p>
	                    <div class="movie_total">예매율 0.9%<span>·</span>누적 관객 4,716명</div>
	                  </div>
	                </div>
	              </a>
	            </div>
	           
	
	          </div>
	        </div>
	        
        
		        <!--왓챠 영화 순위 슬라이드 -->
		        <div class="main_slider" id="watchaList">
		          <h1 class="slider_title">왓챠 영화 순위</h1>
		          <div class="movie_slider" id="watcha_slider">
			
			         <c:forEach items="${watchaList}" var="MovieInfoVo" begin="0" end="9" >
			         
			            <div class="movie_box">
						  <a href="/movie/detail?movieDocId=${MovieInfoVo.movieDocId}"><!-- detail페이지 연결해야함  -->
			              <div class="poster">
			                  <img src="${MovieInfoVo.posterUri}" alt="" class="movie_img">
			                  <div class="rank">${MovieInfoVo.movieRanking}</div>
			                  <div class="movie_info">
			                    <h4 class="movie_title">${MovieInfoVo.title}</h4>
			                    <p><div class="movie_yearNnation">
			                    <fmt:parseDate value='${MovieInfoVo.prodYear}' var='prodYear' pattern="yyyyMMdd" scope="page"/>
			                    <fmt:formatDate value="${prodYear}" pattern="yyyy"/>
			                    <span>·</span>${MovieInfoVo.nation}</div></p>
			                    <p><div class="movie_average">평균<span>★</span>${MovieInfoVo.ratingAvg}</div></p>
			                  </div>
			               </div>
			               </a>
			            </div>
			            
			         </c:forEach>
			            
				 </div>
				</div>
				
			
		        <!--넷플릭스 영화 순위 슬라이드 -->
		        <div class="main_slider">
		          <h1 class="slider_title">넷플릭스 영화 순위</h1>
		          <div class="movie_slider" id="netflix_slider">
		
				   <c:forEach items="${netflixList}" var="MovieInfoVo" begin="0" end="9" >
			     
			            <div class="movie_box">
					      <a href="/movie/detail?movieDocId=${MovieInfoVo.movieDocId}">
			                <div class="poster">
			                  <img src="${MovieInfoVo.posterUri}" alt="" class="movie_img">
			                  <div class="rank">${MovieInfoVo.movieRanking}</div> 
			                  <div class="movie_info">
			                    <h4 class="movie_title">${MovieInfoVo.title}</h4>
			                    <p><div class="movie_yearNation">
			                    <fmt:parseDate value='${MovieInfoVo.prodYear}' var='prodYear' pattern="yyyyMMdd" scope="page"/>
		                    	<fmt:formatDate value="${prodYear}" pattern="yyyy"/>
			                    <span>·</span>${MovieInfoVo.nation}</div></p>
			                    <p><div class="movie_average">평균<span>★</span>${MovieInfoVo.ratingAvg}</div></p>
			                  </div>
			                </div>
			              </a>
			            </div>
			            
			       </c:forEach>
			          
	          </div>
	        </div>

	
	        <!--슬라이드 (읏챠피디아 검색 TOP !) -->
	        <div class="main_slider">
	          <h1 class="slider_title">읏챠피디아 검색 TOP</h1>
	          <div class="movie_slider" id="search_slider">
	
	 		   <c:forEach items="${searchList}" var="MovieInfoVo" begin="0" end="9" >
	
	           	   <div class="movie_box">  
						<a href="/movie/detail?movieDocId=${MovieInfoVo.movieDocId}">
			                <div class="poster">
			                  <img src="${MovieInfoVo.posterUri}" alt="" class="movie_img"> 
	     					  <div class="rank">${MovieInfoVo.movieRankingIndex}</div> 
			                  <div class="movie_info">
			                    <h4 class="movie_title">${MovieInfoVo.title}</h4>
			                    <p><div class="movie_yearNation">
			                    <fmt:parseDate value='${MovieInfoVo.prodYear}' var='prodYear' pattern="yyyyMMdd" scope="page"/>
		                    	<fmt:formatDate value="${prodYear}" pattern="yyyy"/>
			                    <span>·</span>${MovieInfoVo.nation}</div></p>
			                    <p><div class="movie_average">평균<span>★</span>${MovieInfoVo.ratingAvg}</div></p>
			                  </div>
			                </div>
			              </a>
			           </div>
			           
			       </c:forEach>
		
		          </div>
		        </div>
	

		        <!--슬라이드 (읏챠피디아 리뷰 TOP !) -->
		        <div class="main_slider">
		          <h1 class="slider_title">읏챠피디아 리뷰 TOP</h1>
		          <div class="movie_slider" id="review_slider">
		
		    	  <c:forEach items="${reviewList}" var="MovieInfoVo" begin="0" end="9" >
		
		         	   <div class="movie_box">
							<a href="/movie/detail?movieDocId=${MovieInfoVo.movieDocId}">
			                <div class="poster">
			                  <img src="${MovieInfoVo.posterUri}" alt="" class="movie_img">
	     					  <div class="rank">${MovieInfoVo.movieRankingIndex}</div> 
			                  <div class="movie_info">
			                    <h4 class="movie_title">${MovieInfoVo.title}</h4>
			                    <p><div class="movie_yearNation">
			                    <fmt:parseDate value='${MovieInfoVo.prodYear}' var='prodYear' pattern="yyyyMMdd" scope="page"/>
		                    	<fmt:formatDate value="${prodYear}" pattern="yyyy"/>
			                    <span>·</span>${MovieInfoVo.nation}</div></p>
			                    <p><div class="movie_average">평균<span>★</span>${MovieInfoVo.ratingAvg}</div></p>
			                  </div>
			                  </div>
				             </a>
				          </div>
				            
				  </c:forEach>
				
		
		          </div>
		        </div>


        <!--슬라이드 (읏챠피디아 컬렉션) -->


        <div class="main_slider">

          <h1 class="slider_title">읏챠피디아 컬렉션</h1>
          <div class="movie_slider" id="collection_slider">

            <div class="movie_box">
              <a href="/collection?pickIndex=1">
                <ul class="photo_list">
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1466065521/ncfalr8e5y9smnrpp1oe.jpg">
                  </li>
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1480382093/ha1knjr9iilixtwkltpw.jpg">
                  </li>
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v2/9005a9e874deb157446857fab2993ebf.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPalF3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFeU5ETXdPVFk1TlRBek1ESTVOakUzSWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqb3lPREI5LldpeDNuUElpeU9BLTV6X0kxaV9FcEp2QUxRTXYzaml5bmtNSkY5bUxfWUU">
                  </li>
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1588837216/bk9rtgmhmkxlsextlgdb.jpg">
                  </li>
                </ul>

                <h4 class="collection_title"> 개발자 지현 PICK! </h4>
              </a>
            </div>

            <div class="movie_box">
            <a href="/collection?pickIndex=2">
                <ul class="photo_list">
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1466064258/x8yowmjhm0jnl2ukqans.jpg">
                  </li>
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1563771680/stqfo8sj3erjrplai4fq.jpg">
                  </li>
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1466084622/b25ujkytyr6br1co1oh2.jpg">
                  </li>
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1548728649/xks96jzaouihrjensfiv.jpg">
                  </li>
                </ul>

                <h4 class="collection_title"> 개발자 서우 PICK! </h4>
              </a>
            </div>

            <div class="movie_box">
             <a href="/collection?pickIndex=5">
             
                <ul class="photo_list">
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1467959937/lhlkhmc5gp2fnxkqirtf.jpg">
                  </li>
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1466103370/ywdt1mrrwekmz8qwaypr.jpg">
                  </li>
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1466154507/oe2qj9r0npfjflysmji6.jpg">
                  </li>
                      <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1553140014/ez1vxznfdnaqplmoyrpy.jpg">
                  </li>
        
      
                </ul>

                <h4 class="collection_title"> 읏챠 엄선 컬렉션!</h4>
              </a>
            </div>

            <div class="movie_box">
              <a href="/collection?pickIndex=3">
                <ul class="photo_list">
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1591666357/icvpyutx9etvcgaeooko.jpg">
                  </li>
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1466142822/t2nqthx7l8mfmwssdoxj.jpg">
                  </li>
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1517417947/msqdxginhltmoqqobcy7.jpg">
                  </li>
                  <li class="photo_box">
                    <img class="photo-img"
                      src="http://file.koreafilm.or.kr/thm/02/00/01/67/tn_DPF002844.JPG">
                  </li>
                </ul>

                <h4 class="collection_title"> 개발자 은규 PICK! </h4>
              </a>
            </div>

            <div class="movie_box">
              <a href="/collection?pickIndex=4">
                <ul class="photo_list">
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1564736653/ihvrpr0kvdza7lyiggst.jpg">
                  </li>
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1466062816/ykldf9sazup0otph9jzu.jpg">
                  </li>
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_400,q_80,w_280/v1573532655/knwacv81c3ajrk8kyx8a.jpg">
                  </li>
                  <li class="photo_box">
                    <img class="photo-img"
                      src="https://an2-img.amz.wtchn.net/image/v2/396c4c0d402b0191a6bb3478f6b81d28.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPalF3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFeU16VTVNemcwT0RNd056SXlOamt4SWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqb3lPREI5LjBFNzcteDZseGpRZVJxYmZyV3ZfRDl1a1ZZeHF1dWlvWVFvNTlGZVJjdzQ">
                  </li>
                </ul>

                <h4 class="collection_title"> 개발자 윤지 PICK! </h4>
              </a>
            </div>

            <button class="slick-prev" aria-label="Previous" type="button"></button>
            <button class="slick-next" aria-label="Next" type="button"></button>

          </div>
        </div>
 <a id="MOVE_TOP_BTN" href="#"><i class="fas fa-arrow-up" id="up"></i></a> <!-- 스크롤 이벤트용 -->
      </section>

    </main>
</div>

<!-- footer -->
<jsp:include page="footer.jsp"/>
<!-- footer 끝 -->

  <script src="/js/main/movieslider.js"></script> <!-- 제일 위에 와야 함 -->
  <script src="/js/main/scroll.js"></script> 
  <script src="/js/bootstrap.bundle.min.js"></script>
</body>
</html>