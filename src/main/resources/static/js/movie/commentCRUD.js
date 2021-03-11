/**
 * 
 */
var starIndex = document.getElementById("starIndex").value;

var memberCommentDiv = document.getElementById("member-comment-zone");
var afterCommentDiv = document.getElementById("after-comment-zone");
var memberCommentZone = document.getElementById("modal-only-comment-zone");
var myCommentZone = document.getElementById("my-comment-zone");
var commentEditZone = document.getElementById("modal-only-comment-edit-zone");

var commentIndex = document.getElementById("commentIndexOfMember").value;
var commentText = document.getElementById("commentTextOfMember").value;


function submitComment() {
	var memberComment = $("#modal-only-comment-zone").val();
	console.log(memberComment);
	$.ajax({
		type: 'POST',
		url: '/comment/insert',
		async: false,
		data: 'starIndex=' + starIndex + '&commentText=' + memberComment,
		success: function (resultMap) {
			myCommentZone.innerHTML = memberComment;
			memberCommentDiv.style.display = "none";
			afterCommentDiv.style.display = "block";
		},

		error: function () {
			alert('error!');

		}


	});

}

// 코멘트 수정하기
function editComment() {
	commentEditZone.innerHTML = commentText;
	console.log(commentEditZone.innerHTML);
}

// 코멘트 수정 제출
function editCommentSubmit() {
	var comment = commentEditZone.value;

	$.ajax({
		type: 'POST',
		url: '/comment/update',
		async: false,
		data: 'commentIndex=' + commentIndex + '&commentText=' + comment,
		success: function (resultMap) {
			console.log('hello!');
			myCommentZone.innerHTML = comment;
		},

		error: function () {
			alert('error!');
		}
	});
}

// 코멘트 삭제하기
function deleteComment() {
	 
	$.ajax({
		type: 'POST',
		url: '/comment/delete.do',
		async: false,
		data: 'commentIndex=' + commentIndex,
		success: function (resultMap) {
			console.log(resultMap);
			alert("코멘트가 삭제되었습니다.");
			afterCommentDiv.style.display = "none";
			memberCommentDiv.style.display = "block";
		},

		error: function () {
			alert('error!');
		}
	});
}


