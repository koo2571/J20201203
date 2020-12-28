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
<c:if test="${result >0 }">
	<script type="text/javascript">
		alert('수정완료');
		location.href="tipContent.do?bd_num=${bd_num}&pageNum=${pageNum}&id=${id}";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert('수정실패');
		location.href="tipUpdate.do?pageNum=${pageNum}&bd_num=${bd_num}&id=${id}";
	</script>
</c:if>
</body>
</html>