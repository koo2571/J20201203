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
	<input type="hidden" name="id" value="${id }">
	<input type="hidden" name="type_num" value="200">
	<table border="1">
		<tr>
			<td>제목</td>
			<td>${board.bd_title }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${board.id }</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${board.bd_date }</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${board.bd_view }</td>
		</tr>
		<tr>
			<td>추천수</td>
			<td>${board.bd_like }</td>
			<td><input type="button" value="추천" onclick="location.href='tipLike.do?pageNum=${pageNum}&bd_num=${bd_num}&id=${id }'"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><pre><textarea rows="15" cols="30">${board.bd_cont }</textarea></pre></td>
		</tr>
		<tr>
		<c:if test="${board.id == id }">
			<td><input type="button" value="수정하기" onclick="location.href='tipUpdate.do?pageNum=${pageNum}&bd_num=${bd_num}&id=${id}'"></td>
			<td><input type="button" value="삭제하기" onclick="location.href='tipDelete.do?pageNum=${pageNum}&bd_num=${bd_num}&id=${id}'"></td>
		</c:if>
			<td><input type="button" value="목록" onclick="location.href='tipList.do?pageNum=${pageNum}&id=${id}'"></td>
		</tr>
	</table>
</body>
</html>