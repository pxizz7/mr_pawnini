<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>게시판</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$(".update_cancel_btn").on("click", function(){
			location.href = "getProduct_inq.do?inq_id=${inq_rep.inq_id}";
		})
	})		
</script>
  <%@ include file="../include/Header.jsp" %>
<body>
	<div id="root">
	<header>
		<h1> 댓글 수정 </h1>
	</header>
		<hr/>
	<section id="reply">
		<div class="product_inqList">
			<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
			<form name="updateInq_repForm" role="form" method="post" action="${contextPath}/updateInq_rep.do">
			<input type="hidden" name="inq_id" value="${inq_rep.inq_id}" readonly="readonly"/>
			<input type="hidden" id="inq_rep_id" name="inq_rep_id" value="${inq_rep.inq_rep_id}" />
			<input type="text" id="inq_rep_title" name="inq_rep_title" value="${inq_rep.inq_rep_title }"/>
			<table>
				<tbody>
					<tr>
						<td>
							<label for="inq_rep_content">댓글 내용</label>
							<textarea name="inq_rep_content" rows="5" cols="40" class="form-control">${inq_rep.inq_rep_content}</textarea>
						<tr>
						<td>
							<label for="inq_rep_name">작성자</label>
							<input type="text" id="inq_rep_name" name="inq_rep_name" value="${inq_rep.inq_rep_name}" readonly/>
						<tr>
						<td>
							<label for="inq_rep_show">공개</label>
							<select name="inq_rep_show">
				          		<option value="Y">Y</option>
				               	<option value="N">N</option>
           					</select>
				</tbody>			
			</table>
			<div>
				<button type="submit" class="update_submit_btn btn btn-success">저장</button>
				<button type="button" class="update_cancel_btn btn btn-danger">취소</button>
			</div>
			</form>
		</div>
	</section>
		<hr/>
	</div>
</body>
   <%@ include file="../include/Footer.jsp" %>

</html>