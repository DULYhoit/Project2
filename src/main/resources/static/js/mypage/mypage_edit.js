

// 필수 항목 입력 검사
var requiredCheck = false;

/*var isEmail;
var isNick;*/

// 닉네임 유효성 검사
$("#memberNickname").focusout(function () {
	var nickname = $("#memberNickname").val();
	var nicknameCheckRegExp = /^[가-힣a-z0-9]{2,8}$/;
	var nicknameExists;

	var nicknameCheck = function () {
		if (nickname == "") {
			$("#info").html("닉네임을 입력해 주세요.");
			$("#info").css("color", "rgb(245, 0, 0)");
			$("#info").css("display", "inline-block");
			
			$("#memberNickname").css({"background-color": "white", "border" : "2px solid rgb(204,000,000)", "color": "black"});
			$("#memberNickname").focus();
			requiredCheck = false;

		} else if (!nicknameCheckRegExp.test(nickname)) {
			$("#info").html("닉네임 형식을 확인해 주세요.");
			$("#info").css("display", "inline-block");
			$("#info").css("color", "rgb(245, 0, 0)");
			$("#memberNickname").css({"background-color": "white", "border" : "2px solid red", "color": "black"});
			$("#memberNickname").focus();
			requiredCheck = false;

		} else if (nicknameCheckRegExp.test(nickname)) {
			$("#info").html("사용 가능한 닉네임입니다.");
			$("#info").css("display", "inline-block");
			$("#info").css("color", " rgb(23, 173, 0)");
			$("#memberNickname").css({"background-color" :" rgb(220, 250, 218)", "border" : "2px solid rgb(218, 216, 218)"});
			requiredCheck = true;
		}
	}

	$.ajax({
		type: 'POST',
		url: '/nicknamechk',
		async: false,
		data: { 'memberNickname': nickname },
		success: function (result) {

			if (result == 1) {
				$("#info").html("사용 중인 닉네임입니다.");
				$("#info").css("display", "inline-block");
				$("#info").css("color", "rgb(245, 0, 0)");
				$("#memberNickname").css({"background-color": "white", "border" : "2px solid red", "color": "black"})
				requiredCheck = false;

			} else if (result == 0) {
				$("#info").html("test");
				$("#info").css("display", "inline-block");
				$("#info").css("color", "rgb(245, 0, 0)");
				$("#memberNickname").css({"background-color" :" rgb(220, 250, 218)", "border" : "2px solid rgb(218, 216, 218)"});
				
				requiredCheck = true;
			}
			nicknameExists = result;

		}

	})
	console.log(nicknameExists);
	if (nicknameExists == 0) {
		nicknameCheck();
	}

})




$("#chgpwd1").focusout(function () {
	var password = $("#chgpwd1").val();
	var numRegExp = password.search(/[0-9]/g);
	var engRegExp = password.search(/[a-z]/ig);
	var specialRegExp = password.search(/[~!?@#$%^&*();:_+=/-]/gi);

	if (password == "") {
		$(".infopwd").html("변경하실 비밀번호를 입력해 주세요");
		$(".infopwd").css("display", "inline-block");
		$(".infopwd").css("color", "rgb(245, 0, 0)");
		$("#chgpwd1").css({"background-color": "white", "border" : "2px solid red", "color": "black"});
		$("#chgpwd1").focus();
		requiredCheck = false;

	} else if (password.length < 8) {
		$(".infopwd").html("8자리 이상 입력해주세요.");
		$(".infopwd").css("display", "inline-block");
		$(".infopwd").css("color", "rgb(245, 0, 0)");
		$("#chgpwd1").css({"background-color": "white", "border" : "2px solid red", "color": "black"})
		$("#chgpwd1").focus();
		requiredCheck = false;
		return false;

	} else if (password.search(/\s/) != -1) {
		$(".infopwd").html("비밀번호에는 공백을 사용할 수 없습니다.");
		$(".infopwd").css("display", "inline-block");
		$(".infopwd").css("color", "rgb(245, 0, 0)");
		$("#chgpwd1").css({"background-color": "white", "border" : "2px solid red", "color": "black"})
		$("#chgpwd1").focus();
		requiredCheck = false;
		return false;

	} else if (numRegExp < 0 || engRegExp < 0 || specialRegExp < 0) {
		$(".infopwd").html("영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
		$(".infopwd").css("display", "inline-block");
		$(".infopwd").css("color", "rgb(245, 0, 0)");
		$("#chgpwd1").css({"background-color": "white", "border" : "2px solid red", "color": "black"})
		$("#chgpwd1").focus();
		requiredCheck = false;
		return false;

	} else {
		$(".infopwd").html("재설정이 가능한 비밀번호 입니다.");
		$(".infopwd2").html("비밀번호를 다시 한 번 입력해 주세요.");
		
		$(".infopwd").css("color", " rgb(23, 173, 0)");
		$(".infopwd2").css("color", " rgb(23, 173, 0)");
		$(".infopwd").css("display", "inline-block");
		$("#chgpwd1").css({"background-color" :" rgb(220, 250, 218)", "border" : "2px solid rgb(218, 216, 218)"});
		requiredCheck = true;
		return true;
	}
})

$("#password2").focusout(function () {
	
	var password = $("#chgpwd1").val();
	var password2 = $("#password2").val();

	if (password2 == "") {
		$(".infopwd2").html("비밀번호 확인은 필수입니다.");
		$(".infopwd2").css("display", "inline-block");
		$(".infopwd2").css("color", "rgb(245, 0, 0)");
		$("#password2").css({"background-color": "white", "border" : "2px solid red", "color": "black"});
		$("#password2").focus();
		requiredCheck = false;

	}  else if (password != password2){
		
		$(".infopwd2").html("비밀번호가 일치하지 않습니다.");
		
		$(".infopwd2").css("color", " rgb(245, 0, 0)");
		$(".infopwd2").css("display", "inline-block");
		$("#password2").css({"background-color": "white", "border" : "2px solid red", "color": "black"});
		$("#password2").focus();
		requiredCheck = false;
		return false;
		
	}  else {
		$(".infopwd2").html("비밀번호가 일치합니다.");
		
		$(".infopwd2").css("color", " rgb(23, 173, 0)");
		$(".infopwd2").css("color", " rgb(23, 173, 0)");
		$(".infopwd2").css("display", "inline-block");
		$("#password2").css({"background-color" :" rgb(220, 250, 218)", "border" : "2px solid rgb(218, 216, 218)"});
		$("#introduce").focus();
		requiredCheck = true;
		return true;
	}
	
	
})






