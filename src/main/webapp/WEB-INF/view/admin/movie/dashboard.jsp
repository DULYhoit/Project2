<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EUTCHAPEDIA || ADMIN</title>
    <link rel="stylesheet" href="/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/admin/admin.css">
    
</head>
<body>
	<div class="container" style="height: 100%;">
		<!--헤더 반응형-->
		<!-- header시작 -->
		<jsp:include page="/WEB-INF/view/admin/inc/header.jsp"/>
		<!-- header 끝 -->
		
		<!--content 반응형--> <!-- row div는 깨면안됨 -->
		<div class="row">
			

				<!--nav영역-->
				<!-- nav시작 -->
				<jsp:include page="/WEB-INF/view/admin/inc/nav.jsp"/>
				<!-- nav끝 -->
				
				<!--section 반응형-->
                <div id="section-col" class="col-lg-10">
                    <div id="pick-h1">
                        <h1>DB관리</h1>
    
                    </div>
                    <div id="dash-container" class="col-lg-6">
                        <div id="dash-comment" class="col-lg-12">
                            <canvas id="commentc" width="400px" height="380px"></canvas>
                        </div>
                        <div id="dash-search" class="col-lg-12">
                            <canvas id="comments" width="400px" height="380px"></canvas>
                        </div>
                    </div>
                        <div id="newperson-container" class="col-lg-6">

                            <div id="newperson">
                                <div id="newperson-header">
                                    <h4>New회원</h3>
                                    <small>더보기</small>
                                </div>
                                <!--new 사용자 반복-->
                                <div id="newperson-main" style="height: 50px;">
                                    <c:forEach var="m" items="${getmemberinfo}">
                                    
                                    <div id="dash-main-info" style="display: inline-block; font-size: 14px; margin-top: 15px">
                                    <span>${m.memberNickname}</span>
                                        <br>                                    
                                    <span>${m.memberEmail}</span>
                                    <span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                                    <span>${m.memberDate}</span>
                                    </div>
                                    </c:forEach>

                                </div>
                                
                                
                               

                            </div>
                        </div>
                        
                </div>
			
	</div>
	</div>
	<script src="/js/jquery.min.js"></script>

    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
    <script src="/js/admin/adminmovie/js/accordion.js"></script>
    <script>
    
        let commentc = document.getElementById('commentc').getContext('2d');
        let comments = document.getElementById('comments').getContext('2d');
        var chartLabels = [];
        var hitcount = [];

        <c:forEach var="mc" items="${getmoviechart}">
        chartLabels.push('${mc.title}');
        hitcount.push('${mc.movieHitCount}');
        </c:forEach>

        var goodmovieLabels = [];
        var goodcount = [];

        <c:forEach var="mgc" items="${getmoviegoodchart}">
        goodmovieLabels.push('${mgc.title}');
        goodcount.push('${mgc.sum}');
        </c:forEach>

        let barChart = new Chart(commentc, {
            type : 'bar',
            data : {
                labels : chartLabels,
                datasets : [{
                    label : '조회수',
                    data : hitcount
                        ,
                    backgroundColor:[
                        'red',
                        'blue',

                    ]
                }]
            }
        })

        let barChart2 = new Chart(comments, {
            type : 'bar',
            data : {
                labels : goodmovieLabels,
                datasets : [{
                    label : '좋아요',
                    data : goodcount,
                    backgroundColor:[
                        'red',
                        'blue',

                    ]
                }]
            }
        })
    </script>
</body>
</html>