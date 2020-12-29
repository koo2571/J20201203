<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <c:if test="${result > 0 }">
           <script type="text/javascript">
                 alert('로그인이 됬습니다.');
                 location.href='main.do?id=${id}';
           </script>
      </c:if>
      
      <c:if test="${result == -1 }">
           <script type="text/javascript">
                 alert('비밀번호가 틀렸습니다.');
                 location.href='loginForm.do';
           </script>
      </c:if>
      
      <c:if test="${result == -2 }">
           <script type="text/javascript">
                 alert('존재하지않는 아이디입니다.');
                 location.href='login.do';
           </script>
      </c:if>
</body>
</html>