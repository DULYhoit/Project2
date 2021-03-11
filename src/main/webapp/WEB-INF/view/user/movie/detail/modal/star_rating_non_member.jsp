<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 비회원 별점 모달 -->
<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header" id="modal-title-wrapper">
			<h5 class="modal-title" id="exampleModalLabel"></h5>
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			<div id="modal-contents">
				<img src="/img/movie/star_rated.svg">
				<p>로그인이 필요한 기능이에요.</p>
				<p>회원가입 혹은 로그인 후 이용해주세요.</p>
			</div>
		</div>
		<div class="modal-footer" id="footer-buttons">
			<div class="footer-button-wrapper">
				<button type="button" class="btn btn-secondary"
					id="button-for-signup" onclick="location.href='/signup'">회원가입</button>
			</div>
			<div>
				<button type="button" class="btn btn-primary" id="button-for-signin"
				onclick="location.href='/login'">로그인</button>
			</div>
		</div>
	</div>
</div>