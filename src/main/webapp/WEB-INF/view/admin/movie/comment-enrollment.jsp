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
                        <h1>블라인드 등록</h1>

                    </div>
                    <div id="comment-move-container">
                        <div id="comment-move-enrollment" style="background-color: #3498DB;">
                            <h2>등록</h2>
                        </div>
                        <div id="comment-move-cancel" OnClick="location.href ='/admin/commentcansel'">
                            <h2>취소</h2>
                        </div>
                    </div>
                    <div id="comment-input-data" class="col-lg-12">
                        <table id="commentdata" class="table table-hover">
                            <thead>
                              <tr>
                              <th scope="col">코맨트번호</th>
                                <th scope="col">영화ID</th>
                                <th scope="col">아이디</th>
                                <th scope="col">블라인드 여부</th>
                                <th scope="col">신고횟수</th>
                                

                              </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${getnoblind}" var="no">
                                <tr>
                                    <td>${no.commentIndex}</td>
                                    <td>${no.fkMovieDocid}</td>
                                    <td>${no.fkMemberEmail}</td>
                                    <td>${no.commentBlindCheck}</td>
                                    <td>${no.commentReportCount}</td>
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
                         <nav id="comment-data-page" aria-label="Page navigation example">
                            <ul class="pagination">
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
                       
                       
                      </div>
				

			
		
	</div>
	</div>
	<script src="/js/jquery.min.js"></script>

    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/admin/adminmovie/js/accordion.js"></script>
    <script>
      $("#commentdata tbody tr").click(function(){

    	  //현재클릭된 row(<tr>)
          var tr = $(this);
          var td = tr.children();
          //값저장
          var commentno = td.eq(0).text();
          var docid = td.eq(1).text();
          var commentuserid = td.eq(2).text();
          var commentblind = td.eq(3).text();
          console.log(docid);
          console.log(commentuserid);
          console.log(commentblind);
          var url = "/admin/commentenroll/detail?commentno="+commentno+"&docid="+docid+"&em="+commentuserid+"&pn="+commentblind;
          location.href = url;
          });
      </script>
</body>
</html>