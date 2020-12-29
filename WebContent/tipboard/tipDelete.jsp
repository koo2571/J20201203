<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
정말 삭제하시겠습니까?
<input type="button" value="예" onclick="location.href='tipDeletePro.do?pageNum=${pageNum }&bd_num=${bd_num}'">
<input type="button" value="아니요" onclick="location.href='tipContent.do?pageNum=${pageNum }&bd_num=${bd_num}'">
</body>
</html>