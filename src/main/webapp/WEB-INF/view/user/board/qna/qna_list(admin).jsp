<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <style>
    .notice_wrap .qatype {
        top: -8px;
        left: 0;
        padding: 0;
        font-size: 35px;
        font-weight: 700;
        color: #000;
        line-height: 55px;
    }
    </style>
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

            <div class="article_right">
                <div class="notiboard_section">
                <!-- 삽입 -->
                <div class="search_bar">
                        <form class="hidden">
                              <select name="search">
                                <option ${(page.search == "qna_title")?"selected":""} value="qna_title">제목</option> 
                                <option ${(page.search == "qna_content")?"selected":""} value="qna_content">내용</option>
                              </select>
                            <input type="text" name="keyword" value="${page.keyword }" id="search-box" />  
                            <input type="submit" class="search-btn yb" style="float: none;" value="검색"/>
                        </form>
                    </div>
                    
                    <div class="head_aticle">
                        <h3 class="tit">
                            1:1문의
                            <span class="tit_sub">
                                궁금한 사항들을 모두 질문해주세요.
                            </span>
                        </h3>
                        <div class="tt_tbl"></div>
                    </div>

                    <form method="post" action="/qna/list.do" id="list">
                    <!-- 테스트 -->
                        <div class="accordion_banner" id="tbl_notice">
                            <div class="tbl_notice_tit">
                                <div class="tbl_notice_info">
                                    <p class="tbl_info_type">NO</p>
                                    <p class="tbl_info_tit">제목</p>
                                    <p class="tbl_info_date">작성자</p>
                                    <p class="tbl_info_date">작성일</p>
                                    <p class="tbl_info_date">답변유무</p>
                                    <p class="tbl_info_date"></p>
                                </div>
                            </div>
                            
                            <c:forEach var="q" items="${list}">
           
                            <div class="accordion_title">
                                <div class="tbl_notice_info">
                                    <div class="infoinner">
                                        <p class="tbl_info_type">${q.qnaNo}
                                            <span class="blind">번호</span>
                                        </p>
                                        <p class="tbl_info_tit">
	                                     
											<a href="detail.qna>qnaNo?=${q.qnaNo}"></a>
												${q.qnaTitle}
                                            <span class="blind">제목</span>
                                        </p>
                                        <p class="tbl_info_date">${q.memberNickname}
                                        <span class="blind">작성자</span>
                                        </p>
                                        <p class="tbl_info_date">
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${q.qnaDate}"/>
                                            <span class="blind">작성일</span>
                                        </p>
                                        <p class="tbl_info_date">
                                        <c:if test="${empty q.aContent}">
                                       	<span style="font-size:18px; color:gray;"><strong>NO</strong></span>
										</c:if>
										<c:if test="${!empty q.aContent}">
                                        <span style="font-size:18px;"><strong>YES</strong></span>
										</c:if>	 	                                        
                                            <span class="blind">작성일</span>
                                        </p>
                                        <c:if test="${getmember.adminCheck == 'A'}"> 
                                        <p class="tbl_info_date">
                                        <c:if test="${empty q.aContent}">
                                        	<input type="button" class="write_btn yb" value="답변달기" onclick="location.href='/qna/reply?qnaNo=${q.qnaNo}&qna=${q.qnaContent}'"/>
                                        </c:if>
                                        <c:if test="${!empty q.aContent}">
                                        	<input type="button" class="end_btn" value="답변완료"/>
                                        </c:if>   
                                            <span class="blind">답변버튼</span>
                                        </p>
                                        </c:if>
                                        
                                       
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="accordion_sub">
                                <div class="reply_row">
                                    <div class="notice_wrap">
                                        <div class="q_wrap">    
                                            <span _ngcontent-dui-c129="" class="qatype">Q.</span>
                                            <div>
                                                <p>${q.qnaContent}</p>
                                            </div>
                                        </div>
                                        <div _ngcontent-dui-c129="" class="a_wrap" style="padding-top: 20px;">
                                            <c:if test="${empty q.aContent}">
                                            	<span></span>
                                            </c:if>
                                            <c:if test="${!empty q.aContent}">
                                            <span _ngcontent-dui-c129="" class="qatype">A.</span>
                                            <p _ngcontent-dui-c129="">${q.aContent}</p>
                                        	</c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            <!---->

                            <!-- 글쓰기 버튼 -->
                            <c:if test="${getmember.adminCheck != 'A'}"> 
                            <div style="padding-top:20px; text-align:right; padding-right:30px;">
                                <input type="button" class="write_btn yb" value="1:1문의하기" onclick="location.href='/qna/writeForm.do'"/>
                            </div>
							</c:if>
                            <!-- 페이징 -->
                            <div class="pagination_section">
                                <div class="custom_pagination">
                                    <span class="pagination_prev disabled">
                                        <a href="">
                                            <ruler-svg-icon-prev>
                                                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                    viewBox="0 0 443.52 443.52" style="width: 11px; height: 22px; enable-background:new 0 0 443.52 443.52;" xml:space="preserve">
                                                    <path d="M143.492,221.863L336.226,29.129c6.663-6.664,6.663-17.468,0-24.132c-6.665-6.662-17.468-6.662-24.132,0l-204.8,204.8
                                                        c-6.662,6.664-6.662,17.468,0,24.132l204.8,204.8c6.78,6.548,17.584,6.36,24.132-0.42c6.387-6.614,6.387-17.099,0-23.712
                                                        L143.492,221.863z" style="stroke: rgb(0,0,0); stroke-width: 22;"/>
                                                </svg>
                                            </ruler-svg-icon-prev>
                                        </a>
                                    </span>
                                    <span class="pagenum current">
                                        <span>1</span>
                                    </span>
                                    <span class="pagenum">
                                        <a>2</a>
                                    </span>
                                    <span class="pagenum">
                                        <a>3</a>
                                    </span>
                                    <span class="pagenum">
                                        <a>4</a>
                                    </span>
                                    <span class="pagenum">
                                        <a>5</a>
                                    </span>
                                    <span class="pagination_next">
                                        <a href="">
                                            <ruler-svg-icon-next width="11" height="22" stroke="#000">
                                                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                    viewBox="0 0 443.52 443.52" style="width: 11px; height: 22px; enable-background:new 0 0 443.52 443.52;" xml:space="preserve">
                                                    <path d="M336.226,209.591l-204.8-204.8c-6.78-6.548-17.584-6.36-24.132,0.42c-6.388,6.614-6.388,17.099,0,23.712l192.734,192.734
                                                            L107.294,414.391c-6.663,6.664-6.663,17.468,0,24.132c6.665,6.663,17.468,6.663,24.132,0l204.8-204.8
                                                            C342.889,227.058,342.889,216.255,336.226,209.591z" style="stroke: rgb(0,0,0); stroke-width: 22;"/>
                                                </svg>
                                            </ruler-svg-icon-next>
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
</html>