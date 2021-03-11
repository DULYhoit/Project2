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
                        <h1>pick 삭제</h1>
                      </div>
						
                      <div id="adddel-input-data" class="col-lg-12">
                        
                        <table id="pick-all" class="table table-hover">
                            <thead>
                              <tr>
                                <th scope="col">pickNo</th>
                                <th scope="col">ID</th>
                                <th scope="col">pick이름</th>
                               

                              </tr>
                            </thead>
                            
                            <tbody>
                            
                              <c:forEach var="pick" items="${pickinfo}" end="10">
                              
                              <tr>
                              <td>${pick.pickIndex}</td>
                                <td>${pick.fkMemberEmail}</td>
                                <td>${pick.pickName}</td>
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
                        <nav id="adddel-data-page" aria-label="Page navigation example">
                          <ul id="pick-delete-pagiedit" class="pagination">
                          <c:if test="${startNum-1>0}">
                                <li class="page-item" ><a class="page-link" href="?p=${startNum-1}">이전</a></li>
                              </c:if>
                              <c:if test="${startNum<=1}">
                                <li class="page-item" ><a class="page-link" onclick="alert('첫번째 페이지입니다.')">이전</a></li>
                              </c:if>
                              
                                <c:forEach var="i" begin="0" end="4">
                                <c:if test="${(startNum+i) <= lastNum}">
                                <li class="page-item ${(page==(startNum+i))?'active':''}"><a class="page-link" href="?p=${startNum+i}">${startNum+i}</a></li>
                                </c:if>
                                
                                </c:forEach>
                                <c:if test="${startNum+4<lastNum}">
                                <li class="page-item"><a class="page-link" href="?p=${startNum+5}">다음</a></li>
                                </c:if>
                                <c:if test="${startNum+4>=lastNum}">
                                <li class="page-item"><a class="page-link" onclick="alert('다음 페이지가 없습니다.')">다음</a></li>
                                </c:if>
                          </ul>
                        </nav>
					<form action="/admin/pickdelete/delmovie">
                    <div id="adddel-input-data" class="col-lg-12">
                        <table class="table table-hover">
                            <thead>
                              <tr>
                                <th scope="col">선택</th>
                                <th scope="col">pick이름</th>
                                <th scope="col">영화ID</th>
                                <th scope="col">영화제목</th>
                                <th scope="col">제작국가</th>
                                <th scope="col">장르</th>
                                <th scope="col">조회수</th>
                              </tr>

                            </thead>
                            <tbody id="get-table-data">
                            <c:if test="${!empty pickmovies}">
                            <c:forEach items="${pickmovies}" var="pickmovies">
                             <tr>
                                <td><input type="checkbox" name="list" value="${pickmovies.fkPickIndex},${pickmovies.movieDocid}"></input></td>
                                <td>${pickmovies.pickName} <input type="hidden" name="fkpickno" value="${pickmovies.fkPickIndex}"></td>
                                <td>${pickmovies.movieDocid}</td>
                                <td>${pickmovies.title}</td>
                                <td>${pickmovies.nation}</td>
                                <td>${pickmovies.genre}</td>
                                <td>${pickmovies.movieHitCount}</td>
                             
                              </tr>
                                
                            
                            </c:forEach>
                            </c:if>
                            <c:if test="${empty pickmovies}">
                            <tr>
                                <td><input type="hidden" name="fkpickno" value="${param.pickno}"></input></td>
                                
                             
                              </tr>
                            </c:if>
							
							
                              
                            </tbody>
                          </table>
                        </div>
                        <div id="adddel-btn-container">
                            <button id="adddel-del-one" type="button" class="btn btn-primary" data-toggle="modal" data-target="#a-del-one">선택삭제</button>
                            <!--modal1-->
                            <div class="modal fade" id="a-del-one" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="exampleModalLabel">해제</h5>
                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                      </button>
                                    </div>
                                    <div class="modal-body">
                                     선택 삭제를 하시겠습니까?
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                      <button type="submit" name="sub" value="1" class="btn btn-primary">확인</button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            <button id="adddel-del-all" type="button" class="btn btn-primary" data-toggle="modal" data-target="#a-del-all">전체삭제</button>
                            <!--modal2-->
                            <div class="modal fade" id="a-del-all" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="exampleModalLabel">해제</h5>
                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                      </button>
                                    </div>
                                    <div class="modal-body">
                                     전체 삭제를 하시겠습니까?
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                      <button type="submit" name="sub" value="2" class="btn btn-primary">확인</button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                        </div>
					</form>
                        
                      </div>

			
		
	</div>
	</div>
	<script src="/js/jquery.min.js"></script>

    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/admin/adminmovie/js/accordion.js"></script>
     <script>
      $("#pick-all tbody tr").click(function(){

    	  //현재클릭된 row(<tr>)
          var tr = $(this);
          var td = tr.children();
          //값저장
          var pickno = td.eq(0).text();
          var em = td.eq(1).text();
          var pn = td.eq(2).text();
          console.log(em);
          console.log(pn);
          var url = "/admin/pickdelete?pickno="+pickno+"&em="+em+"&pn="+pn;
          location.href = url;
          });
      </script>
    
</body>
</html>