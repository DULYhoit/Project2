<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    <link rel="stylesheet" href="/css/mypage/indexnew.css">
    <link rel="stylesheet" href="/css/mypage/mypageratedmoviesfinal.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> <!-- 차트 링크 --> 
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> 
    <title>EUTCHAPEDIA</title>
</head>

<body>
  <jsp:include page="/WEB-INF/view/user/header.jsp"/>

      <div class='mybody-wrapper'>
        <div class='iconwrapper'>
            <a  href="/mypage/index_member?id=${id}">
                <img  data-bs-toggle="tooltip" data-bs-placement="top" title="마이페이지로 이동" src="/img/mypage/arrow-left-short.svg" alt="" width="40" height="40" >
            </a>
        </div>

        <div class="title">평가한 작품들</div> 
        <div class='option-wrapper'>
            <ul class="tabui">
                <li class="listyle" id='tab1' data-tab="tab1">전체</li>
                <li class="listyle2" id='tab2' data-tab="tab1">별점 순</li>
            </ul>
        </div>

        <!-- tabone 시작 -->
            <div class='tabone' id='tab1'>
                <div class='sortwrapper'>
            
                    <a class="sortbtn" data-toggle="modal" href="#myModal" style="text-decoration:none; color:black">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                            <path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                        </svg>
                   ${sortTitle }
                    </a>
                    <p></p>
                    <!-- Modal -->
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog modal-sm modal-dialog-centered modal-dialog-scrollable" >
                        <!-- Modal content-->
                        <div class="modal-content" id="modal-div">
                            <div class="modal-header" id="modal-header" >
                                <h4 class="modal-title" id='modal-title'>평가한 작품들
                                    <button type="button" class="close" id="xbtn" data-dismiss="modal">×</button>
                                </h4>
                            </div>
                            <div class="modal-body">
                                <div>
                                    <div id="sorttext"><a  href='/mypage/ratedmovies_member?id=${id }&sort=1' style="text-decoration:none; color:black" >가나다 순</a></div>
                                    <div id="sorttext"><a  href='/mypage/ratedmovies_member?id=${id }&sort=2' style="text-decoration:none; color:black">구작 순</a></div>
                                    <div id="sorttext"><a  href='/mypage/ratedmovies_member?id=${id }&sort=3' style="text-decoration:none; color:black">신작 순</a></div>
                                    <div id="sorttext"><a  href='/mypage/ratedmovies_member?id=${id }&sort=4' style="text-decoration:none; color:black">러닝타임 긴 순</a></div>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
            </div>
            
             <c:forEach var="n" items="${list}" >
            <div class='moviewrapper'>
                <div class='movie-div'>
                    <a href="/movie/detail?movieDocId=${n.movieDocId }"> 
                        <img class="poster" src="${n.posterUri}" width="150px";  height="200px"; alt="포스터없음">
                    </a>
                    <div class="movietitle">${n.title }</div>
                    <!-- <li>2018 | 드라마</li> -->
                </div>
            </div>
            </c:forEach>
            
        </div> 
        <!--tabone 끝-->

        <!-- tabtwo시작 -->
        <div class='tabtwo' id='tab2'>
        
            <div class='dividestar'>
                <div class="title-sub">5.0점 준 영화
                    <span class='starcount'> ${fn:length(five)} </span>
                    <span ><a  class='starallview' href='/mypage/starviewmore_member?id=${id }&sort=1'>더보기</a></span>

                </div> 
                
                <c:forEach var="n" items="${five}" begin="0" end="8" >
	                <div class='moviewrapper'>
	                    <div class='movie-div'>
	                        <a href="/movie/detail?movieDocId=${n.movieDocId }"> 
	                            <img class="poster" src="${n.posterUri}" width="150px";  height="200px"; alt="포스터없음">
	                        </a>
	                        <li class="movietitle">${n.title }</li>
	                        <!-- <li>2018 | 드라마</li> -->
	                    </div>
	                </div>
                </c:forEach>
        
            </div>
            
            <div class='dividestar'>
                <div class="title-sub">4.5점 준 영화
                    <span class='starcount'>${fn:length(fourdot)}</span>
                    <span ><a  class='starallview' href='/mypage/starviewmore_member?id=${id }&sort=2'>더보기</a></span>
                </div> 
                <c:forEach var="n" items="${fourdot}" begin="0" end="8" >
	                <div class='moviewrapper'>
	                    <div class='movie-div'>
	                        <a href="/movie/detail?movieDocId=${n.movieDocId }"> 
	                            <img class="poster" src="${n.posterUri}" width="150px";  height="200px"; alt="포스터없음">
	                        </a>
	                        <li class="movietitle">${n.title }</li>
	                        <!-- <li>2018 | 드라마</li> -->
	                    </div>
	                </div>
                </c:forEach>
            </div>
    
            <div class='dividestar'>
                <div class="title-sub">4.0점 준 영화
                    <span class='starcount'>${fn:length(four)}</span>
                    <span ><a  class='starallview' href='/mypage/starviewmore_member?id=${id }&sort=3'>더보기</a></span>
                </div> 
                <c:forEach var="n" items="${four}" begin="0" end="8" >
	                <div class='moviewrapper'>
	                    <div class='movie-div'>
	                        <a href="/movie/detail?movieDocId=${n.movieDocId }"> 
	                            <img class="poster" src="${n.posterUri}" width="150px";  height="200px"; alt="포스터없음">
	                        </a>
	                        <li class="movietitle">${n.title }</li>
	                        <!-- <li>2018 | 드라마</li> -->
	                    </div>
	                </div>
                </c:forEach>
            </div>
    
            <div class='dividestar'>
                <div class="title-sub">3.5점 준 영화
                    <span class='starcount'>${fn:length(threedot)} </span>
                    <span ><a  class='starallview' href='/mypage/starviewmore_member?id=${id }&sort=4'>더보기</a></span>
                </div> 
                <c:forEach var="n" items="${threedot}" begin="0" end="8" >
	                <div class='moviewrapper'>
	                    <div class='movie-div'>
	                        <a href="/movie/detail?movieDocId=${n.movieDocId }"> 
	                            <img class="poster" src="${n.posterUri}" width="150px";  height="200px"; alt="포스터없음">
	                        </a>
	                        <li class="movietitle">${n.title }</li>
	                        <!-- <li>2018 | 드라마</li> -->
	                    </div>
	                </div>
                </c:forEach>
            </div>
    
            <div class='dividestar'>
                <div class="title-sub">3.0점 준 영화
                    <span class='starcount'> ${fn:length(three)}</span>
                    <span ><a  class='starallview' href='/mypage/starviewmore_member?id=${id }&sort=5'>더보기</a></span>
                </div> 
                <c:forEach var="n" items="${three}" begin="0" end="8" >
	                <div class='moviewrapper'>
	                    <div class='movie-div'>
	                        <a href="/movie/detail?movieDocId=${n.movieDocId }"> 
	                            <img class="poster" src="${n.posterUri}" width="150px";  height="200px"; alt="포스터없음">
	                        </a>
	                        <li class="movietitle">${n.title }</li>
	                        <!-- <li>2018 | 드라마</li> -->
	                    </div>
	                </div>
                </c:forEach>
            </div>
    
            <div class='dividestar'>
                <div class="title-sub">2.5점 준 영화
                    <span class='starcount'>${fn:length(twodot)}</span>
                    <span ><a  class='starallview' href='/mypage/starviewmore_member?id=${id }&sort=6'>더보기</a></span>
                </div> 
                <c:forEach var="n" items="${twodot}" begin="0" end="8">
	                <div class='moviewrapper'>
	                    <div class='movie-div'>
	                        <a href="/movie/detail?movieDocId=${n.movieDocId }"> 
	                            <img class="poster" src="${n.posterUri}" width="150px";  height="200px"; alt="포스터없음">
	                        </a>
	                        <li class="movietitle">${n.title }</li>
	                        <!-- <li>2018 | 드라마</li> -->
	                    </div>
	                </div>
                </c:forEach>
            </div>
    
            <div class='dividestar'>
                <div class="title-sub">2.0점 준 영화
                    <span class='starcount'>${fn:length(two)}</span>
                    <span ><a  class='starallview' href='/mypage/starviewmore_member?id=${id }&sort=7'>더보기</a></span>
                </div> 
                <c:forEach var="n" items="${two}" begin="0" end="8" >
	                <div class='moviewrapper'>
	                    <div class='movie-div'>
	                        <a href="/movie/detail?movieDocId=${n.movieDocId }"> 
	                            <img class="poster" src="${n.posterUri}" width="150px";  height="200px"; alt="포스터없음">
	                        </a>
	                        <li class="movietitle">${n.title }</li>
	                        <!-- <li>2018 | 드라마</li> -->
	                    </div>
	                </div>
                </c:forEach>
            </div>
    
            <div class='dividestar'>
                <div class="title-sub">1.5점 준 영화
                    <span class='starcount'>${fn:length(onedot)}</span>
                    <span ><a  class='starallview' href='/mypage/starviewmore_member?id=${id }&sort=8'>더보기</a></span>
                </div> 
                <c:forEach var="n" items="${onedot}" begin="0" end="8" >
	                <div class='moviewrapper'>
	                    <div class='movie-div'>
	                        <a href="/movie/detail?movieDocId=${n.movieDocId }"> 
	                            <img class="poster" src="${n.posterUri}" width="150px";  height="200px"; alt="포스터없음">
	                        </a>
	                        <li class="movietitle">${n.title }</li>
	                        <!-- <li>2018 | 드라마</li> -->
	                    </div>
	                </div>
                </c:forEach>
            </div>
    
            <div class='dividestar'>
                <div class="title-sub">1.0점 준 영화
                    <span class='starcount'>${fn:length(one)}</span>
                    <span ><a  class='starallview' href='/mypage/starviewmore_member?id=${id }&sort=9'>더보기</a></span>
                </div> 
                <c:forEach var="n" items="${one}" begin="0" end="8" >
	                <div class='moviewrapper'>
	                    <div class='movie-div'>
	                        <a href="/movie/detail?movieDocId=${n.movieDocId }"> 
	                            <img class="poster" src="${n.posterUri}" width="150px";  height="200px"; alt="포스터없음">
	                        </a>
	                        <li class="movietitle">${n.title }</li>
	                        <!-- <li>2018 | 드라마</li> -->
	                    </div>
	                </div>
                </c:forEach>
            </div>
    
            <div class='dividestar'>
                <div class="title-sub">0.5점 준 영화
                    <span class='starcount'>${fn:length(dot)}</span>
                    <span ><a  class='starallview' href='/mypage/starviewmore_member?id=${id }&sort=10'>더보기</a></span>
                <c:forEach var="n" items="${dot}"  begin="0" end="8">
	                <div class='moviewrapper'>
	                    <div class='movie-div'>
	                        <a href="/movie/detail?movieDocId=${n.movieDocId }"> 
	                            <img class="poster" src="${n.posterUri}" width="150px";  height="200px"; alt="포스터없음">
	                        </a>
	                        <li class="movietitle">${n.title }</li>
	                        <!-- <li>2018 | 드라마</li> -->
	                    </div>
	                </div>
                </c:forEach>
            </div>

        </div>
        <!--tabtwo끝-->
        </div>

    </div>
	<jsp:include page="/WEB-INF/view/user/footer.jsp"/>

    <!--부트스트랩이 jquery를 사용하고있어 어떠한 js파일보다 상위에 있어야함-->
    <script src="/js/jquery.min.js"></script>
    <!--부트스트랩 4버전부터 popper.js가필요함 bundle.min.js에 popper.js가 포함되어있음-->
    <script src="/js/bootstrap.bundle.min.js"></script>

    <script>
    	
        $(function() {

             $('#tab2').click(function() {
                 $('.tabone').css("display","none");
                 $('.tabtwo').css("display", 'block');
                 $('.listyle2').css("color", 'rgb(255, 47, 110)');
                 $('.listyle2').css("border-bottom", '3px solid rgb(255, 47, 110)');
                 $('.listyle').css("color", 'rgb(120, 120, 120)');
                 $('.listyle').css("border-bottom", '0');

            })

            $('#tab1').click(function() {
                 $('.tabone').css("display","block");
                 $('.tabtwo').css("display", 'none');
                 $('.listyle2').css("color", 'rgb(120, 120, 120)');
                 $('.listyle2').css("border-bottom", '0');
                 $('.listyle').css("color", 'rgb(255, 47, 110)');
                 $('.listyle').css("border-bottom", '3px solid rgb(255, 47, 110)');


                
            })
        });
    </script>
  </body>
    
</html>