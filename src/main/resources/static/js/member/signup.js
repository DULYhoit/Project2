
// 필수 항목 입력 검사
var requiredCheck = false;

/*var isEmail;
var isNick;*/

// 닉네임 유효성 검사
$("#input-nickname").focusout(function () {
	var nickname = $("#input-nickname").val();
	var nicknameCheckRegExp = /^[가-힣a-z0-9]{2,8}$/;
	var nicknameExists;

	var nicknameCheck = function () {
		if (nickname == "") {
			$("#nickname-required").html("닉네임을 입력해 주세요.");
			$("#nickname-required").css("display", "inline-block");
			$("#nickname-required").css("color", "rgb(245, 0, 0)");
			$("#input-nickname").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
			requiredCheck = false;

		} else if (!nicknameCheckRegExp.test(nickname)) {
			$("#nickname-required").html("정확하지 않은 닉네임입니다.");
			$("#nickname-required").css("display", "inline-block");
			$("#nickname-required").css("color", "rgb(245, 0, 0)");
			$("#input-nickname").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
			requiredCheck = false;

		} else if (nicknameCheckRegExp.test(nickname)) {
			$("#nickname-required").html("사용 가능한 닉네임입니다.");
			$("#nickname-required").css("display", "inline-block");
			$("#nickname-required").css("color", "rgb(23, 173, 0)");
			$("#input-nickname").css({"background-color": "rgb(220, 250, 218)", "border" : "1px solid rgb(218, 216, 218)", "color": "black"});
			requiredCheck = true;
		}
	}

	$.ajax({
		type: 'POST',
		url: '/nicknamechk',
		async: false,
		/*dataType:'json',
		contentType: "application/json; charset=UTF-8",*/
		data: { 'memberNickname': nickname },
		success: function (result) {

			if (result == 1) {
				$("#nickname-required").html("사용 중인 닉네임입니다.");
				$("#nickname-required").css("display", "inline-block");
				$("#nickname-required").css("color", "rgb(245, 0, 0)");
				$("#input-nickname").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
				requiredCheck = false;

			} else if (result == 0) {
				$("#nickname-required").html("test");
				$("#nickname-required").css("display", "inline-block");
				$("#nickname-required").css("color", "rgb(245, 0, 0)");
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

//이메일 유효성 검사
$("#input-email").focusout(function () {
	var email = $("#input-email").val();
	var emailCheckRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var emailExists;

	var emailCheck = function () {
		if (email == "") {
			$("#email-required").html("이메일을 입력해 주세요.");
			$("#email-required").css("display", "inline-block");
			$("#email-required").css("color", "rgb(245, 0, 0)");
			$("#input-email").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
			requiredCheck = false;

		} else if (!emailCheckRegExp.test(email)) {
			$("#email-required").html("이메일 형식에 맞지 않습니다.");
			$("#email-required").css("display", "inline-block");
			$("#email-required").css("color", "rgb(245, 0, 0)");
			$("#input-email").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
			requiredCheck = false;

		} else if (emailCheckRegExp.test(email)) {
			$("#email-required").html("사용 가능한 이메일입니다.");
			$("#email-required").css("display", "inline-block");
			$("#email-required").css("color", "rgb(23, 173, 0)");
			$("#input-email").css({"background-color": "rgb(220, 250, 218)", "border" : "1px solid rgb(218, 216, 218)", "color": "black"});
			requiredCheck = true;

		}
	}

	console.log(email);

	$.ajax({
		type: 'POST',
		url: '/emailchk',
		async: false,
		/*dataType:'json',
	contentType: 'application/json; charset=UTF-8',*/
		data: { 'memberEmail': email },
		success: function (result) {
			if (result == 1) {
				$("#email-required").html("사용 중인 이메일 주소입니다.");
				$("#email-required").css("display", "inline-block");
				$("#email-required").css("color", "rgb(245, 0, 0)");
				$("#input-email").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
				requiredCheck = false;
				emailExists = result;

			} else if (result == 0) {
				$("#email-required").html("이메일test");
				$("#email-required").css("display", "inline-block");
				requiredCheck = true;
				emailExists = result;
			}

		}

	})

	console.log(emailExists);

	if (emailExists == 0) {
		emailCheck();
	}

})

$("#input-password").focusout(function () {
	var password = $("#input-password").val();
	var numRegExp = password.search(/[0-9]/g);
	var engRegExp = password.search(/[a-z]/ig);
	var specialRegExp = password.search(/[~!?@#$%^&*();:_+=/-]/gi);

	if (password == "") {
		$("#password-required").html("비밀번호는 필수 정보입니다.");
		$("#password-required").css("display", "inline-block");
		$("#password-required").css("color", "rgb(245, 0, 0)");
		$("#input-password").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
		requiredCheck = false;

	} else if (password.length < 8) {
		$("#password-required").html("8자리 이상 입력해주세요.");
		$("#password-required").css("display", "inline-block");
		$("#password-required").css("color", "rgb(245, 0, 0)");
		$("#input-password").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
		requiredCheck = false;
		return false;

	} else if (password.search(/\s/) != -1) {
		$("#password-required").html("비밀번호에는 공백을 사용할 수 없습니다.");
		$("#password-required").css("display", "inline-block");
		$("#password-required").css("color", "rgb(245, 0, 0)");
		$("#input-password").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
		requiredCheck = false;
		return false;

	} else if (numRegExp < 0 || engRegExp < 0 || specialRegExp < 0) {
		$("#password-required").html("영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
		$("#password-required").css("display", "inline-block");
		$("#password-required").css("color", "rgb(245, 0, 0)");
		$("#input-password").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
		requiredCheck = false;
		return false;

	} else {
		$("#password-required").css("display", "none");
		requiredCheck = true;
		return true;
	}
})





