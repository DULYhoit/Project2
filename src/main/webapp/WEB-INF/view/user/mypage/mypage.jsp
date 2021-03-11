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
    <link rel="shortcut icon" href="/img/logo_favicon.ico">
    <link rel="icon" href="/img/logo_favicon.ico">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="/css/mypage/mypagenew.css">
    <link rel="stylesheet" href="/css/mypage/indexnew.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> 
    <title>EUTCHAPEDIA</title>
</head>

<body>
   <jsp:include page="/WEB-INF/view/user/header.jsp"/>
        
        
    <h3 class="main-title">
        <div class='title-div'>
         마이페이지
         <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-bookmark-heart" viewBox="0 0 16 16">
             <path fill-rule="evenodd" d="M8 4.41c1.387-1.425 4.854 1.07 0 4.277C3.146 5.48 6.613 2.986 8 4.412z"/>
             <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 
             1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
           </svg>
         </div>
     </h3>  
    <div class="mybody-wrapper">
        <div class="mybody">
            <div class="left">
                
                <div id='profileimg'>
                	<c:set var="name" value='/img/mypage/originprofile.jpg' />
            		<c:set var="name2" value='${member.memberPhoto}' />    
                    <c:choose>
	            		<c:when test="${name == name2}"> 
	                		<img  src='${member.memberPhoto}' width="200px"; height="250px">
	                	</c:when>
	                	<c:when test="${name != name2}">
	               			 <img src='/static/upload/${member.memberPhoto}' width="200px"; height="250px">
	                	</c:when>
					</c:choose>
                </div>
                
                <h4 id='nickname'>${member.memberNickname }</h4>

                <p class="info-title">───Introduce───</p>
                
                <div class="info">
                	<p class="info-text">${member.memberIntroduce }</p>
                </div>

                <div class="sidebar">
                    <div class='sidebar-menu'><a href="/mypage/mycomment">코멘트 관리</a></div><p></p>
                    <div class='sidebar-menu'><a href="/mypage/myq">나의 문의</a></div><p></p>
                    <div class='sidebar-menu'><a href="/mypage/edit">정보 수정</a></div>
                </div>
                
            </div>
            
            <div class="center">
                <div class="center1">
                    <p></p>
                    <h4>영화</h4>
                    <span class='sub-title'>보고싶어요</span><span class='starcount'> ${wannacount } </span>
		            	<a href='/mypage/wannawatch?sort=1'> <!-- 보고싶어요 링크 이동 -->
				          <div class='center1-box'>
				          
				          	<c:set var="size" value='${size}' />
		                    <c:choose>
		            		<c:when test="${size == 0}"> 
		                		
		                		<div class='nochoose'>
		                			<div class='ment'>
		                				<a href='/'>아직 보고싶은 영화가 없으시군요 ! <br>영화 탐색하러 가기</a>
		                			</div>
		                		</div>
		                	</c:when>
		                	<c:when test="${size != 0}">
		               			 <c:forEach var="n" items="${wannawatch}" begin="0" end="7">
				                	<div class='center-box-img'><img id='posterimg' src="${n.posterUri}" width="110px"; height="135px" alt="포스터없음"></div>
                    			</c:forEach> 
		                	</c:when>
						</c:choose>
				          
				          <%-- 
                    		<c:forEach var="n" items="${wannawatch}" begin="1" end="8">
				                <div class='center-box-img'><img id='posterimg' src="${n.posterUri}" width="110px"; height="135px" alt="포스터없음"></div>
                    		</c:forEach>  --%>
				          </div>
		                </a>
                </div>

                <div class="center2">
                    <span class='sub-title'>평가한 작품</span><span class='starcount'> ${ratedStarNum } </span>
                    <a href='/mypage/ratedmovies?sort=1'> <!-- 평가한작품 링크 이동 -->
		            	<div class='center2-box'>
		            		
		            		<c:set var="ratesize" value='${ratesize}' />
		                    <c:choose>
		            		<c:when test="${ratesize == 0}"> 
		                		
		                		<div class='nochoose'>
		                			<div class='ment'>
		                				<a href='/movie/movierate'>아직 평가하신 영화가 없으시군요 ! <br>읏챠피디아의 다양한 영화 평가 하러 가기</a>
		                			</div>
		                		</div>
		                	</c:when>
		                	<c:when test="${ratesize != 0}">
		               			 <c:forEach var="star" items="${star}" begin="0" end="7">
				            		<div class='center-box-img'><img id='posterimg'src="${star.posterUri}" width="110px"; height="135px" alt="포스터없음"></div>
		                  		</c:forEach> 
		                	</c:when>
						</c:choose>
		            	
		                </div>
                     </a>
                </div>
            </div>

            <div class="right">
                
                <div class="right1">
                    <p></p>
                    <h4>취향 분석</h4>
                    <h6>별점 분포</h6>
                    <p></p>
                    <div class='right1-box'>
                      <canvas id="myChart"></canvas> 
                    </div>
                    <div class="right1-box-text">
                      <p >${avg }<br>별점평균</p>
                      <p >${ratedStarNum }<br>별점개수</p>
                      <p >${mostRatedStar.star }<br>많이 준 별점</p>
                    </div>
                </div>
                <div class="right2">
                    <h6>선호 장르</h6>
                    <div class='right2-box'>
                      <canvas id="myChart2"></canvas>
                    </div>
                </div>
                <div class="right3">
                    <h6>영화 감상 시간</h6>
                    <div class='right3-box'>
                        <h4>${hour}시간 ${minute}분</h4>
                        <p>조금 더 평가를 매겨 보세요!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<jsp:include page="/WEB-INF/view/user/footer.jsp"/>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.bundle.min.js"></script>
