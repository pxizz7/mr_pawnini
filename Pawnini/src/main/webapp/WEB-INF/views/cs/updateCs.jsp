<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Date" %>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정 [ ${csList.cs_title } ]</title>

	<style type="text/css">
	   a, a:hover, a:focus, a:active {
	      color: black;
	      text-decoration: none;
	   }
	</style>
	<link type="text/css" rel="stylesheet" href="../style/cs.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<%@ include file="../include/HeaderBoot.jsp"%>
<body> 

<!-- my bit -->


<section class="container">
	<h1>CS 수정</h1>
	<form name="updateForm" action="updateCs.do" method="post" enctype="multipart/form-data">
 <!--  앞에 csList는 controller에서 sessionAttributes and model.addAttribute() -->
		<table class="table table-hover">
			<tr>
				<td><label for="cs_id">글번호</label><input type="text" name="cs_id" style="outline:none" value="${csList.cs_id }" readonly></td>
				<td><label for="member_id">멤버아이디</label><input type="text" name="member_id" value="${member.member_id }" readonly></td>
			</tr>
			<tr>
				<td><label for="cs_title">제목</label><input type="text" name="cs_title" value="${csList.cs_title }"  autofocus  required></td>
			</tr>
			<tr>
				<td><label for="cs_writer">작성자</label><input type="text" name="cs_writer" value="${csList.cs_writer }"></td>
			</tr>
			<tr>
				<td><label for="cs_regdate">최초 작성일</label><fmt:formatDate value="${csList.cs_regdate}" pattern="yyyy년 MM월 dd일 HH시mm분"/></td>
			</tr>
			<tr>
			<!-- DB에 저장안하고 띄우기만하기 -->
				<td><label for="cs_moddate">수정일</label><fmt:formatDate value="<%= new java.util.Date(System.currentTimeMillis()) %>" pattern="yyyy년 MM월 dd일 HH시mm분"/></td>
			</tr>			
			<tr>
				<td><label for="cs_show">공개 여부</label>
						<input type="text" name="cs_show" value="${csList.cs_show }" readonly/>
				</td>
			</tr>
			<tr>
				<td><label for="cs_content">내용</label><br>
					<textarea name="cs_content" cols="50" rows="10" required>${csList.cs_content }</textarea>
				</td>
			</tr>
			<tr>
				<td><button class="btn update_btn" type="button">수정하기</button>
			</tr>
		</table>
	</form>
	<hr>
	<a href="getCsList.do">게시글 목록</a>
</section>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	//수정하기
	$(".update_btn").on("click", function(){
		var updateYN = confirm("수정하시겠습니까?");
		if (updateYN) {
			formObj.attr("action", "updateCs.do");
			formObj.attr("method", "post");
			formObj.submit();			
		}
		alert("수정되었습니다!");
	})
	
})
</script>
</body>
<%@ include file="../include/Footer.jsp"%>
</html>