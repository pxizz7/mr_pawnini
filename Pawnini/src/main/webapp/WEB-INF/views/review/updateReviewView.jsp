<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>getReview</title>
<style>
.select_img img { width: 200px; margin: 20px 0;}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='updateReviewForm']");
		
		$(".updateCancelBtn").on("click", function(){
			event.preventDefault();
			location.href = "/getReview.do?rev_id=${update.rev_id}&page=${scri.page}&"
							+"perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}";
			});
		
		$(".updateReviewBtn").on("click", function(){
			formObj.attr("action", "/updateReview.do");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		$("#rev_f_img").change(function(){
		 if(this.files && this.files[0]) {
		  var reader = new FileReader;
		  reader.onload = function(data) {
		   $(".select_img img").attr("src", data.target.result).width(100);        
		  }
		  reader.readAsDataURL(this.files[0]);
		 }
		});
		
	});
	

</script>
</head>
<body>
	<div>
	
	<section id="container">
		<form name="updateReviewForm" enctype="multipart/form-data">
		<input name="rev_id" type="hidden" value="${update.rev_id}">
			<div class="form-group">
				<label for="rev_writer" class="col-sm-2 control-label">글쓴이</label>
				<input type="text" name="rev_writer" class="form-control" value="${update.rev_writer}" readonly>
			</div>
			<div class="form-group">
				<label for="rev_title" class="col-sm-2 control-label">제목</label>
				<input type="text" name="rev_title" class="form-control" value="${update.rev_title}">
			</div>
			<div class="form-group">
				<label for="rev_f_category" class="col-sm-2 control-label">애완동물 크기</label>
				<select name="rev_f_category">
						<option value="XS">XS</option>
						<option value="S">S</option>
						<option value="M">M</option>
						<option value="L">L</option>
						<option value="XL">XL</option>
				</select>
			</div>
			<div class="form-group">
				<label for="rev_content" class="col-sm-2 control-label">내용</label>
				<textarea name="rev_content" rows="10" cols="40" class="form-control">${update.rev_content}</textarea>
			</div>
			<div class="form-group">
				<label for="rev_thumb_img" class="col-sm-2 control-label">내용</label>
				<textarea name="rev_content" rows="10" cols="40" class="form-control">${update.rev_content}</textarea>
			</div>
			<div class="form-group">
				<div class="inputArea">
 					<label for="rev_f_img">이미지</label>
 					<input type="file" id="rev_f_img" name="file" />
 					미리보기
 					<div class="select_img">
 						<img src="${update.rev_thumb_img}" />
 						<input type="hidden" name="rev_f_img" value="${update.rev_f_img}" />	
 						<input type="hidden" name="rev_thumb_img" value="${update.rev_thumb_img}" />	
 					</div>
 					<%=request.getRealPath("/") %>
				</div>
			</div>
			<div class="form-group">
				<label for="rev_stars" class="col-sm-2 control-label">평점</label>
				<input type="number" name="rev_stars" placeholder="1~5 사이의 평점 입력" value="${update.rev_stars}">
			</div>
			<div class="form-group">
				<label for="rev_show" class="col-sm-2 control-label">공개</label>
				<select name="rev_show">
                  		<option value="Y">Y</option>
                    	<option value="N">N</option>
                </select>
			</div>
			<div class="form-group">
				<label for="product_id" class="col-sm-2 control-label">상품코드</label>
				<input type="text" name="product_id" value="${update.product_id}" readonly>
			</div>
					
			<div>
				<button type="button" class="updateReviewBtn btn btn-success">수정</button>
				<button type="button" class="updateCancelBtn btn btn-warning">취소</button>
			</div>
			</form>	
	
	</section>
	<hr>
</div>
</body>
</html>