<!--<script src="/js/mypage/mypage_chart.js"></script>--> 
    <script>
    var ctx4 =document.getElementById('myChart2');
    var ctx3 = document.getElementById('myChart');

    var ratedNum = [];	


    <c:forEach var="n" items="${staramount}">
    	ratedNum.push('${n}');
    </c:forEach>
    
    //막대그래프
    var myChart = new Chart(ctx3, { 
        type: 'bar', 
        data: { labels: ['0.5', '1', '1.5', '2', '2.5', '3','3.5','4','4.5','5'], 
                datasets: [{ label: '별점분포', data: ratedNum, 
                backgroundColor: [ '#F6CADA', 
                                   '#F4BDD0', 
                                   '#EFAFC5', 
                                   '#EAA2BB', 
                                   '#DF99B1', 
                                   '#D58EA7',
                                   '#D38BA4',
                                   '#D387A2',
                                   '#CC869E',
                                   '#D884A1'
                                 ], 
                borderColor: [     '#F6CADA', 
    					           '#F4BDD0', 
    					           '#F4BDD0', 
    					           '#EFAFC5', 
    					           '#EAA2BB', 
    					           '#DF99B1',
    					           '#D58EA7',
    					           '#D38BA4',
    					           '#CC869E',
    					           '#D884A1'], 
                borderWidth: 1 
                }] 
              }, 
          options: { 
            maintainAspectRatio : false,
            legend : {display : false},
            scales: { 
              xAxes: [{
                gridLines: {
                display:false
                }
              }],
              yAxes: [{ 
                ticks: { 
                  beginAtZero: true,
                  stepSize : 5 },
                gridLines: {
                  display:false
                }
                   }] 
                  } 
                } 
              }
            ); 
    //도넛,파이 작성 2
    		var genre = [];
    		var num = [];

    	    <c:forEach var="n" items="${doughnutMap}">
    	    	genre.push('${n.genre}');
    	    </c:forEach>

    	    <c:forEach var="n" items="${doughnutMap}">
    	    	num.push('${n.count}');
    	    </c:forEach>
    	    
            var data = { 
              labels: genre, 
              datasets: [ { 
                data: num, 
                backgroundColor: [ 
                  "#EFA9AB", "#F2C7A9", "#F1E976", "#C6EBA7", "#A5E4EA", "#A0C4E5", "#C6AFED"], 
                borderWidth: 0, 
                label: "Dataset 1" 
              }] 
            }; 
            window.onload = function() { 
              var ctx8 = $('#myChart2').get(0).getContext("2d"); 
              window.theChart8 = new Chart(
                ctx8, { 
                  type: 'doughnut', 
                  data: data, 
                  options: { 
                    responsive: true, 
                    legend: false, 
                    maintainAspectRatio : false, 
                    animation: false, 
                    pieceLabel: { 
                      mode:"label", 
                      position:"border", 
                      fontSize: 11, 
                      fontStyle: 'bold' } 
                    } 
                  }
                )
            };

    </script>
  </body>
</html>