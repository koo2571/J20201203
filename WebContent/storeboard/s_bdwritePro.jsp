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
   <c:if test="${result > 0}">
         <script type="text/javascript">
                alert('입력완료');
                location.href='storeBoard.do';
         </script>
   </c:if>
   
   <c:if test="${result == 0}">
            <script type="text/javascript">
                 alert('게시판이 올라가지않았습니다.');
                 location.href='sBdWriteForm.do';
            </script>
   </c:if>
</body>
</html>