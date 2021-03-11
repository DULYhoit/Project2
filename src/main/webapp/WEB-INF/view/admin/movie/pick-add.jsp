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
                        <h1>pick 추가</h1>

                    </div>
                    <form action="/admin/pickadd" method="get">
                    <div id="addpick-search-container">
                        <div id="addpick-input-tag">
                            <select class="custom-select" id="addpick-select-search" name="f">
                            <option ${(param.f == "title")?"selected":""} value="title">제목</option>
                            <option ${(param.f == "nation")?"selected":""} value="nation">제작국가</option>
                            <option ${(param.f == "genre")?"selected":""} value="genre">장르</option>
                          </select>
                            
                            
                        </div>
                        <div id="addpick-input-text">
                            <div id="addpick-mtext" class="input-group mb-3">
                                <div class="input-group-prepend">
                                  <span class="input-group-text" id="basic-addon1"><img src="/svg/admin/search.svg" alt="bootstrap"></span>
                                </div>
                                <input type="text" id="movienameval" name="q" value="${param.q}" class="form-control" placeholder="영화제목" aria-label="Username" aria-describedby="basic-addon1">
                              </div>

                        </div>
                        <div id="addpick-btn-click">
                            <button type="submit" class="btn btn-primary btn-sm" id="addpick-select-button">조회</button>
                        </div>



                    </div>
                    </form>
                    
                    <div id="addpick-input-data" class="col-lg-12">
                        <table id="send-table-data" class="table table-hover">
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
                              <c:set var="page" value="${(param.p == null)?1:param.p}"/>
                              <c:set var="startNum" value="${page-(page-1)%5}" />
                              <c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10),'.')}"/>
                          <div style="margin-bottom:30px ">
                              <span>현재페이지 ${(empty param.p)?1:param.p}</span>
                              /${lastNum} page
                          </div>
                          <nav id="addpick-data-page" aria-label="Page navigation example">
                              <ul id="pagiedit" class="pagination">
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
                        </div>
                            
                             
                             
                       
                   <form action="/admin/pickadd/submit" method="get">
                    <div id="addpick-input-title" >
                        <div id="addpick-ctitle">
                            <h5>컬렉션이름</h3>
                            </div>

                        <div id="addpick-input-cname">
                            <input type="text" name="cbname" value="${param.cbname}" class="form-control" placeholder="컬렉션이름" aria-label="cname" aria-describedby="basic-addon1">  

                        </div>

                    </div>
                    <div id="follow-data-container">
                        <table id="follow-data" class="table table-sm" class="col-lg-12">
                            <thead>
                              <tr>
                              
                                <th scope="col">삭제</th>
                                <th scope="col">영화id</th>
                                <th scope="col">영화제목</th>
                                <th scope="col">제작국가</th>
                                <th scope="col">장르</th>
                                <th scope="col">조회수</th>
                              </tr>
                            </thead>
                            <tbody id="get-table-data">
                             
                            </tbody>
                          </table>
                    </div>
                              
                              

                    <div id="addpick-submit">
                        <button type="submit" class="btn btn-primary">추가하기</button>
                    </div>
                    <input type="hidden" name="f" value="${param.f}">
                    <input type="hidden" name="q" value="${param.q}">
                    <input type="hidden" name="p" value="${param.p}">
                   </form>

                    
                </div>

			
		
	</div>
	</div>
	<script src="/js/jquery.min.js"></script>

    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/admin/adminmovie/js/accordion.js"></script>
    <script src="plugins/cookie/jquery.cookie.js"></script>  
    <script>
      $("#send-table-data tbody tr").click(function(){
        
        
        // var on=$(this).addClass('On')
        //  if(on.hasClass('On') === true){
        //    $(this).off('click')
        //  }
        
        //현재클릭된 row(<tr>)
        var tr = $(this);
        var td = tr.children();
        //값저장
        var mid = td.eq(0).text();
        var mname = td.eq(1).text();
        var nation = td.eq(2).text();
        var genre = td.eq(3).text();
        var hit = td.eq(4).text();
        var html = ""
      html += '<tr>';
      html += '<td><button id="delbtn" type="button" class="btn btn-primary btn-sm">삭제</button></td>';
      html += '<td>' + mid + '</td>';
      html += '<td>' + mname + '</td>';
      html += '<td>' + nation + '</td>';
      html += '<td>' + genre + '</td>';
      html += '<td>' + hit + '</td>';
      html += '<input type="hidden" name="mid" value='+mid+'>'+'</td>';
      html += '</tr>';
      $("#get-table-data").append(html);
        $.cookie('html',html);  
      	$.cookie('html');
      
      //삭제
      
    })
    
    $('#follow-data').on("click", "button", function() {
  var remove =$(this).closest("tr").remove()
  $(this).removeClass('On')
 
});
    


      </script>
      
 
</body>
</html>