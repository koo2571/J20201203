<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div.al{
		display: inline-block;
	}
</style>
</head>
<body> 
	<input type="hidden" name="id" value="${id }">
	<input type="hidden" name="type_num" value="200">
	<input type="hidden" name="bd_num" value="${bd_num }">
	<input type="hidden" name="commPageNum" value="${commPageNum }">
	<input type="hidden" name="pageNum" value="${pageNum }">
		<div class="al">
			제목: &nbsp;&nbsp;${board.bd_title }
		</div><p>
		<div class="al">
			작성자: &nbsp;&nbsp;${board.id }
		</div><p>
		<div class="al">
			작성일: &nbsp;&nbsp;${board.bd_date }
		</div><p>
		<div class="al">
			조회수: &nbsp;&nbsp;${board.bd_view }
		</div><p>
		<div class="al">
			추천수: &nbsp;&nbsp;${board.bd_like }&nbsp; <input type="button" value="추천" onclick="location.href='tipLike.do?pageNum=${pageNum}&bd_num=${bd_num}&id=${id }'">
		</div><p>
	
		<div class="al">
			<c:if test="${board.bd_pic != null}">
			내용 : <p>
			<img src="${context }/${board.bd_pic }"><pre><textarea rows="15" cols="30">${board.bd_cont }</textarea></pre>
			</c:if>
			<c:if test="${board.bd_pic == null}">
			내용 : &nbsp;&nbsp;<pre><textarea rows="15" cols="30">${board.bd_cont }</textarea></pre>
			</c:if>
		</div><p>
		
		<div style="font-size: x-large; ">
			댓글
		</div>	
		<c:if test="${commTotCnt>0 }">
			<c:forEach var="commList" items="${commList }">
				<div>
					<h4>작성자: ${commList.comm_id}  &nbsp;&nbsp; <pre>${commList.comm_cont }</pre> </h4>
					<h6><span>작성자: ${commList.comm_id} 작성일: ${commList.comm_date } 추천수: ${commList.comm_like }</span></h6>
				</div>	
				<div>
				<c:if test="${commList.comm_id == id }">					
						<input type="button" value="댓글수정" onclick="location.href='tipCommUpdate.do?bd_num=${bd_num}&id=${id }&comm_id=${commList.comm_id }'">
						<input type="button" value="댓글삭제" onclick="location.href='tipCommDelete.do?bd_num=${bd_num}&id=${id }&comm_id=${commList.comm_id }&pageNum=${pageNum }&type_num=200&comm_num=${commList.comm_num }&commPageNum=${commPageNum }'">
							<%-- <c:if test="${commList.comm_id != null || commList.id != null }">					
							<input type="button" value="댓글추천" onclick="location.href='tipCommLike.do?bd_num=${bd_num}&id=${id }&comm_id=${commList.comm_id }&pageNum=${pageNum }&type_num=200&comm_num=${commList.comm_num }&commPageNum=${commPageNum }'">			
							</c:if>		 --%>			
				</c:if>
<%-- 				<c:if test="${commList.comm_id != id }"> --%>					
						<input type="button" value="댓글추천" onclick="location.href='tipCommLike.do?bd_num=${bd_num}&id=${id }&comm_id=${commList.comm_id }&pageNum=${pageNum }&type_num=200&comm_num=${commList.comm_num }&commPageNum=${commPageNum }'">														
				<%-- </c:if> --%>
				<c:set var="commStartNum" value="${commStartNum -1 }" />			
				</div>
			</c:forEach>
		</c:if>	<p>
		<c:if test="${id != '' }">
		<form action="tipCommWritePro.do?pageNum=${pageNum}&bd_num=${bd_num}&comm_id=${id}&board_id=${board.id }&type_num=200&commPageNum=${commPageNum }">
			<input type="hidden" name="comm_id" value="${id }">
			<input type="hidden" name="type_num" value="200">
			<input type="hidden" name="bd_num" value="${bd_num }">
			<input type="hidden" name="board_id" value="${board.id }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<input type="hidden" name="commPageNum" value="${commPageNum }">
			<input type="text" name="comm_cont" placeholder="댓글을 작성하세요">
			<input type="submit" value="댓글달기">
		</form>
		</c:if><p>
		<c:if test="${id == null || id== ''}">
			로그인을하면 댓글을 달수 있습니다.
		</c:if>	
		<c:if test="${commTotCnt == 0 }">
			댓글을 달아주세요!!<p>
		</c:if>		
		<c:if test="${commTotCnt > 0 }">
			<div>
				<c:if test="${commStartPage > commBlockSize }">
					<a href="tipContent.do?commPageNum=${commStartPage - commBlockSize }&bd_num=${bd_num}&id=${id}&type_num=200&pageNum=${pageNum}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${commStartPage }" end="${commEndPage }" >
					<a href="tipContent.do?commPageNum=${i }&bd_num=${bd_num}&id=${id}&type_num=200&pageNum=${pageNum}">[${i}]</a>
				</c:forEach>
				<c:if test="${commEndPage < commPageCnt }">
					<a href="tipContent.do?commPageNum=${commStartPage + commBlockSize }&bd_num=${bd_num}&id=${id}&type_num=200&pageNum=${pageNum}">[다음]</a>
				</c:if>
			</div>	
		</c:if><p>
		

		<c:if test="${board.id == id }">
			<input type="button" value="수정하기" onclick="location.href='tipUpdate.do?pageNum=${pageNum}&bd_num=${bd_num}&id=${id}&type_num=200&commPageNum=${commPageNum }'">
			<input type="button" value="삭제하기" onclick="location.href='tipDelete.do?pageNum=${pageNum}&bd_num=${bd_num}&id=${id}'">
		</c:if>
			<input type="button" value="목록" onclick="location.href='tipList.do?pageNum=${pageNum}&id=${id}'">
</body>
</html>