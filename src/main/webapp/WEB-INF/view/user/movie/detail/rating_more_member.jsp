<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/css/bootstrap-grid.min.css"
	type="text/css" />
<link rel="stylesheet" href="/css/bootstrap-reboot.min.css"
	type="text/css" />
<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="/css/movie/index.css" type="text/css" />
<link rel="stylesheet" href="/css/movie/rating_more_member.css"
	type="text/css" />

</head>

<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/user/header.jsp" />
	<!-- header 끝 -->
	<div id="main-container">
		<div>
			<button id="back-button"
				onclick="location.href='/movie/detail?/member?movieDocId=${movieDocId}'">←</button>
		</div>
		<form method="GET" name="comment_overview" id="comment_overview"
			onsubmit="return false;">
			<input type="hidden" name="movieDocId" id="movieDocId" value="${movieDocId }" /> 
			<input type="hidden" value="${page.sortBy }" />
			<div class="title">코멘트</div>
			<div class="title" id="rating-title">
				관람객 평점 <span style="font-weight: bold;">${commentCount }</span>건
			</div>
			<div class="dropdown" id="sort-dropdown">
				<select id="sort-dropdown-select" name="sortBy"
					onchange="selectOpt(this.options[this.selectedIndex.value])">
					<option value="">정렬 기준 선택</option>
					<option value="Likes">좋아요 많은 순</option>
					<option value="Latest">최신순</option>
					<option value="HighStars">평점 높은 순</option>
					<option value="LowStars">평점 낮은 순</option>
				</select>
			</div>
			<div class="rating-zone" id="rating-zone">
				<c:forEach var="commentList" items="${commentList }">
					<div class="comment-card">
						<input type="hidden" value="${commentList.commentIndex }" />
						<div class="profile-and-rating">
							<div class="profile">
								<img src="${commentList.photo }" alt=""> <span
									class="nickname">${commentList.nickname }</span>
							</div>
							<div class="rating">
								★ <span>${commentList.stars }</span>
							</div>
						</div>
						<div class="comment-and-date">
							<div class="comment">
								<p>${commentList.commentText }</p>

							</div>
							<div class="date">${commentList.commentDate }</div>

						</div>
						<div class="like">
							<img src="/img/movie/like.svg" alt=""> <span
								id="like-count${commentList.commentIndex }">${commentList.likeCount }</span>
						</div>
						<!-- member zone -->
						<div class="like-and-report">
							<span><button data-toggle="modal"
									id="like-button${commentList.commentIndex }"
									onclick="clickLikeButton(${commentList.commentIndex})">좋아요</button></span>
							<span><button data-toggle="modal" id="report-button"
									data-target="#report-modal${commentList.commentIndex }">신고하기</button></span>
						</div>
						<!-- siren Modal(member) -->
						<div class="modal fade"
							id="report-modal${commentList.commentIndex }" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">

							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header" id="modal-title-wrapper">
										<h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div id="report-modal-contents">
										
											<div id="report-modal-movie-title">
												<h5>제목</h5>
												<div>${movieInfoVo.title }</div>
											</div>
											<div id="report-modal-author">
												<h5>작성자</h5>
												<div>${commentList.nickname }</div>
											</div>
											<div id="report-modal-comment-contents">
												<h5>내용</h5>
												<p>${commentList.commentText }</p>
											</div>
											<textarea id="report-modal-comment-zone" row="1" cols="1"
												rows="1" placeholder="신고하시는 이유를 작성해주세요."
												style="resize: none; width: 450px; height: 300px; padding: 10px;"></textarea>
										</div>
									</div>
									<div class="modal-footer" id="footer-buttons">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal" aria-label="Close"
											id="button-for-cancel">취소</button>
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#report-result-modal"
											data-dismiss="modal" aria-label="Close"
											id="button-for-submit">확인</button>
									</div>
								</div>
							</div>


						</div>
						<!-- modal 끝 -->
					</div>
				</c:forEach>


			</div>

			<!-- paging -->

			<div class="paging-zone">
				<input type="hidden" name="nowPage" id="nowPage"
					value="${empty param.nowPage ? 1 : param.nowPage }" />
				<c:if test="${page.startPage > 1 }">
					<input type='button' value="처음" id="btnFirst" onclick="goPage(1)" />
					<input type="button" value="이전" id="btnPrev"
						onclick="goPage(${page.startPage - 1})" />
				</c:if>


				<c:forEach var='i' begin='${page.startPage }' end='${page.endPage }'>
					<input type='button' value='${i }'
						${(param.nowPage == i) ? 'disabled' : '' } onclick='goPage(${i})' />
				</c:forEach>

				<c:if test="${page.endPage < page.totalPage }">
					<input type='button' value='다음' id="btnNext"
						onclick="goPage(${page.endPage + 1})" />
					<input type="button" value="맨끝" id="btnLast"
						onclick="goPage(${page.totalPage})" />
				</c:if>

			</div>
		</form>

	</div>
	<!-- footer 시작 -->
	<jsp:include page="/WEB-INF/view/user/footer.jsp" />
	<!-- footer 끝 -->


	<!-- scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.bundle.min.js"></script>
	<script>
    	function goPage(page) {
    		var frm = document.getElementById("comment_overview");
			var nowDropdown = document.getElementById('sort-dropdown-select');

			frm.nowPage.value = page;
			frm.sortBy.selectedIndex.value = nowDropdown.selectedIndex.value;
			frm.action ="/comment/overview/member?movieDocId=${movieDocId }&sortBy=${page.sortBy }nowPage=${param.nowPage}";
			frm.submit();
        }

        function selectOpt(option) {
    		var frm = document.getElementById("comment_overview");
			var nowDropdown = document.getElementById('sort-dropdown-select');

			frm.sortBy.value = nowDropdown.value;
			frm.action ="/comment/overview/member?movieDocId=${movieDocId }&sortBy=${page.sortBy }nowPage=${param.nowPage}";
			frm.submit();
			
        }

        function clickLikeButton(cIndex) {
			var commentIndex = cIndex;
			var idx = $(event.target);
			
			var likeCountIndex = "like-count" + commentIndex;
			
			$.ajax({
				type : 'POST',
				url : '/commentLike',
				/* async : false, */
				data : "commentIndex=" + commentIndex,
				success : function(result) {
					
					if (result.likeCheck == 1) {
						idx.css("background-color", "rgb(255, 7, 88)");
						idx.css("color", "white");
						
					} else if (result.likeCheck == 0) {
						idx.css("background-color", "white")
						idx.css("color", "black");

						}
					$("#" + likeCountIndex).empty();
					$("#" + likeCountIndex).append(result.likeCount);
					

					},
				error : function() {
					alert("error!");

					}

				});
				

			}

		function reportComment() {
			

			}
    	
        </script>

</body>
</html>