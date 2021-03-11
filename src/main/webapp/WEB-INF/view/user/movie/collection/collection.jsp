<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>    
    <meta charset="UTF-8">
    <!--그리드시스템을 위한 css파일-->
    <link rel="stylesheet" href="css/bootstrap-grid.min.css">
    <!--reboot.css 는 태그속성들이 다른 브라우저에서 호환이 가능하게끔 스타일을 맞춰주는 css파일 -->
    <link rel="stylesheet" href="css/bootstrap-reboot.min.css">
    <!--부트스트랩 기능들의 css-->>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/movie/collection.css" type="text/css">
    <link rel="stylesheet" href="css//movie/index.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/logo_favicon.ico">
    <!--favicon-->
    <link rel="icon" href="img/logo_favicon.ico">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <!--icon-->
    <title>EUTCHAPEDIA</title>
</head>

<body>
   <!-- 헤더 -->
    <jsp:include page="/WEB-INF/view/user/header.jsp"/>   
    
    <main class="main-body">
        <div class="main-header">
            <p class="x" onclick="location.href='javascript:history.back();'">←</p>
            <h2 class="tag-title">${pickName }</h2>
        </div>
		<div class="row-space-movie">
			<c:forEach var="collectionList" items="${collectionList }">
				<div class="col-space-movie">
					<ul class="movie-list">
						<li class="movie-detail"><a
							href="/movie/detail?movieDocId=${collectionList.movieDocId }">
								<img src="${collectionList.posterUri }"
								style="width: 132.06px; height: 192.88px;">
								<div class="movie-name">${collectionList.title }</div>
								<div class="movie-value">${collectionList.prodYear }
									${collectionList.nation }</div></li>
						</a>
					</ul>
				</div>
			</c:forEach>
		</div>
		<!--             <div class="col-space-movie">
                <ul class="movie-list">
                    <li class="movie-detail">
                        <img src="image/라라랜드.jpg" style="width: 132.06px; height: 192.88px; border-radius: 6px;">
                        <a href="#">
                            <div class="movie-name">라라랜드</div>
                            <div class="movie-value">평균 ★ 3.2</div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-space-movie">
                <ul class="movie-list">
                    <li class="movie-detail">
                        <img src="image/라라랜드.jpg" style="width: 132.06px; height: 192.88px; border-radius: 6px;">
                        <a href="#">
                            <div class="movie-name">라라랜드</div>
                            <div class="movie-value">평균 ★ 3.2</div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-space-movie">
                <ul class="movie-list">
                    <li class="movie-detail">
                        <img src="image/라라랜드.jpg" style="width: 132.06px; height: 192.88px; border-radius: 6px;">
                        <a href="#">
                            <div class="movie-name">라라랜드</div>
                            <div class="movie-value">평균 ★ 3.2</div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-space-movie">
                <ul class="movie-list">
                    <li class="movie-detail">
                        <img src="image/라라랜드.jpg" style="width: 132.06px; height: 192.88px; border-radius: 6px;">
                        <a href="#">
                            <div class="movie-name">라라랜드</div>
                            <div class="movie-value">평균 ★ 3.2</div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-space-movie">
                <ul class="movie-list">
                    <li class="movie-detail">
                        <img src="image/라라랜드.jpg" style="width: 132.06px; height: 192.88px; border-radius: 6px;">
                        <a href="#">
                            <div class="movie-name">라라랜드</div>
                            <div class="movie-value">평균 ★ 3.2</div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-space-movie">
                <ul class="movie-list">
                    <li class="movie-detail">
                        <img src="image/라라랜드.jpg" style="width: 132.06px; height: 192.88px; border-radius: 6px;">
                        <a href="#">
                            <div class="movie-name">라라랜드</div>
                            <div class="movie-value">평균 ★ 3.2</div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-space-movie">
                <ul class="movie-list">
                    <li class="movie-detail">
                        <img src="image/라라랜드.jpg" style="width: 132.06px; height: 192.88px; border-radius: 6px;">
                        <a href="#">
                            <div class="movie-name">라라랜드</div>
                            <div class="movie-value">평균 ★ 3.2</div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-space-movie">
                <ul class="movie-list">
                    <li class="movie-detail">
                        <img src="image/라라랜드.jpg" style="width: 132.06px; height: 192.88px; border-radius: 6px;">
                        <a href="#">
                            <div class="movie-name">라라랜드</div>
                            <div class="movie-value">평균 ★ 3.2</div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-space-movie">
                <ul class="movie-list">
                    <li class="movie-detail">
                        <img src="image/라라랜드.jpg" style="width: 132.06px; height: 192.88px; border-radius: 6px;">
                        <a href="#">
                            <div class="movie-name">라라랜드</div>
                            <div class="movie-value">평균 ★ 3.2</div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-space-movie">
                <ul class="movie-list">
                    <li class="movie-detail">
                        <img src="image/라라랜드.jpg" style="width: 132.06px; height: 192.88px; border-radius: 6px;">
                        <a href="#">
                            <div class="movie-name">라라랜드</div>
                            <div class="movie-value">평균 ★ 3.2</div>
                        </a>
                    </li>
                </ul>-->

    </main>
    
    <!------------ footer ------------>

    <jsp:include page="/WEB-INF/view/user/footer.jsp"/>
    
    <!--부트스트랩이 jquery를 사용하고있어 어떠한 js파일보다 상위에 있어야함-->
    <script src="js/jquery.min.js"></script>
    <!--부트스트랩 4버전부터 popper.js가필요함 bundle.min.js에 popper.js가 포함되어있음-->
    <script src="js/bootstrap.bundle.min.js"></script>
</body>


</html>