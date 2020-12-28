<%@page import="java.util.Date"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="date" value="<%=new Date() %>"/>
</head>
<body>
<fmt:formatDate value="${date }" type="date" pattern="YYYY/MM/dd (E)"/><p>
<fmt:formatDate value="${date }" type="date" pattern="YYYY-MM-DD (E)"/><p>
<fmt:formatDate value="${date }" type="time" pattern="hh:mm:ss (a)"/><p>
</body>
</html>   