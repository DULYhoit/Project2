/**
 * 로그인 스크립트
 */
function login() {

    //아이디 공백 확인 
    if ($("#email").val() == "") {
        alert("이메일을 입력해 주세요");
        $("#email").focus();
        return false;
    }

    //비밀번호 공백 확인 
    else if ($("#pwd").val() == "") {
        alert("비밀번호를 입력해 주세요");
        $("#pwd").focus();
        return false;
    }

    else {
        return true;
    }
}

