<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="../../style/getPaws.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../../include/Header.jsp"%>
<body>
	<div align="center">
		<h1>분양 정보</h1>

		<form class="table_form" action="updatePaws.do" method="post">
			<input name="paws_id" type="hidden" value="${paws.paws_id}" />
			<table class="table" border="1">
				<div class="table_in">
					<tr>
						<td class="">1차분류 <select name="paws_f_code">
								<option value="DOG">강아지</option>
								<option value="CAT">고양이</option>
						</select>
					<tr>
						<td>2차분류<input type="text" name="paws_s_code"
							value="${paws.paws_s_code}" />
					<tr>
						<td>이름<input type="text" name="paws_name"
							value="${paws.paws_name}" />
					<tr>
						<td>나이<input type="text" name="paws_age"
							value="${paws.paws_age}" />
					<tr>
						<td>설명<textarea class="textarea" rows="10" cols="40"
								name="paws_desc">
 						 ${paws.paws_desc}</textarea>
					<tr>
						<td>성별<input type="text" name="paws_sex"
							value="${paws.paws_sex}" />
					<tr>
						<td>중성화여부 <select name="paws_is_neutered">
								<option value="Y">Y</option>
								<option value="N">N</option>
						</select>
					<tr>
						<td>건강상태<input type="text" name="paws_health"
							value="${paws.paws_health}" />
					<tr>
						<td><input class="input_button" type="submit" value="수정" />
						</td>
				</div>
			</table>
		</form>
		<div class="button">
			<a href="deletePaws.do?paws_id=${paws.paws_id}">삭제</a> <a
				href="AdminGetPawsList.do">목록</a>
		</div>
	</div>

</body>
<%@ include file="../../include/Footer.jsp"%>
</html>