<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <h2>스토어 물품 올리기</h2>
      <form action="sBdWritePro.do?pageNum=${pageNum}" method="post" enctype="multipart/form-data">       
            <input type="hidden" name="${id}">
            <input type="hidden" name="${bd_num}">
            <input type="hidden" name="${bd_view}">
            <input type="hidden" name="${bd_like}">
            <input type="hidden" name="${s_score}">
            <h4>제품카테코리</h4><p>
          <select name="type_num">
                  <option value="301">사료</option>
                  <option value="302">간식</option>
                  <option value="303">패션</option>
                  <option value="304">장난감</option>
          </select><p>
          제품명
          <input type="text" name="bd_title" style=" width:500px; "><p>
          제품이미지
          <input type="file" name="bd_pic" ><p>
          제품설명
          <pre><textarea name="bd_cont" cols="100" rows="50"></textarea></pre><p>
          제품가격
          <input type="text" name="s_price"><p>
          제품수량
          <input type="text" name="s_cnt"><p>
          
          <input type="submit" value="확인"><p>
      </form>
</body>
</html>