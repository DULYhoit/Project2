<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header" id="rating-and-comment-modal-header">
			<h5 class="modal-title" id="rating-and-comment-modal-title">코멘트
				등록하기</h5>
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			<div id="rating-and-comment-modal-contents">
				<div id="modal-movie-title">
					<h5>${movieInfoVo.title }</h5>
				</div>

				<textarea id="modal-only-comment-zone" row="1" cols="1" rows="1"
					placeholder="이 영화에 대한 감상평을 자유롭게 남겨주세요."
					style="resize: none; width: 400px; height: 300px; padding: 10px;"></textarea>
			</div>
		</div>
		<div class="modal-footer" id="footer-buttons">
			<div>
				<button type="button" class="btn btn-secondary" data-dismiss="modal"
					aria-label="Close" id="button-for-cancel">취소</button>
				<button type="button" class="btn btn-primary"
					id="button-for-comment-submit" data-dismiss="modal" onclick="submitComment()">확인</button>
			</div>
		</div>
	</div>
</div>