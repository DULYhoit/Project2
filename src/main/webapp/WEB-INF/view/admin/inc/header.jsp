<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/admin/admin-header.css">
    <link rel="stylesheet" href="css/admin/admin-nav.css">
    <link rel="stylesheet" href="css/admin/admin-content.css">
</head>
<body>
<!--헤더 반응형-->
        
                <!--헤더 반응형-->
            <div class="row">
                <div id="header-col" class="col-lg-12" >
                    <!--헤더영역-->
                    
                        <div id="logo-container">
                            <div id="logo">
                                <img  src="/img/admin/adminLogo.png" alt="" height="280" width="180">
                                <div id="icons">
                                    <div id="gohome">
                                        <img src="/img/admin/home.png" alt="">
                                        <span>home</span>
                                    </div>
                                    <div id="logout">
                                        <img src="/img/admin/logout.png" alt="">
                                        <span>logout</span>

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
      $("#gohome").click(function(){

    	 ;
          var url = "/";
          location.href = url;
          });
      </script>
      <script>
      $("#logout").click(function(){

    	 ;
          var url = "/logout";
          location.href = url;
          });
      </script>
    
</body>
</html>