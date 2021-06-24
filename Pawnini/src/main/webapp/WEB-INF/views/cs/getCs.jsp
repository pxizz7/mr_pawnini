<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ page import ="com.pawnini.model.cs.CsDTO" %>
<%@ page import="java.util.Date" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pawnini - [${csData.cs_title } ]</title>
</head>
<body>
<div>
	<h1>${csData.cs_title } 상세 내용</h1>
	<a href="getCsList.do">게시글 목록</a>
	<a href="updateCs.do?cs_id=${csData.cs_id}">수정</a> <!--  이건 로그인 -->
	<a href="deleteCs.do?cs_id=${csData.cs_id}">삭제</a> 
	
		
	<form action="getCs.do" method="post">
		<table>
			<tr>
				<td><label for="cs_title">제목</label> ${csData.cs_title }</td>
			</tr>
			<tr>
				<td><label for="cs_writer">작성자</label> ${csData.cs_writer }</td>
			</tr>
			<tr>
				<td><label for="cs_regdate">작성일</label><fmt:formatDate value="${csData.cs_regdate }" pattern="yyyy년 MM월 dd일 HH시mm분"/></td>
			</tr>			
			<tr>
				<td><label for="cs_show">공개 여부</label> ${csData.cs_show }</td>
			</tr>
			<tr>
				<td><label for="cs_content">내용</label><br>
					<textarea name="cs_content" cols="50" rows="10" readonly> ${csData.cs_content }</textarea>
				</td>
			</tr>
			<tr>
				<td><label for="cs_img">이미지</label> ${csData.cs_img }</td>
			</tr>
			<tr>
				<td><label for="cs_file">첨부파일</label>${csData.cs_file }</td>
			</tr>
		</table>
	</form>
	<hr>
	<!--  이전글, 다음글 -->
	<table>
		<tr>이전글 : ${csData.cs_title }</tr>
		<tr>다음글 : $ {}</tr>
	</table>
	
	<!--  replyyyyyyy bit-->
<!--  include 사용해수 추가 -->
	
	</table>
	
</div>
</body>
</html>