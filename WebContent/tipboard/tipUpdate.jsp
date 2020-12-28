<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="tipUpdatePro.do?pageNum=${pageNum }&bd_num=${bd_num }&id=${id}" method="post">
	<input type="hidden" name="id" value="${id }">
	<table border="1">
		<caption><h2>게시글 수정하기</h2></caption>
		<tr>
			<td>제목</td>
			<td><input type="text" name="bd_title" required="required"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><pre><textarea rows="15" cols="30" name="bd_cont" required="required"></textarea></pre></td>
		</tr>
		<tr>
			<td><input type="submit" value="수정"></td>
		</tr>
	</table>
</form>
</body>
</html>