<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EUTCHAPEDIA || ADMIN</title>
<link rel="stylesheet" href="/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="/css/bootstrap-reboot.min.css">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/admin/admin.css">
</head>
<body>
	<div class="container" style="height: 100%;">
		<!--헤더 반응형-->
		<!-- header시작 -->
		<!--content 반응형-->
		<jsp:include page="/WEB-INF/view/admin/inc/header.jsp" />
		<!-- header 끝 -->


		<!-- row div는 깨면안됨 -->
		<div class="row">


			<!--nav영역-->
			<!-- nav시작 -->
			<jsp:include page="/WEB-INF/view/admin/inc/nav.jsp" />
			<!-- nav끝 -->

			<!--section 반응형-->
			<div id="section-col" class="col-lg-10">


				<!-- 바디시작  -->
				<form action="/admin/moviemanagement/edit/submit">
				<c:set var="movie" value="${movieinfo}"></c:set>
				<div class="allcontents">
					<h1 id="pick-h1">DB관리-수정</h1>
					<div class="whiteBox" class="col-lg-10">
						<div id="db-input-text">
							<div id="db-mtext" class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"><a>영화id</a></span>
								</div>
								<input type="text" id="movienameval" name="docid" value="${movie.movie_docid}"
									class="form-control" aria-label="Username"
									aria-describedby="basic-addon1" readonly="readonly">
							</div>

						</div>
						<div id="db-input-text">
							<div id="db-mtext" class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"><a>영화제목</a></span>
								</div>
								<input type="text" id="movienameval" name="title" value="${movie.title}"
									class="form-control" aria-label="Username"
									aria-describedby="basic-addon1">
							</div>

						</div>
						<div id="db-input-text">
							<div id="db-mtext" class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"><a>원제명</a></span>
								</div>
								<input type="text" id="movienameval" name="titleorg" value="${movie.title_Org}"
									class="form-control" aria-label="Username"
									aria-describedby="basic-addon1">
							</div>

						</div>
						<div id="db-input-text">
							<div id="db-mtext" class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"><a>국가</a></span>
								</div>
								<input type="text" id="movienameval" name="nation" value="${movie.nation}"
									class="form-control" aria-label="Username"
									aria-describedby="basic-addon1">
							</div>

						</div>
						<div id="db-input-text">
							<div id="db-mtext" class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"><a>영화시간</a></span>
								</div>
								<input type="text" id="movienameval" name="runningtime" value="${movie.movie_running_time}"
									class="form-control" aria-label="Username"
									aria-describedby="basic-addon1">
							</div>

						</div>
						<div id="db-input-text">
							<div id="db-mtext" class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"><a>관람기준</a></span>
								</div>
								<input type="text" id="movienameval" name="rating" value="${movie.rating}"
									class="form-control" aria-label="Username"
									aria-describedby="basic-addon1">
							</div>

						</div>
						<div id="db-input-text">
							<div id="db-mtext" class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"><a>제작년도</a></span>
								</div>
								<input type="text" id="movienameval" name="prodyear" value="${movie.prodyear}"
									class="form-control" aria-label="Username"
									aria-describedby="basic-addon1">
							</div>

						</div>
						<div id="db-input-text">
							<div id="db-mtext" class="input-group mb-3"
								style="width: 700px">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"><a>포스터URI</a></span>
								</div>
								<input type="text" id="movienameval" name="posteruri"
									value="${movie.poster_uri}"
									class="form-control" aria-label="Username"
									aria-describedby="basic-addon1">
							</div>

						</div>
						<div id="db-input-text">
							<div id="db-mtext" class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"><a>장르</a></span>
								</div>
								<input type="text" id="movienameval" name="genre" value="${movie.genre}"
									class="form-control" aria-label="Username"
									aria-describedby="basic-addon1">
							</div>

						</div>

						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">영화 줄거리</span>
							</div>
							<textarea class="form-control" aria-label="With textarea" name="plot"
								rows="8">${movie.plot}</textarea>
						</div>

						<div id="db-input-text" style="margin-top: 15px">
							<div id="db-mtext" class="input-group mb-3"
								style="width: 700px">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"><a>예고편주소</a></span>
								</div>
								<input type="text" id="movienameval" name="traileruri" value="${movie.movie_trailer}"
									class="form-control" aria-label="Username"
									aria-describedby="basic-addon1">
							</div>

						</div>



						<div id="dbmanagement-btn-container">
							<button id="adddel-del-one" type="button" class="btn btn-primary"
								data-toggle="modal" data-target="#a-del-one">삭제</button>
							<!--modal1-->
							<div class="modal fade" id="a-del-one" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">해제</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">삭제를 하시겠습니까?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">취소</button>
											<button type="submit" name="sub" value="1"
												class="btn btn-primary">확인</button>
										</div>
									</div>
								</div>
							</div>
							<button id="adddel-del-all" type="button" class="btn btn-primary"
								data-toggle="modal" data-target="#a-del-all">수정</button>
							<!--modal2-->
							<div class="modal fade" id="a-del-all" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">해제</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">수정 하시겠습니까?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">취소</button>
											<button type="submit" name="sub" value="2"
												class="btn btn-primary">확인</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>



				</div>
				</form>
			</div>



		</div>
	</div>
	<script src="/js/jquery.min.js"></script>

	<script src="/js/bootstrap.bundle.min.js"></script>
	<script src="/js/admin/adminmovie/js/accordion.js"></script>
</body>
</html>