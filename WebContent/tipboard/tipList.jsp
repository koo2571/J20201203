<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팁&노하우</title>
</head>
<body>
<h2>팁&노하우 게시판</h2>
	<input type="hidden" name="id" value="${id }">
	<input type="hidden" name="type_num" value="200">
<table>
	<tr>
	<td><a href="tipWrite.do?id=${id }">글쓰기</a></td>
	<td>총 게시물</td><td>${totCnt }</td>
	</tr>
</table>
<table>
	<tr>
		<th>게시물 번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>추천수</th>		
	</tr>
	<c:if test="${totCnt > 0 }">
		<c:forEach var="tipBoard" items="${list }">
				<tr>
				<td>${startNum }</td>
				<c:if test="${tipBoard.comments_count>0 }">
				<td><a href="tipContent.do?bd_num=${tipBoard.bd_num }&pageNum=${currentPage}&id=${id}">${tipBoard.bd_title }</a>&nbsp;&nbsp;<a href="tipContent.do?bd_num=${tipBoard.bd_num }&pageNum=${currentPage}&id=${id}">[${tipBoard.comments_count }]</a></td>
				</c:if>
				<c:if test="${tipBoard.comments_count==0 }">
				<td><a href="tipContent.do?bd_num=${tipBoard.bd_num }&pageNum=${currentPage}&id=${id}">${tipBoard.bd_title }</a></td>
				</c:if>
				<td>${tipBoard.id }</td>
				<td>${tipBoard.bd_date }</td>
				<td>${tipBoard.bd_view }</td>
				<td>${tipBoard.bd_like }</td>
				</tr>
				<c:set var="startNum" value="${startNum -1 }" />
		</c:forEach>
	</c:if>	
	<c:if test="${totCnt == 0 }">
		<tr><td colspan="6">게시물이 없네욤</td></tr>
	</c:if>
</table>
<div style="text-align: center;">
		<c:if test="${startPage > blockSize }"> <!-- 1,11,21값을 주기위해 -->
			<a href="tipList.do?pageNum=${startPage - blockSize }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href="tipList.do?pageNum=${i }">[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }"><!-- 10,20,30값을 주기위해 -->
			<a href="tipList.do?pageNum=${startPage+blockSize }">[다음]</a>
		</c:if>
	</div>
	
	
	
	<form action="tipList.do" method="get">
         <table>
            <tr>
               <td align="center">
                  <select id="searchValue" name="searchValue">
                     <option value="subject">제목</option>
                     <option value="content">내용</option>               
                     <option value="writer">작성자</option>
                  </select>
                  <input id="searchkeyWord" name="searchkeyWord" type="text">
                  <input type="submit" value="검색 ">
               </td>
            </tr>      
         </table>
      </form>
</body>
</html>