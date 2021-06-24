<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<h1>고객서비스 게시판</h1>
	<!-- 검색 기능 -->
	<form action="getCsList.do" method="post">
	<table border="1">
		<tr>
			<td>
				<select name="searchCondition">
					<option disabled selected>- - 😺 필터 🐶 - -</option>
					<c:forEach items="${conditionMap }" var="option">
						<option value="${option.value }">${option.key }</option>
					</c:forEach>
				</select>
				<input name="searchKeyword" value="${map.searchKeyword }"/>
				<input type="submit" value="조회"/>
				<button><a href="getCsList.do">글 목록</a></button>
				<button><a href="redirectInsertCs.do">새글 추가</a></button> <!--  로그인 해야함 -->
		</tr>
	</table>
	</form>
	
	<br><br><br>
	총 ${map.count}개의 게시물이 있습니다.
		<table border="1">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>공개 여부</td>
				<td colspan="3">작성일</td>
			</tr>
					<!-- forEach var="개별데이터" items="집합데이터" -->
			<c:forEach items="${map.csList}" var="cs">
			<tr>
					<td>${cs.cs_id }</td>
					<td><a href="getCs.do?cs_id=${cs.cs_id }">${cs.cs_title}</a></td>				
					<td>${cs.cs_writer}</td>
					<td>${cs.cs_show }</td>
					<td><fmt:formatDate value="${cs.cs_regdate }" pattern="yyyy년 MM월 dd일 HH시mm분"/></td>			
					<td><a href="deleteCs.do?cs_id=${cs.cs_id}"> 삭제</a></td>
					<td><a href="updateCs.do?cs_id=${cs.cs_id}"> 수정</a></td>		
			</tr>
			</c:forEach>
			
		<!-- 페이지 네비게이션 출력 -->
		
		
		
		<tr>
			<td colspan="7" align="center">
			<c:if test="${map.csPagination.curBlock > 1}">
			 <a href="#" onclick="list('1')">◀◀</a>
			 </c:if>
			 <c:if test="${map.csPagination.curBlock > 1}">
			  <a href="#" onclick="list('${map.csPagination.prevPage}')">◀</a>
			  </c:if>
			  
			<c:forEach var="num" 
							   begin="${map.csPagination.blockBegin}" 
							   end="${map.csPagination.blockEnd}">
					<c:choose>
					<c:when test="${num == map.csPagination.curPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
					<!--  현재 페이지인 경우에는 링크를 빼고  -->
					<span style="color:lightSalmon; background-color: gray;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
					</c:choose>
			</c:forEach>
			
			<c:if test="${map.csPagination.curBlock <= map.csPagination.totBlock}">
			 <a href="#" onclick="list('${map.csPagination.nextPage}')">▶</a>
			</c:if>
			<c:if test="${map.csPagination.curBlock < map.csPagination.totPage}">
			 <a href="#" onclick="list('${map.csPagination.totPage}')">▶▶</a>
			</c:if>
			</td>
		</tr>			
		</table>			
</div>
</body>
</html>