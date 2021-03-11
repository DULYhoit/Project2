<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EUTCHAPEDIA</title>
    <link rel="shortcut icon" href="/img/logo_favicon.ico">
    <link rel="stylesheet" href="/css/movie/index.css" type="text/css" />
    <link rel="stylesheet" href="/css/movie/staff_detail.css" type="text/css" />
    <link rel="stylesheet" href="/css/bootstrap-grid.min.css" type="text/css" />
    <link rel="stylesheet" href="/css/bootstrap-reboot.min.css" type="text/css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" />
    <!--icon-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
</head>

<body>
   <jsp:include page="/WEB-INF/view/user/header.jsp"/>
    <div id="main-container">
        <div>
            <button id="back-button" onclick="javascript:history.back();">←</button>
        </div>
        <div id="staff-info-wrapper">
            <img src="/img/movie/profile.svg">
            <div id="staff-name-and-role">
                <h4>${staffName }</h4>
                <div>${staffRole }</div>
            </div>
        </div>

        <div id="movie-info-wrapper">
        <c:forEach var="staffFilmoList" items="${staffFilmoList }">
            <div class="movie-info">
            <input type="hidden" value="${staffFilmoList.movieDocId}">
                <a href="/movie/detail?movieDocId=${staffFilmoList.movieDocId }">
                    <img src="${staffFilmoList.posterUri }" alt="">
                    <div id="movie-title">${staffFilmoList.title }</div>
                    <div>${staffFilmoList.prodYear }</div>
                </a>
            </div>
        </c:forEach>
        </div>
    </div> 

    <!-- 여기부터 footer-->
    <jsp:include page="/WEB-INF/view/user/footer.jsp"/>

</body>

</html>