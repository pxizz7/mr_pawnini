<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				$(".updateCancelReplyBtn").on("click", function(){
					location.href = "/getReview.do?rev_id=${replyUpdate.rev_id}";
				})
			
		});
		
	</script>
	<body>
	
	
			
			<section id="reply">

			<div class="replyList">
			<%-- 	<c:set var="contextPath" value="${pageContext.request.contextPath}"/> --%>
				<form name="updateReviewReplyForm" role="form" method="post" action="/review/updateReviewReply.do">
					<input type="hidden" name="rev_id" value="${replyUpdate.rev_id}" readonly="readonly"/>
					<input type="hidden" id="rev_com_id" name="rev_com_id" value="${replyUpdate.rev_com_id}" />
					<table>
						<tbody>
							<tr>
								<td>
									<label for="rev_com_content">댓글 내용</label>
									<textarea name="rev_com_content" rows="5" cols="40" class="form-control">${replyUpdate.rev_com_content}</textarea>
							<tr>
								<td>
									<label for="rev_com_writer">댓글 글쓴이</label>
									<input type="text" id="rev_com_writer" name="rev_com_writer" value="${replyUpdate.rev_com_writer}" readonly/>
							<tr>
								<td>
									<label for="rev_com_show">공개</label>
									<select name="rev_com_show">
				                  		<option value="Y">Y</option>
				                    	<option value="N">N</option>
           							</select>
						</tbody>			
					</table>
					<div>
						<button type="submit" class="updateReviewReplyBtn btn btn-success">저장</button>
						<button type="button" class="updateCancelReplyBtn btn btn-danger">취소</button>
					</div>
				</form>
			</div>
			</section>
			<hr />
	</body>
</html>