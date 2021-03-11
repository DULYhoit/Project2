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
                            <li class="list_menu on">
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
                    <div class="search_bar">
                        <form class="hidden">
                              <select name="f">
                                <option ${(param.f == "faq_title")?"selected":""} value="faq_title">제목</option> 
                                <option ${(param.f == "faq_content")?"selected":""} value="faq_content">내용</option>
                              </select>
                            <input type="text" name="q" value="${param.q}" id="search-box" />  
                            <input type="submit" class="search-btn yb" style="float: none;" value="검색"/>
                        </form>
                    </div>
                    <div class="head_aticle">
                        <h3 class="tit">
                            자주하는 질문
                            <span class="tit_sub">
                                고객님들께서 가장 많이 하는 질문들을 모았습니다.
                            </span>
                        </h3>
                        <div class="tt_tbl"></div>
                    </div>
                    <form action="faq_list(admin)" method="post">
                        <div class="accordion_banner" id="tbl_notice">
                            <div class="tbl_notice_tit">
                                <div class="tbl_notice_info">
                                   <c:if test="${getmember.adminCheck == 'A'}"> 
                                    <p class="tbl_info_type">삭제</p>
                                    <p class="tbl_info_type">공개</p>
                                   </c:if> 
                                   <c:if test="${getmember.adminCheck != 'A'}"> 
                                    <p class="tbl_info_type"></p>
                                   </c:if> 
                                    <p class="tbl_info_tit">제목</p>
                                    <p class="tbl_info_date"></p>
                                </div>
                            </div>
                            
                            <c:forEach var="f" items="${list}">
                            
                            <c:set var="open" value=""/>
                            <c:if test="${f.faqPub}">
                            	<c:set var="open" value="checked"/>
                            </c:if>
                            
                            <div class="accordion_title">
                                <div class="tbl_notice_info">
                                    <div class="infoinner">
                                    <c:if test="${getmember.adminCheck == 'A'}">
                                    	<p class="tbl_info_type"><input type="checkbox" name="del-id" class="checkbox" value="${f.faqNo}">
                                            <span class="blind">체크박스</span>
                                        </p>
                                        <p class="tbl_info_type"><input type="checkbox" name="open-id" ${open} class="checkbox" value="${f.faqNo}">
                                            <span class="blind">체크박스</span>
                                        </p>
									</c:if>
									<c:if test="${getmember.adminCheck != 'A'}">
                                    	<p class="tbl_info_type">
                                            <span class="blind">체크박스</span>
                                        </p>
                                        
									</c:if>                                           
                                        <p class="tbl_info_tit">${f.faqTitle}
                                            <span class="blind">제목</span>
                                        </p>
                                        <p class="tbl_info_date">
                                            <span class="blind">작성일</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion_sub">
                                <div class="reply_row">
                                    <div class="notice_wrap">
                                        <span class="modi_span">
                                          <a href="${path}/user/board/faq/updateView?faqNo=${f.faqNo }" class="modi_btn">수정</a>
                                          <a href="${path}/user/board/faq/delete?faqNo=${f.faqNo}" class="modi_btn">삭제</a>
                                        </span>
                                            <div style="padding-left:140px;">
                                            	<p>${f.faqContent}</p>
                                        	</div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            <!---->

                            <!-- 관리자 버튼-->
                            <div id="buttons">
                            <c:set var="ids" value=""/>
                            <c:forEach var="f" items="${list}">
                            	<c:set var="ids" value="${ids} ${f.faqNo}"/>
                            </c:forEach>
                            <input type="hidden" id="ids" name="ids" value="${ids}"/>
                               <input type="button" class="write_btn yb" value="글쓰기" onclick="location.href='faq_reg(admin)'"/>
                              <input type="submit" class="write_btn yb" name="cmd" value="선택삭제" onclick="deleteValue();"/>
                              <input type="submit" class="write_btn yb" name="cmd" value="공개" style="float: none"/>  
                            </div>
                            </div>
                            </form>
                            

							
		                    <!-- 페이징 -->
		                    <c:set var="page" value="${(empty param.p)?1:param.p}"/> 
                            <c:set var="startNum" value="${page-(page-1)%5}"/>
                            <c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10),'.')}"/>
                            <div>
                            	<div style="text-align:right; font-size:13px; padding-top:20px;"><span>${(empty param.p)?1:param.p}</span> / ${lastNum }pages</div>
                            </div>
                            <div class="pagination_section">
                                <div class="custom_pagination">
                                    <span class="pagination_prev disabled">
                                       <div>
                                          <c:if test="${startNum>1}">
                                            <a href="?p=${startNum-1}&t=&q=">
                                                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                    viewBox="0 0 443.52 443.52" style="width: 11px; height: 22px; enable-background:new 0 0 443.52 443.52;" xml:space="preserve">
                                                    <path d="M143.492,221.863L336.226,29.129c6.663-6.664,6.663-17.468,0-24.132c-6.665-6.662-17.468-6.662-24.132,0l-204.8,204.8
                                                        c-6.662,6.664-6.662,17.468,0,24.132l204.8,204.8c6.78,6.548,17.584,6.36,24.132-0.42c6.387-6.614,6.387-17.099,0-23.712
                                                        L143.492,221.863z" style="stroke: rgb(0,0,0); stroke-width: 22;"/>
                                                </svg>
                                              </a>
                                           </c:if>
                                           <c:if test="${startNum<=1}">
                                           <span onclick="alert('이전 페이지가 없습니다.');">
                                             <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                    viewBox="0 0 443.52 443.52" style="width: 11px; height: 22px; enable-background:new 0 0 443.52 443.52;" xml:space="preserve">
                                                    <path d="M143.492,221.863L336.226,29.129c6.663-6.664,6.663-17.468,0-24.132c-6.665-6.662-17.468-6.662-24.132,0l-204.8,204.8
                                                        c-6.662,6.664-6.662,17.468,0,24.132l204.8,204.8c6.78,6.548,17.584,6.36,24.132-0.42c6.387-6.614,6.387-17.099,0-23.712
                                                        L143.492,221.863z" style="stroke: rgb(0,0,0); stroke-width: 22;"/>
                                             </svg>
                                           </span>
                                         </c:if>
                                       </div>
                                    </span>
                                    
                                    <c:forEach var="i" begin="0" end="4">
                                    <span class="pagenum">
                                    	<c:if test="${(startNum+i) <= lastNum}">
	                                        <span><a ${(page==(startNum+i))?'style="font-weight:bold; color:black;"':''} href="?p=${startNum+i}&f=${param.f}&q=${param.q}">${startNum+i}</a></span>
                                    	</c:if>
                                    </span>
                                    </c:forEach>
                                    <!-- <span class="pagenum">
                                        <a>2</a>
                                    </span> -->
                                    <span class="pagination_next">
                                        <a href="">
                                          <div>
                                          <c:if test="${startNum+4<lastNum}">
                                          	 <a href="?p=${startNum+5}&t=&q=" width="11" height="22" stroke="#000">
                                                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                    viewBox="0 0 443.52 443.52" style="width: 11px; height: 22px; enable-background:new 0 0 443.52 443.52;" xml:space="preserve">
                                                    <path d="M336.226,209.591l-204.8-204.8c-6.78-6.548-17.584-6.36-24.132,0.42c-6.388,6.614-6.388,17.099,0,23.712l192.734,192.734
                                                            L107.294,414.391c-6.663,6.664-6.663,17.468,0,24.132c6.665,6.663,17.468,6.663,24.132,0l204.8-204.8
                                                            C342.889,227.058,342.889,216.255,336.226,209.591z" style="stroke: rgb(0,0,0); stroke-width: 22;"/>
                                                </svg>
                                             </a>
                                           </c:if>
                                           <c:if test="${startNum+4>=lastNum}">
                                            <span width="11" height="22" stroke="#000" onclick="alert('다음 페이지가 없습니다.');">
                                                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                    viewBox="0 0 443.52 443.52" style="width: 11px; height: 22px; enable-background:new 0 0 443.52 443.52;" xml:space="preserve">
                                                    <path d="M336.226,209.591l-204.8-204.8c-6.78-6.548-17.584-6.36-24.132,0.42c-6.388,6.614-6.388,17.099,0,23.712l192.734,192.734
                                                            L107.294,414.391c-6.663,6.664-6.663,17.468,0,24.132c6.665,6.663,17.468,6.663,24.132,0l204.8-204.8
                                                            C342.889,227.058,342.889,216.255,336.226,209.591z" style="stroke: rgb(0,0,0); stroke-width: 22;"/>
                                                </svg>
                                            </span>
                                            </c:if>
                                          </div>
                                        </a>
                                    </span>
                                </div>
                            </div>
                        </div>
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
    $(document).ready(function() {
        $(".accordion_banner .accordion_title").click(function() {
            if($(this).next("div").is(":visible")){
            $(this).next("div").slideUp("fast");
            } else {
                $(".accordion_banner .accordion_sub").slideUp("fast");
                $(this).next("div").slideToggle("fast");
            }
        });
    });
    </script>
    <script>
    $(document).ready(function(){
        $(".checkall").click(function(){
            if($(".checkall").prop("checked")){
                $("input[name=del-id]").prop("checked",true);
            }else{
                $("input[name=del-id]").prop("checked",false);
            }
        })
    })
    </script>
    <script type="text/javascript">
	$(function (){
		var chkObj = document.getElementsByName("del-id");
		var rowCnt = chkObj.length;
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='del-id']");
			for (var i=0; i<chk_listArr.length; i++) {
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='del-id']").click(function(){
			if($("input[name='del-id']:checked").length == rowCnt) {
				$("input[name='allCheck']")[0].checked = true;
			}
			else {
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	function deleteValue() {
		var url = "/user/board/faq/deleteChk";	// controller로 보내고자 하는 url
		var valueArr = new Array();
		var list = $("input[name='del-id']");
		for(var i=0; i<list.length; i++) {
			if(list[i].checked){		// 선택되어 있으면 배열에 값을 저장~!~!
				valueArr.push(list[i].value);
			}
		}
		if(valueArr.length == 0) {
			alert("선택된 게시글이 없습니다.");
		}
		else {
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url : url,					// 전송 url
				type : 'POST',				// POST 방식
				traditional: true,
				data : {
					valueArr : valueArr		// 보내고자 하는 data 변수 설정
				},
				success: function(jdata) {
					if(jdata = 1) {
						alert("삭제 성공");
						location.replace("/user/board/faq/deleteChk")	// 리스트 페이지로 새로고침
					}
					else {
						alert("삭제 실패");
					}
				}
			});
		}	
	}
</script>
</html>