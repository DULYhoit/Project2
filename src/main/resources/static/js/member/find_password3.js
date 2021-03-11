/**
 * 
 */
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
		$("#input-password").focus();
		requiredCheck = false;

	} else if (password.length < 8) {
		$("#password-required").html("8자리 이상 입력해주세요.");
		$("#password-required").css("display", "inline-block");
		$("#password-required").css("color", "rgb(245, 0, 0)");
		$("#input-password").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
		$("#input-password").focus();
		requiredCheck = false;
		return false;

	} else if (password.search(/\s/) != -1) {
		$("#password-required").html("비밀번호에는 공백을 사용할 수 없습니다.");
		$("#password-required").css("display", "inline-block");
		$("#password-required").css("color", "rgb(245, 0, 0)");
		$("#input-password").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
		$("#input-password").focus();
		requiredCheck = false;
		return false;

	} else if (numRegExp < 0 || engRegExp < 0 || specialRegExp < 0) {
		$("#password-required").html("영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
		$("#password-required").css("display", "inline-block");
		$("#password-required").css("color", "rgb(245, 0, 0)");
		$("#input-password").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
		$("#input-password").focus();
		requiredCheck = false;
		return false;

	} else {
		$("#password-required").html("재설정이 가능한 비밀번호 입니다.");
		$(".infopwd2").html("비밀번호를 다시 한 번 입력해 주세요.");
		
		$("#password-required").css("color", " rgb(23, 173, 0)");
		$(".infopwd2").css("color", " rgb(23, 173, 0)");
		$("#password-required").css("display", "inline-block");
		$("#input-password").css({"background-color" :" rgb(220, 250, 218)", "border" : "2px solid rgb(218, 216, 218)"});
		requiredCheck = true;
		return true;
	}
})

$("#password2").focusout(function () {
	
	var password = $("#input-password").val();
	var password2 = $("#password2").val();

	if (password2 == "") {
		$(".infopwd2").html("비밀번호 확인은 필수입니다.");
		$(".infopwd2").css("display", "inline-block");
		$(".infopwd2").css("color", "rgb(245, 0, 0)");
		$("#password2").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
		$("#password2").focus();
		requiredCheck = false;

	}  else if (password != password2){
		
		$(".infopwd2").html("비밀번호가 일치하지 않습니다.");
		
		$(".infopwd2").css("color", " rgb(245, 0, 0)");
		$(".infopwd2").css("display", "inline-block");
		$("#password2").css({"background-color": "rgb(255, 240, 240)", "border" : "1px solid rgb(245, 0, 0)", "color": "black"});
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


