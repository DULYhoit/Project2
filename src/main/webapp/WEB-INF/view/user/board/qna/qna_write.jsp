<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/movie/index.css">
    <link rel="shortcut icon" href="img/logo_favicon.ico"> <!--favicon-->
    <link rel="icon" href="img/logo_favicon.ico">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"> <!--icon-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script> 
    <!--그리드시스템을 위한 css파일-->
    <link rel="stylesheet" href="/css/bootstrap-grid.min.css">
    <!--reboot.css 는 태그속성들이 다른 브라우저에서 호환이 가능하게끔 스타일을 맞춰주는 css파일 -->
    <link rel="stylesheet" href="/css/bootstrap-reboot.min.css">
    <!--부트스트랩 기능들의 css-->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/board/faq_qna/faq_qna.css">
    <title>EUTCHAPEDIA</title>
</head>
<body>
   <!-- 헤더 -->
    <jsp:include page="/WEB-INF/view/user/header.jsp"/>
        <div class="wrapper"> 
            <div class="navbar">
                <div class="navbar_logo">
                    <img id="logo" src="/img/original.png"> <!-- 이미지파일 이동 시 경로 확인!-->
                </div>

    
                <div class="menu">
                <ul>
                  <span><li><a href="#">ABOUT US</a></li></span>
                  <span> <li><a href="#">평가하기</a></li></span>
                    <span> <li><a href="#">고객센터</a></li></span>
                </ul>
                </div>
    
                <!--검색창-->
                <div class="searchbar">
                    <form action="#">
                      <div class="search_box"> 
                         <div class="icon"><i class="fas fa-search"></i> 
                            <input type="text" value="" placeholder=" 작품 제목, 배우,감독을 검색해보세요.">
                         </div>
                      </div>
                    </form>
                </div>
    
                <div class="menu">
                    <ul>
                      <span><li><a href="#">로그인</a></li></span>
                      <span><li><a href="#">회원가입</a></li></span>
                </ul>
              </div>
            </div>
        </div>
      </header>
    <section class="page_notiboard_sction">
        <div class="notiboard_wrap">

            <div class="article_left">
                <div id="snb" class="snb_cc">
                    <h2 class="title_snb">고객센터</h2>
                    <div class="inner_snb">
                        <ul class="list_menu">
                            <li class="list_menu">
                                <a href="/notice/list">공지사항</a>
                            </li>
                            <li class="list_menu">
                                <a href="/faq/faq_list(admin)">자주하는 질문</a>
                            </li>
                            <li class="list_menu on">
                                <a href="/qna/list.do">1:1 문의</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="page_section section_qna">
                <div class="head_aticle">
                <h2 class="tit"><strong>1:1문의</strong></h2>
                </div>
                
                <div class="xans-board-write">
                <form action="/qna/write.do" method="post" style="height: 100%;">
                
                <input type="hidden" name="mode" value="add_qna">
                <input type="hidden" name="itemcd" value="">
                <input type="hidden" name="sno" value="0">
                <table id="table_after" class="boardWrite2" width="100%">
                <colgroup><col width="14%" align="right">
                </colgroup><tbody><tr>
              
                <th class="input_txt" style="padding-top:20px;">제목</th>
                <td><br>
                <input type="text" name="qnaTitle" style="width:100%; height:25px;" required="" fld_esssential="" label="제목" value="">
                </td>
                </tr>
                <tr>
                <th class="input_txt">내용</th>
                <td class="edit_area" style="position: relative;">
                <strong class="tit qna_public"></strong>             
                <dl class="list qna_public">
                </dl>
                
                
                
                <!-- <textarea name="contents" style="width:100%;height:474px;" class="editing_area" required="" fld_esssential="" label="내용"></textarea> -->
                <textarea name="qnaContent" id="qnaContent" rows="10" cols="137"></textarea>
                </td>
                </tr>
                <tr>
                <th class="input_txt">이미지</th>
                <td>
                <section id="section">
                <table width="90%" id="table" cellpadding="0" cellspacing="0" border="0" style="border:solid 1px #f4f4f4; border-collapse:collapse;">
                    <tbody>
                        <tr data-tr_value="1">
                            <td><input type="checkbox" name="checkRow"/></td>
                            <td width="30" nowrap="" align="center">1</td>
                            <td width="100%">
                            <label>
							<input id="attach-file" type="file" name="file[]" style="width:50%" class="linebg">
                            </label>
                            <span id="file-name">${vo.qnaFilename }</span>
							<span id="delete-file" style="display:${empty vo.qnaFilename ? 'none' : 'inline'}; color:red; margin-left:20px;"><i class="fas fa-times font-img"></i></span>
                            
                            <!-- <input type="button" name="del_btn" id="delete" class="del_btn" value="삭제"/> -->
                            </td>
                        </tr>
                        <tr data-tr_value="2">
                            <td><input type="checkbox" name="checkRow"/></td>
                            <td width="30" nowrap="" align="center">2</td>
                            <td width="100%">
                            <label>
                            <input id="attach-file" type="file" name="file[]" style="width:50%" class="linebg">
                            </label>
                            <span id="file-name">${vo.qnaFilename }</span>
							<span id="delete-file" style="display:${empty vo.qnaFilename ? 'none' : 'inline'}; color:red; margin-left:20px;"><i class="fas fa-times font-img"></i></span>
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
                <div>
                    - 상품 불량 및 오배송의 경우, 해당 제품 사진을 등록 부탁드립니다. <br/>
                    - 파일명은 영문만 가능하며, 파일당 최대 10MB 의<br/>
                    　용량 제한이 있습니다.<br/>
                    - 가로사이즈가 450pixel을 초과하는 경우 자동으로<br/>
                    　450픽셀로 조정됩니다.<br/>
                    - 첨부파일은 최대 2개까지 등록가능합니다.<br/>
                </div>
                </div>
                </td>
                </tr>
                </tbody></table>
                
                <table width="60%">
                <tbody><tr>
                <td align="right" style="padding-top:20px; border:none;" id="avoidDbl">
	            <button type="submit" id="write" name="write" class="bhs_button yb" style="float:none;">저장</button>
				<button type="button" class="cancel_btn" onclick="location.href='qna_list(admin)'">취소</button>

                </td>
                </tr>
                </tbody></table>
                </form>
                </div>
            </div>
        </div>
    </section>
    <!-- footer -->
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
              고객센터<span> | </span>cs@eutchapedia.com, 02-123-4567 <br />
              제휴 및 대외 협력<span> | </span>contact@eutcha.com</p>
            <p>
              주식회사 읏챠<span> | </span>대표 이지현<span> | </span>서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F,20F<br />
              사업자 등록 번호 211-12-34567<br />
              © 2021 by EUTCHA, Inc. All rights reserved.
            </p>
          </div>
        </div>
    
      </footer>
    
        <!-- scripts -->
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
    </body>
	<script type="text/javascript">
		    var oEditors = [];
		    nhn.husky.EZCreator.createInIFrame({
		     oAppRef: oEditors,
		     elPlaceHolder: "qnaContent",
		     sSkinURI: "/js/board/se2/SmartEditor2Skin.html",
		     fCreator: "createSEditor2"
		    });
		</script>
		<script>
		$("#write").click(function(){ 
				oEditors.getById["qnaContent"].exec("UPDATE_CONTENTS_FIELD", []); 
				$("#frm").submit(); 
		})
		</script>
		<script type="text/javascript">
		$(document).ready(function (e){
			$('#write').click(function(){
					var frmArr = ["qnaTitle","qnaContent"];
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