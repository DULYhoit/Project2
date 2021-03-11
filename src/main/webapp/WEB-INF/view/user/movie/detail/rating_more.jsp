<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EUTCHAPEDIA</title>
    <link rel="shortcut icon" href="/img/logo_favicon.ico">
    <link rel="stylesheet" href="/css/movie/index.css" type="text/css" />
    <link rel="stylesheet" href="/css/movie/rating_more.css" type="text/css" />
    <link rel="stylesheet" href="/css/movie/rating_more_member.css" type="text/css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="/css/bootstrap-grid.min.css" type="text/css" />
    <link rel="stylesheet" href="/css/bootstrap-reboot.min.css" type="text/css" />
    
    <!--icon-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <script src="/js/jquery.min.js"></script>
</head>

<body>
<!-- header -->
 <jsp:include page="/WEB-INF/view/user/header.jsp"/>
<!-- header 끝 -->
    <div id="main-container">
        <div>
            <button id="back-button" onclick="location.href='/movie/detail?movieDocId=${movieDocId}'">←</button>
        </div>
        <form method="GET" name="comment_overview" id="comment_overview" onsubmit="return false;">
        <input type="hidden" name="movieDocId" id="movieDocId" value="${movieDocId }"/>
        <input type="hidden" value="${page.sortBy }"/>
        <div class="title">코멘트</div>
        <div class="title" id="rating-title">관람객 평점 <span style="font-weight: bold;">${commentCount }</span>건</div>
        <div class="dropdown" id="sort-dropdown">
            <select id="sort-dropdown-select" name="sortBy" onchange="selectOpt(this.options[this.selectedIndex.value])">
                <option value="" ${page.sortBy == '' ? 'selected="selected"' : ''}>정렬 기준 선택</option>
                <option value="Likes" ${page.sortBy == 'Likes' ? 'selected="selected"' : ''}>좋아요 많은 순</option>
                <option value="Latest" ${page.sortBy == 'Latest' ? 'selected="selected"' : ''}>최신순</option>
                <option value="HighStars" ${page.sortBy == 'HighStars' ? 'selected="selected"' : ''}>평점 높은 순</option>
                <option value="LowStars" ${page.sortBy == 'LowStars' ? 'selected="selected"' : ''}>평점 낮은 순</option>
            </select>
        </div>
        <div class="rating-zone" id="rating-zone">
        <c:forEach var="commentList" items="${commentList }">
	            <div class="comment-card">
	                <div class="profile-and-rating">
	                    <div class="profile">
	                        <img src="${commentList.photo }" alt="">
	                        <span class="nickname">${commentList.nickname }</span>
	                    </div>
	                    <div class="rating">
	                        ★
	                        <span>${commentList.stars }</span>
	                    </div>
	                </div>
	                <div class="comment-and-date">
	                    <div class="comment">
	                        <p>${commentList.commentText }</p>
	                        
	                    </div>
	                    <div class="date">
	                        ${commentList.commentDate }
	                    </div>
	
	                </div>
	                <div class="like">
	                    <img src="/img/movie/like.svg" alt="">
	                    <span id="like-count${commentList.commentIndex }">${commentList.likeCount }</span>
	                </div>
			<!-- non-member zone -->
			<%if (session.getAttribute("memberEmail") == null) {%>
	                <div class="like-and-report">
	                	<span><button data-toggle="modal" id="like-button"
	                            data-target="#like-modal">좋아요</button></span>
	                    <span><button data-toggle="modal" id="report-button"
	                            data-target="#report-modal">신고하기</button></span>
	                </div>
		                
					<!-- like Modal -->
	                <div class="modal fade" id="like-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	                    aria-hidden="true">
	                    <jsp:include page="modal/like_modal_non_member.jsp"/>
	                </div>
	
	                <!-- siren Modal -->
	                <div class="modal fade" id="report-modal" tabindex="-1" role="dialog"
	                    aria-labelledby="exampleModalLabel" aria-hidden="true">
	                    <jsp:include page="modal/report_modal_non_member.jsp"/>
	                </div>
					<!-- member zone -->
	                <%} else { %>
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
										<input type="hidden" value="${commentList.commentIndex }"/>
											<div id="report-modal-movie-title">
												<h5>제목</h5>
												<div>${title }</div>
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
											id="button-for-submit" onclick="submitReport(${commentList.commentIndex})">확인</button>
									</div>
								</div>
							</div>


						</div>
						<!-- modal 끝 -->
						<!-- siren 결과 모달 -->
			            <div class="modal fade" id="report-result-modal" tabindex="-1" role="dialog"
			                aria-labelledby="exampleModalLabel" aria-hidden="true">
			                <jsp:include page="modal/report_modal_complete.jsp"/>
			            </div>
	                <%} %>
	            </div>
            </c:forEach>
            

        </div>
	
        <!-- paging -->
        
	        <div class="paging-zone">
	        <input type="hidden" name="nowPage" id="nowPage" value="${empty param.nowPage ? 1 : param.nowPage }"/>
						<c:if test="${page.startPage > 1 }">
							<input type='button' value="처음" id="btnFirst" onclick="goPage(1)" />
							<input type="button" value="이전" id="btnPrev" onclick="goPage(${page.startPage - 1})"/>
						</c:if>
						
						
						<c:forEach var='i' begin='${page.startPage }' end='${page.endPage }'>
							<input type='button' value='${i }' ${(param.nowPage == i) ? 'disabled' : '' } onclick='goPage(${i})' />
						</c:forEach>
						
						<c:if test="${page.endPage < page.totalPage }">
							<input type='button' value='다음' id="btnNext" onclick="goPage(${page.endPage + 1})" />
							<input type="button" value="맨끝" id="btnLast" onclick="goPage(${page.totalPage})"/> 
						</c:if>
	
	        </div>
        </form>
        
    </div>
	<!-- footer 시작 -->
	<jsp:include page="/WEB-INF/view/user/footer.jsp"/>
	<!-- footer 끝 -->


        <!-- scripts -->
        <script src="/js/bootstrap.bundle.min.js"></script>
        <script>
    	function goPage(page) {
    		var frm = document.getElementById("comment_overview");
			/* var nowPage = document.getElementById('nowPage'); */
			var nowDropdown = document.getElementById('sort-dropdown-select');

			frm.nowPage.value = page;
			
			console.log($(frm).serialize());
			frm.action ="/comment/overview?movieDocId=${movieDocId }&sortBy=${page.sortBy }nowPage=${param.nowPage}";
			frm.submit();
        }

        function selectOpt(option) {
    		var frm = document.getElementById("comment_overview");
			/* var nowPage = document.getElementById('nowPage'); */
			var nowDropdown = document.getElementById('sort-dropdown-select');

			frm.sortBy.value = nowDropdown.value;
			console.log($(frm).serialize());
			$(option).attr('selected', "selected");
			frm.action ="/comment/overview?movieDocId=${movieDocId }&sortBy=${page.sortBy }nowPage=${param.nowPage}";
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

    	function submitReport(cIndex) {
			var commentIndex = cIndex;
			var reportText = $("#report-modal-comment-zone").val();
			console.log(reportText);
			
			$.ajax({
				type : 'POST',
				url : '/reportComment',
				async : false,
				data : "commentIndex=" + commentIndex + "&reportText=" + reportText,
				success : function(result) {
					console.log(result);

					} ,

				error: function() {
					alert('error!');
	
					}

				});
				
        	}

    	window.onload = function() {
    		// 좋아요 누른 데이터 있으면 색칠되게 해놓기 완료 
			let likeMap = new Map();

	        <c:forEach var="likeDataList" items="${likeDataList}">
	        	likeMap.set("${likeDataList.commentIndex}", "${likeDataList.likeCheck}");
				var likeButton = "like-button" + "${likeDataList.commentIndex}";
	        	
				if (likeMap.get("${likeDataList.commentIndex}") == 1) {
					$("#" + likeButton).css("background-color", "rgb(255, 7, 88)");
					$("#" + likeButton).css("color", "white");
					}

				
	        </c:forEach>

	        console.log(likeMap);

        	}
    	
    	
        </script>
        
</body>

</html>
