<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="/css/bootstrap-reboot.min.css">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/admin/admin.css">
<title>회원정보조회</title>
</head>
<div class="container">
	<jsp:include page="/WEB-INF/view/admin/inc/header.jsp" />

	<!--content 반응형-->
	<div class="row">
		<jsp:include page="/WEB-INF/view/admin/inc/nav.jsp" />
		<!--section 반응형-->
		<div id="section-col" class="col-lg-10">

			<!--바디시작-->
			<div id="title">
				<h1 style="font-weight: bold;">회원정보조회</h1>
			</div>
			<div id="allsize" class="col-lg-12 ">
			 <form action="/admin/selectmember" method="get">
				<div id="search-block" class="col-lg-12 ">

					<select class="custom-select" id="select-search"  name="f">
						<option ${(param.f == "member_email")?"selected":""} value="member_email">이메일</option>
					   <option ${(param.f == "member_nickname")?"selected":""} value=member_nickname>닉네임</option>
					</select>
					<input type="text" id="searchbar"name="q" value="${param.q}" class="form-control" placeholder="검색항목" aria-label="Username" aria-describedby="basic-addon1">
					<button type="submit" class="btn btn-primary " id="search-btn">검색</button>
					</br>

				</div>
  			</form>
  			<form action="/admin/selectmember/delete" method="get">
  			
  			
				<div id="table-contorll" class="col-lg-12 ">
					<table class="table table-hover col-lg-12">
						<thead>
							<tr>
<!-- 체크박스 -->
								<th scope="col">선택</th>
								<th scope="col">이름</th>
								<th scope="col">이메일</th>
								<th scope="col">차단여부</th>
								<th scope="col">가입날자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="m" items="${memberlist}" end="10">
								<tr>
<!-- 체크박스 -->
									<td><input class="form-check-input" type="checkbox" 
										value= "${m.member_email}" id="userSelect" name="RowCheck"></td>
									<td>${m.member_nickname}</td>
									<td>${m.member_email}</td>
									<td>${m.member_status}</td>
									<td>${m.member_date}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					</br>
			
					<div id="chooseBox">



						<select class="custom-select" id="select-block" name="status">
					<option ${(param.status == "N")?"selected":""} value="N">차단해제</option>
					<option ${(param.status == "B")?"selected":""} value="B">영구차단</option>
					<option ${(param.status == "C")?"selected":""} value="C">코멘트차단</option>
						</select>

						<button type="button" class="btn btn-primary " id="block-btn"
							data-toggle="modal" data-target="#blockUser">차단설정</button>
						<button type="button" class="btn btn-primary " id="delete-btn"
							data-toggle="modal" data-target="#deleteUser">삭제</button>

						<div class="modal fade" id="blockUser" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">유저차단</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">선택한 유저를 차단하겠습니까?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">취소</button>
										<button type="submit" name="sub" value="1" class="btn btn-primary">확인</button>
									</div>
								</div>
							</div>
						</div>

						<div class="modal fade" id="deleteUser" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">유저삭제</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">선택한 유저를 삭제하겠습니다?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">취소</button>
										<button type="submit" name="sub" value="2" class="btn btn-primary">확인</button>
									</div>
								</div>
							</div>
						</div>
						</div>
						</div>
						</form>







					</div>

					<div id="navigation">
						<c:set var="page" value="${(param.p == null)?1:param.p}" />
						<c:set var="startNum" value="${page-(page-1)%5}" />
						<c:set var="lastNum"
							value="${fn:substringBefore(Math.ceil(count/10),'.')}" />

						<div style="margin-bottom: 30px">
							<span>현재페이지 ${(empty param.p)?1:param.p}</span> /${lastNum}
						</div>
						<nav id="select-pagination"
							aria-label="Page navigation example">
							<ul id="select-page" class="pagination">


								<c:forEach var="i" begin="0" end="4">
									<c:if test="${(startNum+i) <= lastNum}">
										<li class="page-item ${(page==(startNum+i))?'active':''}"><a
											class="page-link"
											href="?p=${startNum+i}&f=${param.f}&q=${param.q}">${startNum+i}</a></li>
									</c:if>

								</c:forEach>

							</ul>
						</nav>
					</div>
				</div>
			</div>








		</div>
	</div>
</div>






<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/accordion.js"></script>
<body>

</body>
</html>