<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>CS 수정</h1>
	<form action="updateCs.do" method="post">
 <!--  앞에 csData는 controller에서 sessionAttributes and model.addAttribute() -->
		<table>
			<tr>
				<td><label for="cs_id">글번호</label><input type="text" name="cs_id" style="outline:none" value="${csData.cs_id }" readonly></td>
				<td><label for="member_id">멤버아이디</label><input type="text" name="member_id" value="${csData.member_id }" readonly></td>
			</tr>
			<tr>
				<td><label for="cs_title">제목</label><input type="text" name="cs_title" value="${csData.cs_title }"  autofocus  required></td>
			</tr>
			<tr>
				<td><label for="cs_writer">작성자</label><input type="text" name="cs_writer" value="${csData.cs_writer }"></td>
			</tr>
			<tr>
				<td><label for="cs_regdate">최초 작성일</label><fmt:formatDate value="${csData.cs_regdate}" pattern="yyyy년 MM월 dd일 HH시mm분"/></td>
			</tr>
			<tr>
			<!-- DB에 저장안하고 띄우기만하기 -->
				<td><label for="cs_moddate">수정일</label><fmt:formatDate value="<%= new java.util.Date(System.currentTimeMillis()) %>" pattern="yyyy년 MM월 dd일 HH시mm분"/></td>
			</tr>			
			<tr>
				<td><label for="cs_show">공개 여부</label>
						<input type="text" name="cs_show" value="${csData.cs_show }" readonly/>
				</td>
			</tr>
			<tr>
				<td><label for="cs_content">내용</label><br>
					<textarea name="cs_content" cols="50" rows="10" required>${csData.cs_content }</textarea>
				</td>
			</tr>
			<tr>
				<td><label for="cs_img">이미지</label><input type="text" name="cs_img" value="${csData.cs_img }"></td>
			</tr>
			<tr>
				<td><label for="cs_file">첨부파일</label><input type="text" name="cs_file" value="${csData.cs_file }"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
	<hr>
	<a href="getCsList.do">게시글 목록</a>
</div>
</body>
</html>