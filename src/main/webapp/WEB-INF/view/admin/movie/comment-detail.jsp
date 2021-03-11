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
		<jsp:include page="/WEB-INF/view/admin/inc/header.jsp" />
		<!-- header 끝 -->

		<!--content 반응형-->
		<!-- row div는 깨면안됨 -->
		<div class="row">


			<!--nav영역-->
			<!-- nav시작 -->
			<jsp:include page="/WEB-INF/view/admin/inc/nav.jsp" />
			<!-- nav끝 -->
			<!--section 반응형-->
			<div id="section-col" class="col-lg-10">
				<div id="pick-h1">
					<h1>신고 상세</h1>

				</div>
				<div id="comment-move-container">
					<div id="comment-move-enrollment"
						style="background-color: #3498DB;">
						<h2>뒤로가기</h2>
					</div>

				</div>
				<div id="comment-input-data" class="col-lg-12">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">코멘트번호</th>
								<th scope="col">신고자아이디</th>
								<th scope="col">신고내용</th>
								<th scope="col">코맨트내용</th>


							</tr>
						</thead>
						<tbody>
							<c:forEach items="${commentdetail}" var="d">
								<tr>
									<td>${d.fkCommentIndex}</td>
									<td>${d.fkMemberEmail}</td>
									<td>${d.reportText}</td>
									<td>${d.commentText}</td>
								</tr>
							</c:forEach>




						</tbody>
					</table>

				</div>
				<c:set var="page" value="${(param.p == null)?1:param.p}" />
				<c:set var="startNum" value="${page-(page-1)%5}" />
				<c:set var="lastNum"
					value="${fn:substringBefore(Math.ceil(count/10),'.')}" />
				<c:set var="commentno" value="${ci}" />
				<div style="margin-bottom: 30px; text-align: center;">
					<span>현재페이지 ${(empty param.p)?1:param.p}</span> /${lastNum} page
				</div>
				<nav id="comment-data-page" aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${startNum-1>0}">
							<li class="page-item"><a class="page-link"
								href="?p=${startNum-1}">이전</a></li>
						</c:if>
						<c:if test="${startNum<=1}">
							<li class="page-item"><a class="page-link"
								onclick="alert('첫번째 페이지입니다.')">이전</a></li>
						</c:if>

						<c:forEach var="i" begin="0" end="4">
							<c:if test="${(startNum+i) <= lastNum}">
								<li class="page-item ${(page==(startNum+i))?'active':''}"><a
									class="page-link"
									href="?p=${startNum+i}&commentno=${commentno}">${startNum+i}</a></li>
							</c:if>

						</c:forEach>
						<c:if test="${startNum+4<lastNum}">
							<li class="page-item"><a class="page-link"
								href="?p=${startNum+5}">다음</a></li>
						</c:if>
						<c:if test="${startNum+4>=lastNum}">
							<li class="page-item"><a class="page-link"
								onclick="alert('다음 페이지가 없습니다.')">다음</a></li>
						</c:if>
					</ul>
				</nav>
				<div id="btn-container">

					<button id="comment-del-all" type="button" class="btn btn-primary"
						data-toggle="modal" data-target="#c-del-all">블라인드</button>
					<!--modal2-->
					<div class="modal fade" id="c-del-all" tabindex="-1"
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
								<div class="modal-body">블라인드 하시겠습니까?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary"
										onclick="location.href='/admin/commentenroll/detail/blindon?commentno=${commentno}'">확인</button>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>




		</div>
	</div>
	<script src="/js/jquery.min.js"></script>

	<script src="/js/bootstrap.bundle.min.js"></script>
	<script src="/js/admin/adminmovie/js/accordion.js"></script>
	<script>
      $("#comment-move-enrollment").click(function(){

    	
          var url = "/admin/commentenroll";
          location.href = url;
          });
      </script>



</body>
</html>