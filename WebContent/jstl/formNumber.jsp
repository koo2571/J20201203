<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:formatNumber value="10000" groupingUsed="true"/><br>
<fmt:formatNumber value="3.1415923" pattern="#.###"/><br>
<fmt:formatNumber value="3.1" pattern="#.##"/><br>
<fmt:formatNumber value="3.1" pattern="#.00"/><br>
<fmt:formatNumber value="12356489756" pattern="##,###.00"/><br>
<fmt:formatNumber value="25000" type="currency" currencySymbol="\$"/><br>
<fmt:formatNumber value="0.75" type="percent"/><br>
</body>
</html>