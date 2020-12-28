<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp"%>
    <%  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="locationcss/mainDegin.css"/>
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.3.min.js"></script>

</head>
<body>
	<input type="hidden" name="id" value="${id }">
   <div>
       <nav class="navbar navbar-dark bg-dark">
                
          <a class="navbar-brand" href="main.do">
             반려동물 커뮤니티사이트 
          </a>
          
          <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
          
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="#">마이페이지</a>
      </li>      
      <li class="nav-item active">
        <a class="nav-link" href="#">회원가입<span class="sr-only">(current)</span></a>
      </li><li class="nav-item active">
        <a class="nav-link" href="#">마이페이지</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="loginForm.do">로그인</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">장바구니</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">로그아웃</a>
      </li>
    </ul>
    
  </div>
</nav>
</nav>
       
   
   </div>
   
   
   <div style="height: 100px;">
   
   </div>
   <div>
     <a href="storeBoard.do">스토어게시판</a>
    </div><p>
    
    <div>
     <a href="tipList.do?id=${id }">팁노하우게시판</a>
    </div>
     
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</body>

</html>