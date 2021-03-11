<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header" id="modal-title-wrapper">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			<div id="modal-contents">
				<div id="movie-info">
				<input type="text" id = "movieDocIdInModal" value="${movieInfoVo.movieDocId }"/>
					<div id="modal-movie-poster">
						<img src="${movieInfoVo.posterUri }" alt="">
					</div>
					<div id="title-and-year">
						<div style="font-weight: bold; font-size: 20px;">${movieInfoVo.title }</div>
						<div>${movieInfoVo.prodYear }</div>
					</div>
				</div>
				<div id="wanna-watch-or-rating">
					<a href="" data-dismiss="modal" aria-label="Close">
						<div id="wanna-watch-button">
							<img src="/img/movie/bookmark_gray.svg" alt="">
							<div>보고싶어요</div>
						</div>
					</a> <a href="" data-toggle="modal"
						data-target="#rating-and-comment-modal" data-dismiss="modal"
						aria-label="Close">
						<div id="rating-button">
							<img src="/img/movie/comment.svg">
							<div>별점 및</div>
							<div>코멘트 남기기</div>
						</div>
					</a>

				</div>
			</div>
		</div>
		<div class="modal-footer" id="footer-buttons">
			<div>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" id="button-for-cancel">취소</button>
			</div>
		</div>
	</div>
</div>