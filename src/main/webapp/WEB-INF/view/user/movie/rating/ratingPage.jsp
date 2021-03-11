<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/movie/index.css" type="text/css" />
<link rel="shortcut icon" href="/img/logo_favicon.ico">
<!--favicon-->
<link rel="icon" href="/img/logo_favicon.ico">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<!--icon-->

<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="/css/bootstrap-reboot.min.css">
<link rel="stylesheet" href="/css/movie/giveStar.css">
<script src="/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
	integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
	integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
	crossorigin="anonymous"></script>


<title>평가하기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	<div id="allcontents">
		<div id="top_wrap">
			<h1 id="howMany">오늘은 어떤영화를 보셨나요?</h1>

			<h1 id="count_comment"></h1>
	 <form action="/movie/movierate" method="get">
			<select class="custom-select" id="select-search"   onchange="formChange(this.form)"  name="f">
					
				<option ${(param.f == "action")?"selected":""} value="action"  >액션/스릴러/범죄</option>
				<option ${(param.f == "romance")?"selected":""} value="romance">멜로/로맨스</option>
				<option ${(param.f == "sf")?"selected":""} value="sf">판타지/SF</option>
				<option ${(param.f == "drama")?"selected":""} value="drama">드라마</option>
				<option ${(param.f == "horror")?"selected":""} value="horror">공포</option>
				<option ${(param.f == "etc")?"selected":""} value="etc">기타</option>
				

			</select>
			

			

			
					<button type="submit" class="btn btn-primary " id="search-btn">검색</button>
			</form>
		</div>

		<c:forEach var="m" items="${movies}" varStatus="vs" end="10">
			<div id="mid_wrap">
				<ul class="movie">
					<li class="eachMovie">

						<div class="movie_poster">
							<div class="movie_wrap">
								<img class="movie_image" src="${m.poster_uri}" onClick="location.href='/movie/detail?movieDocId=${m.movie_docid}'">
							</div>
						</div>

						<div class="movie_name">
							<h3 class="movie_title" >
								${m.title}
								<div class="modal_button">
									<button class="fas fa-ellipsis-v" id="modal_btn"
										data-toggle="modal" data-target="#exampleModal${vs.index}"></button>
								</div>
							</h3>
							<div class="movie_info">${m.prodyear}-${m.nation}</div>
							<div id="star-rating-zone">
								<div class="starRev">
									<span class="star starR1">0.5</span> <span class="star starR2">1</span>
									<span class="star starR1">1.5</span> <span class="star starR2">2</span>
									<span class="star starR1">2.5</span> <span class="star starR2">3</span>
									<span class="star starR1">3.5</span> <span class="star starR2">4</span>
									<span class="star starR1">4.5</span> <span class="star starR2">5</span>
								</div>

							</div>
						</div>
					</li>
				</ul>
			</div>


<!--  
		 <div class="movielist">
            <h1>Page 1</h1>
        </div>
        <div class="movielist">
            <h1>Page 2</h1>
        </div>
     -->

			<div class="modal fade" id="exampleModal${vs.index}" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"></h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<div class="movie_content">
								<div class="movie_poster">

									<div class="movie_wrap">

										<img class="movie_image" src="${m.poster_uri}">

									</div>
								</div>
								<div class=" css-1sondvb-ContentInfo e1pa47va1 ">
									<div class="movie_name">

										<h3 class="movie_title">
											${m.title}

											<div class="modal_button"></div>
										</h3>
										<div class="movie_info">${m.prodyear}-${m.nation}</div>
									</div>
								</div>
							</div>
							<div class="css-1k6r5nr-RowActionButtons e1pa47va5">
								<div aria-label="wished" role="button"
									class="css-1s4ktoa-RowActionButton-WishButton e1pa47va7">
									<img src="/img/movie/bookmark_gray.svg" alt="wished"><span>보고싶어요</span>
								</div>
								<div aria-label="watching" role="button"
									class="css-9gb35z-RowActionButton-WatchingButton e1pa47va8">
									<img src="/img/movie/comment.svg" alt="wished"><span>코멘트
										작성하기</span>
								</div>
							</div>



							<div class="modal-footer">
								<div aria-label="cancel" role="button"
									class="css-4w0dnp-ColumnActionButton-CancelButton e1pa47va11"
									data-dismiss="modal">취소</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</c:forEach>
	
	</div>


	<script src="/js/movie/star.js"></script>
	<script src="/js/movie/scroll.js"></script>
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.bundle.min.js"></script>

</body>
</html>