<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EUTCHAPEDIA || ADMIN</title>
   <link rel="stylesheet" href="css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
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
				<jsp:include page="/WEB-INF/view/admin/inc/header.jsp"/>
				<!-- nav끝 -->
				
				<!--section 반응형-->
      <div id="section-col" class="col-lg-10">
        <div id="pick-h1">
          <h1>코맨트 등록</h1>

        </div>
        <div id="comment-move-container">
          <div id="comment-move-enrollment" style="background-color: #3498DB;">
            <h2>등록</h2>
          </div>
          <div id="comment-move-cancel">
            <h2>취소</h2>
          </div>
        </div>
        <!--if notfound 구문-->
        <div id="notfound-input-data" class="col-lg-12">
          <div id="notfound">
            <span>
              <h1>정보를 찾을수 없습니다.</h1>
            </span>
          </div>
        </div>
        <div id="btn-container">
          <button id="comment-del-one" type="button" class="btn btn-primary" data-toggle="modal"
            data-target="#c-del-one">선택블라인드</button>
          <!--modal1-->
          <div class="modal fade" id="c-del-one" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">해제</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  선택블라인드 하시겠습니까?
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                  <button type="button" class="btn btn-primary">확인</button>
                </div>
              </div>
            </div>
          </div>
          <button id="comment-del-all" type="button" class="btn btn-primary" data-toggle="modal"
            data-target="#c-del-all">전체블라인드</button>
          <!--modal2-->
          <div class="modal fade" id="c-del-all" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">해제</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  전체블라인드 하시겠습니까?
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                  <button type="button" class="btn btn-primary">확인</button>
                </div>
              </div>
            </div>
          </div>

        </div>
        <nav id="comment-data-page" aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#">이전</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">다음</a></li>
          </ul>
        </nav>
      </div>

			
		
	</div>
	</div>
	<script src="js/jquery.min.js"></script>

	<script src="js/bootstrap.bundle.min.js"></script>

	<script src="js/accordion.js"></script>
</body>
</html>