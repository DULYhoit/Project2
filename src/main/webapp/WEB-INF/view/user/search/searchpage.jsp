<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/movie/index.css">
    <link rel="shortcut icon" href="/img/logo_favicon.ico"> <!--favicon-->
    <link rel="icon" href="/img/logo_favicon.ico">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"> <!--icon-->

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script> 
    <!--그리드시스템을 위한 css파일-->
    <link rel="stylesheet" href="/css/bootstrap-grid.min.css">
    <!--reboot.css 는 태그속성들이 다른 브라우저에서 호환이 가능하게끔 스타일을 맞춰주는 css파일 -->
    <link rel="stylesheet" href="/css/bootstrap-reboot.min.css">
    <!--부트스트랩 기능들의 css-->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/search/search.css">
	<title>EUTCHAPEDIA</title>
</head>
<body>
<!-- header -->
 <jsp:include page="/WEB-INF/view/user/header.jsp"/>
<!-- header 끝 -->


    <!-- 검색 바디 -->
    <article class="page_search_sction">
        <div class="search_wrap">
            <hr class="container_line">
            <!-- 상단 검색 결과 -->
            <section class="detailed_search_info">
                <div class="tit_content">
                    <div class="title_search_header">
                        <h2 class="title_search">
                            상위 검색 결과
                        </h2>
                    </div>
                </div>
                <div class="search_info_container">
                    <div class="container_inner">
                    <c:forEach var="searchTopList" items="${searchTopList }">
                        <ul class="content_poster_list" >
                            <div class="top_result_elements">
                                <a title="" href="/movie/detail?movieDocId=${searchTopList.movieDocId }">
                                    <div class="content_poster_block">
                                        <div class="lazy_loading_image">
                                            <img class="styled_img"
                                                src="${searchTopList.posterUri }">
                                        </div>
                                    </div>
                                    <div class="content_info">
                                        <div class="result_title">${searchTopList.title }</div>
                                        <div class="result_extra_info">${searchTopList.prodYear } 미국</div>
                                    </div>
                                </a>
                            </div>
                        </ul>
                        </c:forEach>
                    </div>
                </div>
                <hr class="container_line">
            </section>

            <!-- 검색어 관련 영화 -->
            <section class="detailed_search_info">
                <div class="tit_content">
                    <div class="title_search_header">
                        <h2 class="title_search">
                            영화
                        </h2>
                    </div>
                </div>
                <div class="search_info_container">
                    <div class="container_inner">
                        <ul class="content_stackable">
                            <!-- 블럭 하나 -->
                            <c:forEach var="searchTopList" items="${searchTopList }">
                            <li class="stackable_item">
                                <a title="" href="/movie/detail?movieDocId=${searchTopList.movieDocId }">
                                    <div class="poster_block">
                                        <div class="item_styled_img">
                                            <span class="styled_background" style="background-image: url(${searchTopList.posterUri});"></span>
                                        </div>
                                    </div>
                                    <div class="info_block">
                                        <div class="item_info">
                                            <div class="item_title">${searchTopList.title }</div>
                                            <div class="item_extra_info">${searchTopList.prodYear } ${searchTopList.nation }</div>
                                        </div>
                                        <div></div>
                                    </div>
                                </a>
                            </li>
							</c:forEach>
							
            				<c:forEach var="searchMovieList" items="${searchMovieList }">
                            <li class="stackable_item">
                                <a title="" href="/movie/detail?movieDocId=${searchMovieList.movieDocId }">
                                    <div class="poster_block">
                                        <div class="item_styled_img">
                                            <span class="styled_background" style="background-image: url(${searchMovieList.posterUri});"></span>
                                        </div>
                                    </div>
                                    <div class="info_block">
                                        <div class="item_info">
                                            <div class="item_title">${searchMovieList.title }</div>
                                            <div class="item_extra_info">${searchMovieList.prodYear } ${searchMovieList.nation }</div>
                                        </div>
                                        <div></div>
                                    </div>
                                </a>
                            </li>
                            </c:forEach>

                        </ul>
                    </div>
                </div>
                <hr class="container_line">
            </section>

            <!-- 검색결과 사용자 -->
            <section class="detailed_search_info">
                <div class="tit_content">
                    <div class="title_search_header">
                        <h2 class="title_search">
                            사용자
                        </h2>
                    </div>
                </div>
                <div class="search_info_container">
                    <div class="container_inner">
                        <ul class="user_info_list">
                        	<c:forEach var="searchMemberList" items="${searchMemberList }">
                        	
                            <li class="user_info_item">
                                <!-- 마이페이지 연결 -->
                                <a title="소울" href="/mypage/index_member?id=${searchMemberList.memberEmail}">
                                    <div class="user_loading_img">
                                        <div class="user_img_block">
                                            <div class="profile_image"><img src="${searchMemberList.memberPhoto }"/></div>
                                        </div>
                                    </div>
                                    <!-- 사용자 내용 -->
                                    <div class="info_block">
                                        <div class="item_info">
                                            <div class="item_title">${searchMemberList.memberNickname }</div>
                                            
                                        </div>
                                    </div>
                                </a>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <hr class="container_line">
            </section>

        </div>
    </article>

	<!-- footer 시작 -->
	<jsp:include page="/WEB-INF/view/user/footer.jsp"/>
	<!-- footer 끝 -->


    <!--부트스트랩이 jquery를 사용하고있어 어떠한 js파일보다 상위에 있어야함-->
    <script src="/js/jquery.min.js"></script>
    <!--부트스트랩 4버전부터 popper.js가필요함 bundle.min.js에 popper.js가 포함되어있음-->
    <script src="/js/bootstrap.bundle.min.js"></script>
</body>
</html>