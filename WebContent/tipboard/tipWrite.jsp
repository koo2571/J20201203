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
<form action="tipWritePro.do?bd_num=${bd_num }&pageNum=${pageNum }&id=${id}" method="post">
	<input type="hidden" name="id" value="${id }">
	<input type="hidden" name="type_num" value="200">
	<table border="1">
		<caption><h2>팁앤노하우 글쓰기</h2></caption>
		<tr>
			<td>제목</td>
			<td><input type="text" name="bd_title" required="required"></td>
		</tr>
		<tr>
			<td>작성내용</td>
			<td><textarea rows="30" cols="30" name="bd_cont" required="required"></textarea></td>
		</tr>
		<tr>
			<td><input type="submit" value="글쓰기"></td>
		</tr>
	</table>
</form>
</body>
</html>