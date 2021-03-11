<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/admin/admin.css">
  <title>블랙리스트 관리</title>
</head>
<body>
  <div class="container">
	<jsp:include page="/WEB-INF/view/admin/inc/header.jsp"/>

    <!--content 반응형-->
    <div class="row">
	<jsp:include page="/WEB-INF/view/admin/inc/nav.jsp"/>
      
      <!--section 반응형-->
      <div id="section-col" class="col-lg-10">

        <!--바디시작-->
        <div id="title" >
          <h1 style="font-weight: bold;">블랙리스트관리</h1>
        </div>
        <div id="allsize" class="col-lg-12">
          <div id="search-block" >

            <select class="custom-select" id="select-search">
              <option selected>검색항목을 고르세요</option>
              <option value="1">영구정지</option>
              <option value="2">코멘트차단</option>
            </select>
            <input class="form-control" type="text" id="searchbar" placeholder="내용을입력해주세요">
            <button type="button" class="btn btn-primary " id="search-btn">검색</button>
            </br>

          </div>

          <div id="table-contorll"  >
            <table class="table table-hover ">
              <thead>
                <tr>
                  <th scope="col">No.</th>
                  <th scope="col"></th>
                  <th scope="col">이름</th>
                  <th scope="col">이메일</th>
                  <th scope="col">가입날자</th>
                  <th scope="col">신고횟수</th>
                  <th scope="col">상태</th>
                </tr>
              </thead>
              <tbody >
                <tr>
                  <th scope="row">1</th>
                  <td> <input class="form-check-input" type="checkbox" value="" id="userSelect"></td>
                  <td>이은규</td>
                  <td>cuteeungyu@naver.com</td>
                  <td>2021/02/01</td>
                  <td>10</td>
                  <td>영구정지</td>
                </tr>

                <tr>
                  <th scope="row">2</th>
                  <td> <input class="form-check-input" type="checkbox" value="" id="userSelect"></td>
                  <td>백종웅</td>
                  <td>jjeremy@naver.com</td>
                  <td>2021/02/01</td>
                  <td>20</td>
                  <td>영구정지</td>
                </tr>

                <tr>
                  <th scope="row">3</th>
                  <td> <input class="form-check-input" type="checkbox" value="" id="userSelect"></td>
                  <td>방부제</td>
                  <td>bang@naver.com</td>
                  <td>2021/02/01</td>
                  <td>30</td>
                  <td>영구정지</td>
                </tr>
              </tbody>
            </table>
            </br></br></br></br></br></br></br></br>
            <div>

              <select class="custom-select" id="select-block">
                <option selected>차단 종류를 고르세요</option>
                <option value="1">영구차단</option>
                <option value="2">코멘트차단</option>
              </select>

              <button type="button" class="btn btn-primary " id="block-btn"  data-toggle="modal" data-target="#reBlock">재설정</button>
              <button type="button" class="btn btn-primary " id="delete-btn"  data-toggle="modal" data-target="#cslBlock">해제</button>

            </div>

            <div class="modal fade" id="reBlock" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">재설정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    재설정 하겠습니까?
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary">확인</button>
                  </div>
                </div>
              </div>
            </div>


            <div class="modal fade" id="cslBlock" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">해제</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    차단을 해제하겠습니까?
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary">확인</button>
                  </div>
                </div>
              </div>
            </div>




            
            <div id="navigation">
              <nav aria-label="Page navigation example">
                <ul class="pagination" id="page-controll">
                  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
              </nav>
            </div>
          </div>
        </div>








      </div>
    </div>
  </div>









  <script src="/js/jquery.min.js"></script>

  <script src="/js/bootstrap.bundle.min.js"></script>
  <script src="/js/accordion.js"></script>
</body>
</html>