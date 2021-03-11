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
    <link rel="stylesheet" href="/css/movie/movie_detail_common.css" type="text/css" />
    <link rel="stylesheet" href="/css/movie/movie_detail.css" type="text/css" />
     <link rel="stylesheet" href="/css/movie/movie_detail_member.css" type="text/css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="/css/bootstrap-grid.min.css" type="text/css" />
    <link rel="stylesheet" href="/css/bootstrap-reboot.min.css" type="text/css" />
     <!--icon-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <script src="/js/jquery.min.js"></script>
    <!-- slick js-->
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- slick css -->
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <!-- xeicon -->
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
<!-- header -->
 <jsp:include page="/WEB-INF/view/user/header.jsp"/>
<!-- header 끝 -->
	<%if(session.getAttribute("memberEmail") == null ) { %>
    <div id="main-container">
        <div id="basic-info-and-rating">
            <div id="poster">
                <img alt="" src="${movieInfoVo.posterUri }" style="width: 160px; height: 240px" />
            </div>
            <div id="basic-info">
                <h1 id="title">${movieInfoVo.title }</h1>
                <div id="year-genre-country">${movieInfoVo.prodYear }・${movieInfoVo.genre }・${movieInfoVo.nation }</div>
                <div id="star-average">평균 ★${starAvgMap.STARAVG }(${starAvgMap.STARCNT }명)</div>
                <div id="watch-or-comment">
					<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" id="wanna-watch"
	                        data-target="#wanna-watch-modal">보고싶어요</button>
                </div>

                <!-- Modal -->
                <div class="modal fade" id="wanna-watch-modal" tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                   <jsp:include page="modal/wanna_watch_non_member.jsp"/>
                </div>

                <div id="star-rating">
                    <p>평가하기</p>
                    <div class="starRev" data-toggle="modal" data-target="#star-rating-modal">
                        <span class="star starR1">0.5</span>
                        <span class="star starR2">1</span>
                        <span class="star starR1">1.5</span>
                        <span class="star starR2">2</span>
                        <span class="star starR1">2.5</span>
                        <span class="star starR2">3</span>
                        <span class="star starR1">3.5</span>
                        <span class="star starR2">4</span>
                        <span class="star starR1">4.5</span>
                        <span class="star starR2">5</span>
                    </div>

                </div>

                <div class="modal fade" id="star-rating-modal" tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <jsp:include page="modal/star_rating_non_member.jsp"/>
                </div>

            </div>
        </div>
        <div id="main-info-container">
            <div id="trailer-zone" class="detail-info">
                <div id="trailer-title">
                    <h4>예고편</h4>
                </div>
                <div id="video-zone">
                    <iframe width="900" height="550" src="${movieInfoVo.movieTrailer }" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                </div>
            </div>
            <div class="detail-info" id="movie-basic-info">
                <div>
                    <h4>기본 정보</h4>
                    <span class="more-info"><a href="/movie/detail/overview?movieDocId=${movieInfoVo.movieDocId }">더보기</a></span>
                </div>
                <div>${movieInfoVo.titleOrg }</div>
                <div>${movieInfoVo.prodYear }・${movieInfoVo.genre }・${movieInfoVo.nation }</div>
                <div>${movieInfoVo.movieRunningTime }분</div>
                <div id="plot">
                    <p>${movieInfoVo.plot}</p>
                </div>
            </div>

            <div id="staffs">
                <div class="detail-info">
                    <h4 id="actor-and-pd">출연/제작</h4>
                    <div class="my-slider" id="staffs-slider">
                        <c:forEach var="staffList" items="${staffList }">
							<div class='slider-elements'>
		                        <a href="/movie/detail/staff?staffId=${staffList.staffId}">
		                                <img src="/img/movie/profile.svg" class="profile-img">
		                                <div class="name-and-role">
			                                	<input type="hidden" value="${staffList.staffId }"/>
											<div class="staff-name">${staffList.staffName }</div>
											<div class="staff-role">${staffList.staffRoleGroup }</div>
											<div>${staffList.staffRole }</div>
			                                    
		                                </div>
	                        		</a>
	                       </div>
	                    </c:forEach>
                    </div>
                </div>
				<div class="detail-info">
					<h4>별점 그래프</h4>
					<div id="chart-container">
						<c:if test="${!empty starDataList }">
							<canvas id="myChart" style="width: 600px; height: 300px;"></canvas>
						</c:if>
						<c:if test="${empty starDataList }">
							<div class="data-empty-message">별점 데이터가 없습니다.<br/>지금 바로 평가해보세요!</div>
						</c:if>
					</div>
				</div>
				<div class="detail-info">
					<h4>코멘트</h4>
					<c:if test="${!empty commentList }">
						<span class="more-info"><a
							href="/comment/overview?movieDocId=${movieInfoVo.movieDocId }">더보기</a></span>
						<div id="comment-zone">
							<c:forEach var="commentList" items="${commentList }">
								<div class="comment-card">
									<div class="user-info-and-rating">
										<input type="hidden" name="commentIndex"
											value="${commentList.COMMENTINDEX }" /> <img
											src="${commentList.PHOTO }" class="profile-img">
										<div class="user-nickname">${commentList.NICKNAME }</div>
										<div class="comment-star-rating">★ ${commentList.STARS }</div>
									</div>
									<div class="comment">
										<!-- 데이터 받아올 때 하나의 p태그에 넣고 줄바꿈은 br 태그로 처리 -->
										<p>${commentList.TEXT }</p>
									</div>
									<div class="like-count-zone">
										<img src="/img/movie/like.svg" id="like-thumb" /> <span
											id="like-count">${commentList.LIKECOUNT }</span>
									</div>
									<div class="like-and-report">
										<span><button data-toggle="modal" id="like-button"
												data-target="#like-modal">좋아요</button></span> <span><button
												data-toggle="modal" id="report-button"
												data-target="#report-modal">신고하기</button></span>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:if>
					<c:if test="${empty commentList }">
						<div class="data-empty-message">
							코멘트 데이터가 없습니다.<br />지금 바로 평가해보세요!
						</div>
					</c:if>
					<!-- like Modal -->
					<div class="modal fade" id="like-modal" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<jsp:include page="modal/like_modal_non_member.jsp" />
					</div>

					<!-- siren Modal -->
					<div class="modal fade" id="report-modal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<jsp:include page="modal/report_modal_non_member.jsp" />
					</div>

				</div>
				<div class="detail-info" id="collection">
					<h4>이 작품이 담긴 컬렉션</h4>
					<div>
						<div class="my-slider" id="collection-slider">
							<div class="collection-zone">
								<c:if test="${!empty collectionMap }">
									<c:forEach var="collectionMap" items="${collectionMap}">
										<c:forEach var="items" items="${collectionMap.value }"
											begin="0" end="0">
											<div class="collection-card">
												<ul class="photo_list">

													<a href="/collection?pickIndex=${items.pickIndex }">
														<li class="photo_box"><img class="photo-img"
															src="${items.posterUri }"></li>
													</a>

												</ul>
											</div>

											<div class="collection-title">${items.pickName }</div>

										</c:forEach>
									</c:forEach>
								</c:if>
								<c:if test="${empty collectionMap }">
									<div class="data-empty-message">컬렉션 데이터가 없습니다.</div>
								</c:if>
							</div>
						</div>

					</div>
				</div>


			</div>
        </div>
        
        <%} else { %>
         <div id="main-container">
        <div id="basic-info-and-rating">
			<div id="poster">
                <img alt="" src="${movieInfoVo.posterUri }" style="width: 160px; height: 240px" />
            </div>
            <div id="basic-info">
                <h1 id="title">${movieInfoVo.title }</h1>
                <div id="year-genre-country">${movieInfoVo.prodYear }・${movieInfoVo.genre }・${movieInfoVo.nation }</div>
                <div id="star-average">평균 ★${starAvgMap.STARAVG }(${starAvgMap.STARCNT }명)</div>
                <div id="watch-or-comment">
					<c:choose>
	                <c:when test="${wannaWatchCheck eq '0' }">
	                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" id="wanna-watch"
	                        data-target="#wanna-watch-modal">보고싶어요</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" id="wanna-watch-after"
	                        data-target="#wanna-watch-modal">+ 보고싶어요</button>
					</c:otherwise>
					</c:choose>
                </div>
                
                <!-- 보고싶어요/별점 및 코멘트 남기기 Modal -->
                <div class="modal fade" id="wanna-watch-modal" tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
					<jsp:include page="modal/wanna_watch_member.jsp"/>
                </div>

                <!-- 별점 및 코멘트 남기기 모달 -->
                <div class="modal fade" id="rating-and-comment-modal" tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <jsp:include page="modal/rating_and_comment_modal.jsp"/>
                </div>
				<!-- if 끝 -->


                <div id="star-rating">
                    <p id="star-message">평가하기</p>
                    <input type="hidden" id="ratedStars" value="${starRatingVo.starRating }"/>
                    <input type="hidden" id="starIndex" value="${starRatingVo.starIndex }"/>
                    <div class="starRev" id="star-rating-member">
                        <span class="star starR1">0.5</span>
                        <span class="star starR2">1</span>
                        <span class="star starR1">1.5</span>
                        <span class="star starR2">2</span>
                        <span class="star starR1">2.5</span>
                        <span class="star starR2">3</span>
                        <span class="star starR1">3.5</span>
                        <span class="star starR2">4</span>
                        <span class="star starR1">4.5</span>
                        <span class="star starR2">5</span>
                    </div>
                </div>


            </div>
        </div>
        <input type="hidden" id="commentIndexOfMember" value="${commentVo.commentIndex }"/>
        <input type="hidden" id="commentTextOfMember" value="${commentVo.commentText }"/>
        <div id="member-comment-zone">
            <div id="comment-zone-ment">멋진 평가네요. ${memberNickname } 님의 생각을 글로 남겨보세요.</div>
            <div><button id="write-comment-button" data-toggle="modal" data-target="#comment-modal"
                    data-dismiss="modal">코멘트 남기기</button></div>
        </div>

        <div id="after-comment-zone">
            <div id="my-comment-zone"></div>
            <div id="buttons-edit-delete">
                <div><button id="btn-edit" data-toggle="modal" data-target="#comment-edit-modal"
                        onclick="editComment()">수정하기</button></div>
                <div><button id="btn-delete" data-toggle="modal" data-target="#comment-delete-modal">삭제하기</button></div>
            </div>
        </div>

        <!-- 코멘트 남기기 모달 -->

        <div class="modal fade" id="comment-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <jsp:include page="modal/write_comment_modal.jsp"/>
        </div>

        <!-- 코멘트 수정하기 모달 -->

        <div class="modal fade" id="comment-edit-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
           <jsp:include page="modal/update_comment_modal.jsp"/>
        </div>

        <!-- 코멘트 삭제하기 모달 -->
        <div class="modal fade" id="comment-delete-modal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <jsp:include page="modal/delete_comment_modal.jsp"/>
        </div>


		<!-- 공통 -->
			<div id="main-info-container">
				<div id="trailer-zone" class="detail-info">
					<div id="trailer-title">
						<h4>예고편</h4>
					</div>
					<div id="video-zone">
						<iframe width="900" height="550"
							src="${movieInfoVo.movieTrailer }"  frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
				</div>
				<div class="detail-info" id="movie-basic-info">
					<div>
						<h4>기본 정보</h4>
						<span class="more-info"><a
							href="/movie/detail/overview?movieDocId=${movieInfoVo.movieDocId }">더보기</a></span>
					</div>
					<div>${movieInfoVo.titleOrg }</div>
					<div>${movieInfoVo.prodYear }・${movieInfoVo.genre }・${movieInfoVo.nation }</div>
					<div>${movieInfoVo.movieRunningTime }분</div>
					<div id="plot">
						<p>${movieInfoVo.plot}</p>
					</div>
				</div>

				<div id="staffs">
					<div class="detail-info">
						<h4 id="actor-and-pd">출연/제작</h4>
						<div class="my-slider" id="staffs-slider">
							<c:forEach var="staffList" items="${staffList }">
								<div class='slider-elements'>
									<a href="/movie/detail/staff?staffId=${staffList.staffId}">
										<img src="/img/movie/profile.svg" class="profile-img">
										<div class="name-and-role">
											<input type="hidden" value="${staffList.staffId }" />
											<div class="staff-name">${staffList.staffName }</div>
											<div class="staff-role">${staffList.staffRoleGroup }</div>
											<div>${staffList.staffRole }</div>

										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="detail-info">
						<h4>별점 그래프</h4>
						<div id="chart-container">
						<c:if test="${!empty starDataList }">
							<canvas id="myChart" style="width: 600px; height: 300px;"></canvas>
						</c:if>
						<c:if test="${empty starDataList }">
							<div class="data-empty-message">별점 데이터가 없습니다.<br/>지금 바로 평가해보세요!</div>
						</c:if>
						</div>
					</div>
					<div class="detail-info">
						<h4>코멘트</h4>
						<c:if test="${!empty commentList }">
						<span class="more-info"><a
							href="/comment/overview?movieDocId=${movieInfoVo.movieDocId }">더보기</a></span>
						<div id="comment-zone">
							<c:forEach var="commentList" items="${commentList }">
								<div class="comment-card">
									<div class="user-info-and-rating">
										<input type="hidden" id="commentIndex" class="commentIndex"
											name="commentIndex" value="${commentList.COMMENTINDEX }" />
										<img src="${commentList.PHOTO }" class="profile-img">
										<div class="user-nickname">${commentList.NICKNAME }</div>
										<div class="comment-star-rating">★ ${commentList.STARS }</div>
									</div>
									<div class="comment">
										<!-- 데이터 받아올 때 하나의 p태그에 넣고 줄바꿈은 br 태그로 처리 -->
										<p>${commentList.TEXT }</p>
									</div>
									<div class="like-count-zone">
										<img src="/img/movie/like.svg" id="like-thumb" /> <span
											id="like-count${commentList.COMMENTINDEX }"
											class="like-count">${commentList.LIKECOUNT }</span>
									</div>
									<div class="like-and-report">
										<span><button data-toggle="modal"
												id="like-button${commentList.COMMENTINDEX }"
												class="like-button"
												onclick="clickLikeButton(${commentList.COMMENTINDEX})">좋아요</button></span>
										<span><button data-toggle="modal" id="report-button"
												data-target="#report-modal${commentList.COMMENTINDEX }">신고하기</button></span>
									</div>

									<!-- siren Modal(member) -->
									<div class="modal fade"
										id="report-modal${commentList.COMMENTINDEX }" tabindex="-1"
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
															<div>${commentList.NICKNAME }</div>
														</div>
														<div id="report-modal-comment-contents">
															<h5>내용</h5>
															<p>${commentList.TEXT }</p>
														</div>
														<textarea id="report-modal-comment-zone" name="reportText"
															row="1" cols="1" rows="1" placeholder="신고하시는 이유를 작성해주세요."
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
														id="button-for-submit"
														onclick="submitReport(${commentList.COMMENTINDEX})">확인</button>
												</div>
											</div>
										</div>


									</div>
									<!-- modal 끝 -->
								</div>
							</c:forEach>

						</div>
						</c:if>
						<c:if test="${empty commentList }">
						<div class="data-empty-message">
							코멘트 데이터가 없습니다.<br />지금 바로 평가해보세요!
						</div>
						</c:if>
						<!-- 신고 결과 모달 -->
						<div class="modal fade" id="report-result-modal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<jsp:include page="modal/report_modal_complete.jsp" />
						</div>
					</div>

					<div class="detail-info" id="collection">
						<h4>이 작품이 담긴 컬렉션</h4>
						<div>
							<div class="my-slider" id="collection-slider">
								<div class="collection-zone">
									<c:if test="${!empty collectionMap }">
										<c:forEach var="collectionMap" items="${collectionMap}">
											<c:forEach var="items" items="${collectionMap.value }"
												begin="0" end="0">
												<div class="collection-card">
													<ul class="photo_list">

														<a href="/collection?pickIndex=${items.pickIndex }">
															<li class="photo_box"><img class="photo-img"
																src="${items.posterUri }"></li>
														</a>

													</ul>
												</div>

												<div class="collection-title">${items.pickName }</div>

											</c:forEach>
										</c:forEach>
									</c:if>
									<c:if test="${empty collectionMap }">
										<div class="data-empty-message">컬렉션 데이터가 없습니다.</div>
									</c:if>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>

			<%} %>
        <!-- 여기부터 footer-->
        <jsp:include page="/WEB-INF/view/user/footer.jsp"/>
        <!-- footer 끝 -->
    <!-- scripts -->

        <script src="/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<script src="/js/movie/movie_detail_member.js"></script>
		<script src="/js/movie/commentCRUD.js"></script>
        <script>
			var starData = [];
	        var starLabels = [];
	
	        <c:forEach var="starDataList" items="${starDataList}">
	        	starData.push('${starDataList.CNT}');
	        	starLabels.push('${starDataList.STARDATA}');
	        </c:forEach>
	
	        var ctx = document.getElementById("myChart");
	        var myChart = new Chart(ctx, {
	            type: 'bar',
	            data: {
	                labels: starLabels,
	                datasets: [{
	                    label: '별점',
	                    data: starData,
	                    backgroundColor: [
	                        'rgba(255, 99 , 132, 0.2)',
	                        'rgba(255, 99 , 132, 0.2)',
	                        'rgba(255, 99 , 132, 0.2)',
	                        'rgba(255, 99 , 132, 0.2)',
	                        'rgba(255, 99 , 132, 0.2)',
	                        'rgba(255, 99 , 132, 0.2)',
	                        'rgba(255, 99 , 132, 0.2)',
	                        'rgba(255, 99 , 132, 0.2)',
	                        'rgba(255, 99 , 132, 0.2)',
	                        'rgba(255, 99 , 132, 0.2)'
	                    ],
	                    borderColor: [
	                        'rgba(255, 99 , 132, 1)',
	                        'rgba(255, 99 , 132, 1)',
	                        'rgba(255, 99 , 132, 1)',
	                        'rgba(255, 99 , 132, 1)',
	                        'rgba(255, 99 , 132, 1)',
	                        'rgba(255, 99 , 132, 1)',
	                        'rgba(255, 99 , 132, 1)',
	                        'rgba(255, 99 , 132, 1)',
	                        'rgba(255, 99 , 132, 1)',
	                        'rgba(255, 99 , 132, 1)',
	                    ],
	                    borderWidth: 1
	                }]
	            },
	            options: {
	                maintainAspectRatio: false,
	                legend: { display: false },
	                scales: {
	                    xAxes: [{
	                        gridLines: {
	                            display: false
	                        }
	                    }],
	                    yAxes: [{
	                        ticks: {
	                            beginAtZero: true,
	                            stepSize: 30
	                        },
	                        gridLines: {
	                            display: false
	                        }
	                    }]
	                }
	            }
	        }
	        );

			function clickLikeButton(cIndex) {
				var commentIndex = cIndex;
				var idx = $(event.target);
				
				var likeCountIndex = "like-count" + commentIndex;
				
				console.log(idx.parents('div').find('.like-count'));
				$.ajax({
					type : 'POST',
					url : '/commentLike',
					async : false,
					data : "commentIndex=" + commentIndex,
					success : function(result) {
						
						if (result.likeCheck == 1) {
							idx.css("background-color", "rgb(255, 7, 88)");
							idx.css("color", "white");
							
						} else if (result.likeCheck == 0) {
							idx.css("background-color", "#e3e3e3")
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
				console.log(commentIndex);
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


			$("#wanna-watch-button").on('click', function() {
				var movieDocId = document.getElementById("movieDocIdInModal").value;
				console.log(movieDocId);
				var bookmarkDiv = $(event.target);
				
				$.ajax({
					type : 'POST',
					url : '/wannaWatchControl',
					async : false,
					data : "movieDocId=" + movieDocId,
					success : function(resultMap) {
						if (resultMap.result == 0) {
							$('#wanna-watch-after').text("보고싶어요");
							$('#wanna-watch-after').attr("id", "wanna-watch")
						    $('#wanna-watch-button').css('background-color', 'white');
						    
						} else if (resultMap.result == 1) {
							$('#wanna-watch').text("+ 보고싶어요");
						    $('#wanna-watch').attr("id", "wanna-watch-after")
						    $('#wanna-watch-button').css('background-color', '#eee');
						    
						} 

					},
					error : function() {
						alert('error!');
						
						}


					});
				})
				
				window.onload = function() {
					var ratedStars = document.getElementById("ratedStars").value;
					var ratedStarsForAddClass = ratedStars * 2;
					var starMessage = document.getElementById("star-message").innerText;
					var addClassSelector = 'star-rating-member span:nth-child(' + ratedStarsForAddClass + ')';

					var memberCommentZone = document.getElementById("member-comment-zone");
					
					if (	ratedStars > 0) {
						$('#' + addClassSelector).addClass('on').prevAll('span').addClass('on');

					memberCommentZone.style.display = "block";

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

				var commentIndex = document.getElementById("commentIndexOfMember").value;
				var commentText = document.getElementById("commentTextOfMember").value;
				var afterCommentDiv = document.getElementById("after-comment-zone");
				var myCommentZone = document.getElementById("my-comment-zone");
				
				
				if (commentIndex != "" && commentText != "") {
					myCommentZone.innerHTML = commentText;
					afterCommentDiv.style.display = "block";

					}
				if (ratedStars > 0 && commentText != "") {
					memberCommentZone.style.display = "none";

					}
				
			}
			
        </script>
        <script src="/js/movie/myslider.js"></script>
</body>

</html>