<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title">코멘트 삭제하기</h5>
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body" id="comment-delete-contents">
			<h5>코멘트를 삭제하시겠습니까?</h5>
		</div>
		<div class="modal-footer" id="footer-buttons">
			<button type="button" class="btn btn-secondary" data-dismiss="modal"
				id="button-for-cancel">취소</button>
			<button type="button" class="btn btn-primary" data-dismiss="modal"
				id="button-for-delete-submit" onclick="deleteComment()">확인</button>
		</div>
	</div>
</div>