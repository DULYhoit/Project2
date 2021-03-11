/**
 * 탈퇴js
 */


 	$('input:checkbox[id="check1"]').change(function(){
 	   $('input#reason1').val(1);
 	});
 	$('input:checkbox[id="check2"]').change(function(){
 	   $('input#reason2').val(1);
 	});
 	$('input:checkbox[id="check3"]').change(function(){
 	   $('input#reason3').val(1);
 	});
 	$('input:checkbox[id="check4"]').change(function(){
 	   $('input#reason4').val(1);
 	});

	function check() {
	   var length = $('input:checkbox[name="checkbox"]:checked').length;
       var pwd = $("#inputdiv").val()
       var withdrawRegistration = null;
		
		if (length == 0) {
			alert("사유를 한 가지 이상 선택해 주세요.");
			return false;
		}
		else if(pwd ==""){
			alert("비밀번호를 입력해주세요.");
			$("#inputdiv").focus();
			return false;
		}
		
		else if (length != 0 || pwd !="") {
          withdrawRegistration =confirm("정말로 탈퇴 하시겠습니까?");
          if(withdrawRegistration==true) {
          
          }
          if( withdrawRegistration==false){
             return false;
          }
       }       
		
		else return true;
	}