<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>InsertReviewView</title>
<style type="text/css">
	li {
		list-style: none;
		float: left;
		padding: 6px;
	}
	.main_title {
		text-align: center;
		padding: 20px auto;
		color: rosyBrown;
	}
	a, a:hover, a:focus, a:active {
		color: black;
		text-decoration: none;
	}
	.select_img img { margin: 20px 0;}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$("#rev_f_img").change(function(){
 if(this.files && this.files[0]) {
  var reader = new FileReader;
  reader.onload = function(data) {
   $(".select_img img").attr("src", data.target.result).width(100);        
  }
  reader.readAsDataURL(this.files[0]);
 }
});
</script>

</head>
  <%@ include file="../include/HeaderBoot.jsp" %>
<body>
	<div class="Guide">
      <span>리뷰 등록</span>
    </div>
	<div>

		<form action="/insertReview.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_id" value="${member.member_id}"/>
			<table border="1">
				<tr>
					<td>글쓴이
					<input type="text" name="rev_writer" value="${member.member_nickname}" readonly>
				<tr>
					<td>제목
					<input type="text" name="rev_title">
				<tr>
					<td>애완동물 크기
					<select name="rev_f_category">
						<option value="XS">XS</option>
						<option value="S">S</option>
						<option value="M">M</option>
						<option value="L">L</option>
						<option value="XL">XL</option>
					</select>
				<tr>
					<td>내용
					<textarea name="rev_content" rows="10" cols="40"></textarea>
				<tr>
					<td>평점<input type="number" name="rev_stars" placeholder="1~5 사이의 평점 입력">
				<tr>
					<td><div class="inputArea">
 						<label for="rev_f_img">이미지</label>
 						<input type="file" id="rev_f_img" name="file" />
 				<tr>
 					<td>미리보기
 					<div class="select_img"><img src="" /></div>
 					<%=request.getRealPath("/") %>
					</div>
				<tr>
					<td>공개 여부
					<select name="rev_show">
                  		<option value="Y">공개</option>
                    	<option value="N">비공개</option>
                    </select>
			
				<tr>
					<td>상품코드<input type="text" name="product_id">
				<tr>
					<td><input type="submit" value="등록">
			</table>
		</form>
		<a href="/review/getReviewList.do">목록</a>
	</div>
</body>
	<%@ include file="../include/Footer.jsp" %>
</html>