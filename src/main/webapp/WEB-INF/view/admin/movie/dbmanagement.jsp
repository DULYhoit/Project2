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
                <form action="/admin/moviemanagement" method="get">
                
                  <div id="dbmanagement-search-container">
                        <div id="dbmanagement-input-tag">
                            <select class="custom-select" id="dbmanagement-select-search" name="f">
                            <option ${(param.f == "title")?"selected":""} value="title">제목</option>
                            <option ${(param.f == "nation")?"selected":""} value="nation">제작국가</option>
                            <option ${(param.f == "genre")?"selected":""} value="genre">장르</option>
                          </select>
                        </div>
                        <div id="dbmanagement-input-text">
                            <div id="dbmanagement-mtext" class="input-group mb-3">
                                <div class="input-group-prepend">
                                  <span class="input-group-text" id="basic-addon1"><img src="/svg/admin/search.svg" alt="bootstrap"></span>
                                </div>
                                <input type="text" id="movienameval" name="q" value="${param.q}" class="form-control" placeholder="영화제목" aria-label="Username" aria-describedby="basic-addon1">
                              </div>

                        </div>
                        <div id="dbmanagement-btn-click">
                            <button type="submit" class="btn btn-primary btn-sm" id="dbmanagement-select-button">조회</button>
                        </div>



                    </div>
                </form>
                    <form action="/admin/moviemanagement/delete">
                    
                    <div id="dbmanagement-input-data" class="col-lg-12">
                        <table id="db-info" class="table table-hover">
                            <thead>
                              <tr>
                                <th scope="col">영화id</th>
                                <th scope="col">영화제목</th>
                                <th scope="col">제작국가</th>
                                <th scope="col">장르</th>
                                <th scope="col">조회수</th>

                              </tr>
                            </thead>
                            <tbody>
                             <c:forEach var="m" items="${movielist}" end="10">
                              <tr>
                                <td>${m.movie_docid}</td>
                                <td>${m.title}</td>
                                <td>${m.nation}</td>
                                <td>${m.genre}</td>
                                <td>${m.movie_hit_count}</td>
                              </tr>
                           </c:forEach>
                                
                              
                            </tbody>
                          </table>
                          </div>
                          <c:set var="page" value="${(param.p == null)?1:param.p}"/>
                              <c:set var="startNum" value="${page-(page-1)%5}" />
                              <c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10),'.')}"/>
                              
                              <div style="margin-bottom:30px; text-align: center; ">
                              <span>현재페이지 ${(empty param.p)?1:param.p}</span>
                              /${lastNum} page
                          </div>
                          <nav id="dbmanagement-data-page" aria-label="Page navigation example">
                            <ul id="dbmanagement-pagiedit" class="pagination">
                              <c:if test="${startNum-1>0}">
                                <li class="page-item" ><a class="page-link" href="?p=${startNum-1}&f=${param.f}&q=${param.q}">이전</a></li>
                              </c:if>
                              <c:if test="${startNum<=1}">
                                <li class="page-item" ><a class="page-link" onclick="alert('첫번째 페이지입니다.')">이전</a></li>
                              </c:if>
                              
                                <c:forEach var="i" begin="0" end="4">
                                <c:if test="${(startNum+i) <= lastNum}">
                                <li class="page-item ${(page==(startNum+i))?'active':''}"><a class="page-link" href="?p=${startNum+i}&f=${param.f}&q=${param.q}">${startNum+i}</a></li>
                                </c:if>
                                
                                </c:forEach>
                                <c:if test="${startNum+4<lastNum}">
                                <li class="page-item"><a class="page-link" href="?p=${startNum+5}&f=${param.f}&q=${param.q}">다음</a></li>
                                </c:if>
                                <c:if test="${startNum+4>=lastNum}">
                                <li class="page-item"><a class="page-link" onclick="alert('다음 페이지가 없습니다.')">다음</a></li>
                                </c:if>
                            </ul>
                          </nav>
                          
                    </form>

                          
                      </div>
                </div>
			
		
	</div>
	<script src="js/jquery.min.js"></script>

	<script src="js/bootstrap.bundle.min.js"></script>

	<script src="js/accordion.js"></script>
	<script>
      $("#db-info tbody tr").click(function(){

    	  //현재클릭된 row(<tr>)
          var tr = $(this);
          var td = tr.children();
          //값저장
          var docid = td.eq(0).text();
          var url = "/admin/moviemanagement/edit?movieDocid="+docid;
          location.href = url;
          });
      </script>
</body>
</html>