// 별점 부여 후 코멘트 div 나타내는 스크립트
var buttonForShowDiv = document.getElementById("star-rating");
var memberCommentDiv = document.getElementById("member-comment-zone");
var afterCommentZone = document.getElementById("after-comment-zone");
var starIndexInput = document.getElementById("starIndex");

$('#star-rating-member > .star').on('click', function () {
	var target = $(event.target);
	var ratedStar = $(this).html();
	var starCount = $(this).prevAll().length / 2 + 0.5;
	ratedStar = starCount; // ok

	var movieDocId = $("#movieDocIdInModal").val(); // ok

	$.ajax({
		type: 'POST',
		url: '/starRatingControl',
		async: false,
		data: "movieDocId=" + movieDocId + "&starRating=" + ratedStar,
		success: function (resultMap) {
			console.log(resultMap);
			console.log($(event.target));
			if (resultMap.result == 1) { // 별점 남기기 

				target.addClass('on').prevAll('span').addClass('on');
				memberCommentDiv.style.display = "block";
				starIndexInput.value = resultMap.starIndex;
				
				var starMessage = document.getElementById("star-message");

				switch (ratedStar) {
					case 0.5:
						starMessage.innerText = "최악이에요";
						break;
					case 1:
						starMessage.innerText = "싫어요";
						break;
					case 1.5:
						starMessage.innerText = "재미없어요";
						break;
					case 2:
						starMessage.innerText = "별로예요";
						break;
					case 2.5:
						starMessage.innerText = "부족해요";
						break;
					case 3:
						starMessage.innerText = "보통이에요";
						break;
					case 3.5:
						starMessage.innerText = "볼만해요";
						break;
					case 4:
						starMessage.innerText = "재미있어요";
						break;
					case 4.5:
						starMessage.innerText = "훌륭해요!";
						break;
					case 5:
						starMessage.innerText = "최고예요!";
						break;

				}

			} else if (resultMap.result == 0) {
				target.parent().children().removeClass('on');
				var starMessage = document.getElementById("star-message");
				starMessage.innerText = "평가하기";
				memberCommentDiv.style.display = "none";
				afterCommentZone.style.display = "none";

			}
		},
		error: function () {
			console.log('error!');


		}



	});



})

// 모달 내부 별점

// 코멘트 작성 후 div 바뀌게 하는 스크립트
var afterCommentDiv = document.getElementById("after-comment-zone");
var memberCommentZone = document.getElementById("modal-only-comment-zone");
var myCommentZone = document.getElementById("my-comment-zone");
var commentEditZone = document.getElementById("modal-only-comment-edit-zone");

function val() {
	var commentOfMember = memberCommentZone.value;
	console.log(commentOfMember);

	myCommentZone.innerHTML = commentOfMember;
	memberCommentDiv.style.display = "none";
	afterCommentDiv.style.display = "block";

}

// modal 내에서 코멘트 작성 후 div 바뀌는 스크립트
function modalCommentSubmit() {
	var commentOfMember = document.getElementById("rating-modal-comment-zone").value;
	console.log(commentOfMember);

	myCommentZone.innerHTML = commentOfMember;
	memberCommentDiv.style.display = "none";
	afterCommentDiv.style.display = "block";
}
