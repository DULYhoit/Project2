<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script> 
    <!--그리드시스템을 위한 css파일-->
    <link rel="stylesheet" href="/css/bootstrap-grid.min.css">
    <!--reboot.css 는 태그속성들이 다른 브라우저에서 호환이 가능하게끔 스타일을 맞춰주는 css파일 -->
    <link rel="stylesheet" href="/css/bootstrap-reboot.min.css">
    <!--부트스트랩 기능들의 css-->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/board/notice/notiboard.css">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/movie/index.css">
    <link rel="shortcut icon" href="/img/logo_favicon.ico"> <!--favicon-->
    <link rel="icon" href="/img/logo_favicon.ico">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"> <!--icon-->
    <!-- 네이버 스마트 에디터 -->
    <script type="text/javascript" src="/js/board/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<title>EUTCHAPEDIA</title>
</head>
<body>
    <!-- 헤더 -->
    <jsp:include page="/WEB-INF/view/user/header.jsp"/>

    <!-- 공지사항 -->
    <section class="page_notiboard_sction">
        <div class="notiboard_wrap">

            <div class="article_left">
                <div id="snb" class="snb_cc">
                    <h2 class="title_snb">고객센터</h2>
                    <div class="inner_snb">
                        <ul class="list_menu">
                            <li class="list_menu on">
                                <a href="/notice/list">공지사항</a>
                            </li>
                            <li class="list_menu">
                                <a href="/faq/faq_list(admin)">자주하는 질문</a>
                            </li>
                            <li class="list_menu">
                                <a href="/qna/list.do">1:1 문의</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="article_right">
                <div class="notiboard_section">
                    <div class="head_aticle">
                        <h2 class="tit">
                            <strong>공지사항</strong>
                            <span class="tit_sub">
                                읏챠피디아의 새로운 소식들과 유용한 정보들을 확인하세요.
                            </span>
                        </h2>
                        <div class="tt_tbl"></div>
                    </div>
                    <div class="page_section section_qna">

                        <div class="xans-board-write">
                            <form name="frm" id="frm" method="post" action="<c:url value='/notice/insert.do'/>" enctype="multipart/form-data" style="height: 100%;">
                                <input type="hidden" name="mode" value="add_qna">
                        
                                <table id="table_after" class="boardWrite2" width="100%">
                                    <colgroup><col width="14%" align="right">
                                    </colgroup><tbody><tr>

                                        <th class="input_txt" style="padding-top:20px;">제목</th>
                                        <td><br>
                                        
                                        <input type="text" id="noticeTitle" name="noticeTitle" style="width:100%; height:25px;">
                                        </td>
                                        </tr>
                                        <tr>
                                        <th class="input_txt">내용</th>
                                        <td class="edit_area" style="position: relative;">
                                        <strong class="tit qna_public"></strong>             
                                        <dl class="list qna_public">
                                        </dl>
                                        



                                        <!-- textarea -->
                                        <!-- <textarea id="contents" name="contents" style="width: 100%; height: 474px;" class="editing_area" required="" fld_essential="" label="내용"></textarea>-->
                                        
                                        <textarea name="noticeContent" id="noticeContent" value="noticeContent" rows="10" cols="122"></textarea>
                                        <!---->
                                        
                                        </td>
                                        </tr>
                                        <tr>
                                        <th class="input_txt">이미지</th>
                                        <td>
                                        <section id="section">
                                        <table width="90%" id="table" cellpadding="0" cellspacing="0" border="0" style="border:solid 1px #f4f4f4; border-collapse:collapse;">
                                            <tbody>
                                                <tr data-tr_value="1">
                                                    <td width="100%">
                                                    <input type="file" multiple="multiple" name="uploadFile" style="width:50%" class="linebg">
                                                    <!-- <input type="button" name="del_btn" id="delete" class="del_btn" value="삭제"/> -->
                                                    </td>
                                                </tr>
                                                <tr data-tr_value="2">
                                                    <td width="100%">
                                                    <input type="file" multiple="multiple" name="uploadFile" style="width:50%" class="linebg">
                                                    <!-- <input type="button" name="del_btn" id="delete" class="del_btn" value="삭제"/> -->
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <div style="padding-left: 630px;">
                                                <input type="button" name="del_btn" id="delete" class="del_button" value="삭제"/>
                                            </div>    
                                        </table>
                                        </section>
                                        <table><tbody><tr><td height="2"></td></tr></tbody></table>
                                        <div width="100%" style="padding:5px; padding-top:10px;" class="stxt">
                                        <input type="checkbox"/>　바로공개<br>
                                        </div>
                                        </td>
                                        </tr>
                                        </tbody></table>
                        
                                        <table width="60%">
                                        <tbody><tr>
                                        <td align="right" style="padding-top:20px; border:none;" id="avoidDbl">
                                            <button type="submit" id="write" name="write" class="bhs_button yb"style="float:none;">저장</button>
                                            <a href="/notice/list">
                                                <button type="button" class="cancel_btn">목록</button>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody></table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


<!-------------- 푸터 --------------->
<footer>

    <section class="count-space">
      <span class="count">지금까지<em> ★ 123,534,545 개의 평가가 </em> 쌓였어요.</span>
    </section>

    <div class="footer-right">
      <div class="social-icons">
        <span><a href="#"><i class="fab fa-instagram"></i></a></span> 
        <span><a href="#"><i class="fab fa-facebook-f"></i></a></span> 
        <span><a href="#"><i class="fab fa-twitter"></i></a></span> 
      </div>
    </div>

    <div class="footer-left">
      <div>
          <a href="#"> 서비스 이용약관</a>
          <a href="#"> 개인정보 처리방침</a>
          <a href="#"> 회사 안내</a>
      </div>

      <div>
        <p>
          고객센터<span> | </span>cs@eutchapedia.com, 02-123-4567 <br/>
          제휴 및 대외 협력<span> | </span>contact@eutcha.com</p>
        <p>
          주식회사 읏챠<span> | </span>대표 이지현<span> | </span>서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F,20F<br/>
          사업자 등록 번호 211-12-34567<br/>
          © 2021 by EUTCHA, Inc. All rights reserved.
        </p>
      </div>
    </div>

</footer>







    <!--부트스트랩이 jquery를 사용하고있어 어떠한 js파일보다 상위에 있어야함-->
    <script src="/js/jquery.min.js"></script>
    <!--부트스트랩 4버전부터 popper.js가필요함 bundle.min.js에 popper.js가 포함되어있음-->
    <script src="/js/bootstrap.bundle.min.js"></script>
</body>
<script type="text/javascript">
    var oEditors = [];
    nhn.husky.EZCreator.createInIFrame({
     oAppRef: oEditors,
     elPlaceHolder: "noticeContent",
     sSkinURI: "/js/board/se2/SmartEditor2Skin.html",
     fCreator: "createSEditor2"
    });
</script>
<script>
$("#write").click(function(){ 
		oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []); 
		$("#frm").submit(); 
})

</script>
<script type="text/javascript">
$(document).ready(function (e){
	$('#write').click(function(){
			var frmArr = ["noticeTitle","noticeContent"];

			//입력 값 널 체크
			for(var i=0;i<frmArr.length;i++){
				//alert(arr[i]);
				if($.trim($('#'+frmArr[i]).val()) == ''){
					alert('빈 칸을 모두 입력해 주세요.');
					$('#'+frmArr[i]).focus();
					return false;
				}
			}

			//전송
			$('#frm').submit();
	});
});

</script>
</html>