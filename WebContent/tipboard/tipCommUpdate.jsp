<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="tipCommUpdatePro.do?id=${id}&bd_num=${bd_num}&pageNum=${pageNum }">
	<input type="hidden" name="type_num" value="200">
	<input type="hidden" name="comm_id" value="${id }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="id" value="${id }">
	<input type="hidden" name="comm_num" value="${comm_num }">
	<input type="hidden" name="bd_num" value="${bd_num }">
	댓글내용 : <input type="text" name="comm_cont" value="${comments.comm_cont }"><p>
	<input type="submit" value="수정">	
</form>
<input type="button" value="수정취소" onclick="history.back();">
</body>
</html>