<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eutchapedia</title>
    <link rel="shortcut icon" href="/img/logo_favicon.ico">
    <link rel="stylesheet" href="/css/movie/index.css" type="text/css" />
    <link rel="stylesheet" href="/css/movie/movie_more_info.css" type="text/css" />
    <link rel="stylesheet" href="/css/bootstrap-grid.min.css" type="text/css" />
    <link rel="stylesheet" href="/css/bootstrap-reboot.min.css" type="text/css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" />
     <!--icon-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <script src="/js/jquery.min.js"></script>
</head>
<body>
<!-- header -->
 <jsp:include page="/WEB-INF/view/user/header.jsp"/>
<!-- header 끝 -->
    <div id="main-container">
        <div>
            <button id="back-button" onclick="location.href='/movie/detail?movieDocId=${movieInfoVo.movieDocId}'">←</button>
        </div>
        <div class="title">기본 정보</div>
        <div id="table-zone">
            <table>
                <tr>
                    <th>원제</th>
                    <td>${movieInfoVo.titleOrg }</td>
                </tr>
                <tr>
                    <th>제작 연도</th>
                    <td>${movieInfoVo.prodYear }</td>
                </tr>
                <tr>
                    <th>국가</th>
                    <td>${movieInfoVo.nation }</td>
                </tr>
                <tr>
                    <th>장르</th>
                    <td>${movieInfoVo.genre }</td>
                </tr>
                <tr>
                    <th>관람 등급</th>
                    <td>${movieInfoVo.rating }</td>
                </tr>
                <tr>
                    <th>상영 시간</th>
                    <td>${movieInfoVo.movieRunningTime }분</td>
                </tr>
                <tr>
                    <th class="plot-title">줄거리</th>
                    <td class="plot-title"></td>
                </tr>
            </table>
            <div id="plot">
                <p>${movieInfoVo.plot }</p>
            </div>
        </div>
    </div>


<!-- footer 시작 -->
<jsp:include page="/WEB-INF/view/user/footer.jsp"/>
<!-- footer 끝 -->

        <!-- scripts -->

        <script src="/js/movie/bootstrap.bundle.min.js"></script>
        
</body>

</html>