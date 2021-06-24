<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 문의 게시판</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
  <%@ include file="../include/Header.jsp" %>
<body>
	
	<div>
	<h1>상품 문의 게시판</h1>
		<form action="insertProduct_inq.do" method="post" enctype="multipart/form-data">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="100">제목
					<td align="left"><input type="text" name="inq_title">
				<tr>
					<td bgcolor="orange">작성자
					<td align="left"><input type="text" name="inq_name" value="${member.member_nickname }" readonly="readonly">
				<tr>
					<td bgcolor="orange">내용
					<td align="left"><textarea name="inq_content" rows="10" cols="40"></textarea>
		
				<tr>
					<td bgcolor="orange">노출 여부
					<td align="left"><select name="inq_show">
                  		<option value="Y">공개</option>
                    	<option value="N">비공개</option>
                    </select>
				<tr>
					<td bgcolor="orange">이미지
					<td align="left"><div class="inputArea">
				<!-- 이미지 등록 -->
				<label for="inq_image">이미지</label>
				<input type="file" id="inq_image" name="file"/>
				<div class="selecet_Image"><img src=""></img></div>
				<!-- 이미지 파일을 현재 페이지에서 확인 -->	
					<script>
							$(inq_image).change(function(){
								if(this.files &&this.files[0]){
									var reader = new FileReader;
									reader.onload = function(data){
										$(".select_image img").attr("src", data.target.result).width(500);
									}
								reader.readAsDataURL(this.files[0]);
								}
							});
					</script>
				<!--  현재 프로젝트의 실제 경로 -->	
				</div>
				<tr>
					<td bgcolor="orange">회원 아이디
					<td align="left"><input type="text" name="member_id" value="${member.member_id}" readonly="readonly">
				<tr>
					<td bgcolor="orange">제품번호
					<td align="left"><input type="text" name="product_id" value="${product.product_id}" readonly="readonly">				
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="새글 등록"/>
			</table>
		</form>
		<a href="getProduct_inqList.do">목록</a>
	</div>
</body>
   <%@ include file="../include/Footer.jsp" %>

</html>