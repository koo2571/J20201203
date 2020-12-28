<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <%-- <c:if test="${ id != null && id.equals('관리자')}"> --%>
             <!-- <a href="sbdwriteForm.do">스토어게시판 글쓰기(관리자용)</a> -->
      <%-- </c:if> --%>
      
      <a href="sBdWriteForm.do">게시판글쓰기</a>
      <table>
         <c:forEach var="storelist" items="${storelist}">
              <tr>
              <td>${storelist.id }</td>
              <td>${storelist.bd_num }</td>
              <td>${storelist.s_cart }</td>
              <td>${storelist.bd_title }</td>
              <td>${storelist.bd_view }</td>
              <td>${storelist.bd_like }</td>
              <td>${storelist.bd_date }</td>
              <td>${storelist.s_price }</td>
              <td>${storelist.s_pic }</td>
              </tr>
         </c:forEach>
      </table>
</body>
</html>