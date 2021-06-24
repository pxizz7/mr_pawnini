<%@ page import ="com.pawnini.model.product_inq.impl.Product_inqDAO" %>
<%@ page import ="com.pawnini.model.product_inq.Product_inqDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에 저장된 게시글 정보를 꺼낸다.
	Product_inqDTO product_inqDTO = (Product_inqDTO)session.getAttribute("product_inqDTO");
%>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세</title>
</head>
  <%@ include file="../include/Header.jsp" %>
<body>
	<div align="center">
		<h1>글 상세</h1>
		<a href="logout.do">Log-out</a>
		<hr>
		<form action="updateProduct_inq.do" method="post">
		<input name="inq_image" type="hidden" value="${update_inq.inq_image}"/>
		<input name="inq_id" type="hidden" value="${update_inq.inq_id}">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">제목
					<td align="left"><input name="inq_title" type="text" value="${update_inq.inq_title}"/>
				<tr>
					<td bgcolor="orange">작성자
					<td align="left"><input name="inq_name" type="hidden" value="${update_inq.inq_name}"/>${update_inq.inq_name}
				<tr>
					<td bgcolor="orange">내용
					<td align="left"><textarea name="inq_content" rows="10" cols="40">${update_inq.inq_content}</textarea>
				<tr>
					<td bgcolor="orange">등록일
					<td align="left"><input name="inq_date" type="text" value="${update_inq.inq_date}"/>
				<tr>
					<td bgcolor="orange">공개여부
					<td align="left"><input name="inq_show" type="text" value="${update_inq.inq_show}"/>
				<tr>
					<td bgcolor="orange">제품번호
					<td align="left"><input name="product_id" type="text" value="${update_inq.product_id}" readOnly/>
				<tr>
					<td bgcolor="orange">회원아이디
					<td align="left"><input name="member_id" type="text" value="${update_inq.member_id}" readOnly/>				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정 완료"/>
			</table>
		</form>
		<a href = "deleteProduct_inq.do?inq_id=${update_inq.inq_id}">글삭제</a>&nbsp;&nbsp;&nbsp;
		<a href = "getProduct_inqList.do">글목록</a>
	</div>
</body>
   <%@ include file="../include/Footer.jsp" %>
</html>
