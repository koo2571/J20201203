<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
정말로 삭제하시겠습니까?<p>
<input type="button" value="예" onclick="location.href='tipCommDeletePro.do?pageNum=${pageNum}&bd_num=${bd_num }&comm_id=${comm_id}&comm_num=${comm_num }&id=${id }&commPageNum=${commPageNum }&type_num=${type_num}'">
<input type="button" value="아니오" onclick="history.back()">
</body>
</html>