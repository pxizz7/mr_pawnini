<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="../../style/productRegistration.css" />
<title>Insert title here</title>

</head>
	<%@ include file="../../include/Header.jsp" %>
<body>
	<div class="Guide">
      <span>상품 정보 수정</span>
    </div>
	<div class="update_product" align="center">
		<form action="updateProduct.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="product_id" value="${product.product_id}">
		<table class="table">
			<tr>
				<td>1차 분류 : 
					<select name="product_f_code" id="categori1"  class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="DOG">강아지</option>
						<option value="CAT">고양이</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>2차 분류 :
				<div class="dog" > 
					<select name="product_s_code" id="product_s_code_dog" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="MEAL">사료</option> 
						<option value="SNACK">간식</option> 
						<option value="SUPPLIES">강아지용품</option> 
					</select>
				</div>
				<div class="cat" hidden="hide">
					<select name="product_s_code" id="product_s_code_cat" disabled="disabled" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="MEAL">사료</option> 
						<option value="SNACK">간식</option> 
						<option value="SUPPLIES">고양이용품</option> 
					</select>
				</div>
				</td>
			</tr>
			<tr>
				<td>3-1차분류 : 
				<div class="dog_meal" >
					<select name="product_t_code" id="product_t_code_dog_meal" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="건식">건식</option>
						<option value="습식">습식</option>
					</select>
				</div>
				<div class="dog_snack" hidden="hide">
					<select name="product_t_code" id="product_t_code_dog_snack" disabled="disabled" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="껌">껌</option>
						<option value="사사미">사사미</option>
						<option value="저키/트릿">저키/트릿</option>
						<option value="비스켓">비스켓</option>
						<option value="소시지">소시지</option>
						<option value="캔/파우치">캔/파우치</option>
					</select>
				</div>
				<div class="dog_supplies" hidden="hide">
					<select name="product_t_code" id="product_t_code_dog_supplies" disabled="disabled" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="의류/악세사리">의류/악세사리</option>
						<option value="식기/이동장">식기/이동장</option>
						<option value="집/방석">집/방석</option>
						<option value="배변/위생">배변/위생</option>
						<option value="장난감">장난감</option>
						<option value="미용/목욕">미용/목욕</option>
					</select>
				</div>
				<div class="cat_meal" hidden="hide">
					<select name="product_t_code" id="product_t_code_cat_meal" disabled="disabled" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="건식">건식</option>
						<option value="습식">습식</option>
					</select>
				</div>
				<div class="cat_snack" hidden="hide">
					<select name="product_t_code" id="product_t_code_cat_snack" disabled="disabled" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="수제">수제간식</option>
						<option value="츄르">츄르</option>
						<option value="육포/사사미">육포/사사미</option>
						<option value="껌/뼈">껌/뼈</option>
						<option value="빵/비스켓">빵/비스켓</option>
						<option value="캔디">캔디</option>
					</select>
				</div>
				<div class="cat_supplies" hidden="hide">
					<select name="product_t_code" id="product_t_code_cat_supplies" disabled="disabled" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="장난감">장난감</option>
						<option value="배변/위생">배변/위생</option>
						<option value="미용/목욕">미용/목욕</option>
						<option value="캣타워/집">캣타워/집</option>
					</select>
				</div>
				</td>
			</tr>
			<tr>
				<td>3-2차분류 : 
					<input type="text" name="product_t_code2" value="${product.product_t_code2}">
				</td>
			</tr>
			<tr>
				<td>브랜드 :
					<input type="text" name="product_brand" value="${product.product_brand}">
				</td>
			</tr>
			<tr>
				<td>상품명 :
					<input type="text" name="product_name" value="${product.product_name}">
				</td>
			</tr>
			<tr>
				<td>상품 옵션 :
					<input type="text" name="product_option" value="${product.product_option }">
				</td>
			</tr>
			<tr>
				<td>
					<label for="product_img">상품 이미지: </label>
					<input type="file" name="file" id="product_img">
				</td>
			</tr>
			<tr>
				<td>미리보기
				<div class="select_img"><img src="" /></div>
				<input type="hidden" name="product_img" value="${product.product_img}">
				<input type="hidden" name="product_thumb_img" value="${product.product_thumb_img}">
				</td>
			</tr>
			<tr>
				<td>상품 설명 :
					<textarea rows="10" cols="40" name="product_desc">${product.product_desc}</textarea>
				</td>
			</tr>
			<tr>
				<td>상품 재고 :
					<input type="text" name="product_stock" value="${product.product_stock}">
				</td>
			</tr>
			<tr>
				<td>상품 가격 :
					<input type="text" name="product_price" value="${product.product_price}">
				</td>
			</tr>
			<tr>
				<td>상품 원가 :
					<input type="text" name="product_c_price" value="${product.product_c_price}">
				</td>
			</tr>
			<tr>
				<td>
					<input class="button" type="submit" value="수정하기">
				</td>
			</tr>	
		</table>
		</form>

		
		

	</div>
</body>
	<%@ include file="../../include/Footer.jsp" %>

 <script>
  $("#product_img").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(300);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>

<!-- 1차, 2차, 3차 카테고리 변경 -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#categori1').change(function() {
			var result=$('#categori1 option:selected').val();
			if(result=='DOG'){
				$('.dog').show();
				$('.cat').hide();
				$('#product_s_code_dog').prop("disabled", false);
				$('#product_s_code_cat').prop("disabled", true);
				
				$('#product_s_code_dog').change(function() {
					var categori2_dog=$('#product_s_code_dog option:selected').val();
					if(categori2_dog=='MEAL'){
						$('.dog_meal').show();
						$('.dog_snack').hide();
						$('.dog_supplies').hide();
						$('.cat_meal').hide();
						$('.cat_snack').hide();
						$('.cat_supplies').hide();
						$('#product_t_code_dog_meal').prop("disabled", false);
						$('#product_t_code_dog_snack').prop("disabled", true);
						$('#product_t_code_dog_supplies').prop("disabled", true);
						$('#product_t_code_cat_meal').prop("disabled", true);
						$('#product_t_code_cat_snack').prop("disabled", true);
						$('#product_t_code_cat_supplies').prop("disabled", true);
					
					}
					else if (categori2_dog=='SNACK'){
						$('.dog_meal').hide();
						$('.dog_snack').show();
						$('.dog_supplies').hide();
						$('.cat_meal').hide();
						$('.cat_snack').hide();
						$('.cat_supplies').hide();
						$('#product_t_code_dog_meal').prop("disabled", true);
						$('#product_t_code_dog_snack').prop("disabled", false);
						$('#product_t_code_dog_supplies').prop("disabled", true);
						$('#product_t_code_cat_meal').prop("disabled", true);
						$('#product_t_code_cat_snack').prop("disabled", true);
						$('#product_t_code_cat_supplies').prop("disabled", true);
					}
					else if (categori2_dog=='SUPPLIES'){
						$('.dog_meal').hide();
						$('.dog_snack').hide();
						$('.dog_supplies').show();
						$('.cat_meal').hide();
						$('.cat_snack').hide();
						$('.cat_supplies').hide();
						$('#product_t_code_dog_meal').prop("disabled", true);
						$('#product_t_code_dog_snack').prop("disabled", true);
						$('#product_t_code_dog_supplies').prop("disabled", false);
						$('#product_t_code_cat_meal').prop("disabled", true);
						$('#product_t_code_cat_snack').prop("disabled", true);
						$('#product_t_code_cat_supplies').prop("disabled", true);
					}
				});
				
				
			}
			else if (result=='CAT'){
				$('.cat').show();
				$('.dog').hide();
				$('#product_s_code_cat').prop("disabled", false);
				$('#product_s_code_dog').prop("disabled", true);
				

				$('#product_s_code_cat').change(function() {
					var categori2_cat=$('#product_s_code_cat option:selected').val();
					if(categori2_cat=='MEAL'){
						$('.dog_meal').hide();
						$('.dog_snack').hide();
						$('.dog_supplies').hide();
						$('.cat_meal').show();
						$('.cat_snack').hide();
						$('.cat_supplies').hide();
						$('#product_t_code_dog_meal').prop("disabled", true);
						$('#product_t_code_dog_snack').prop("disabled", true);
						$('#product_t_code_dog_supplies').prop("disabled", true);
						$('#product_t_code_cat_meal').prop("disabled", false);
						$('#product_t_code_cat_snack').prop("disabled", true);
						$('#product_t_code_cat_supplies').prop("disabled", true);	
					}
					else if (categori2_cat=='SNACK'){
						$('.dog_meal').hide();
						$('.dog_snack').hide();
						$('.dog_supplies').hide();
						$('.cat_meal').hide();
						$('.cat_snack').show();
						$('.cat_supplies').hide();
						$('#product_t_code_dog_meal').prop("disabled", true);
						$('#product_t_code_dog_snack').prop("disabled", true);
						$('#product_t_code_dog_supplies').prop("disabled", true);
						$('#product_t_code_cat_meal').prop("disabled", true);
						$('#product_t_code_cat_snack').prop("disabled", false);
						$('#product_t_code_cat_supplies').prop("disabled", true);	
					}
					else if (categori2_cat=='SUPPLIES'){
						$('.dog_meal').hide();
						$('.dog_snack').hide();
						$('.dog_supplies').hide();
						$('.cat_meal').hide();
						$('.cat_snack').hide();
						$('.cat_supplies').show();
						$('#product_t_code_dog_meal').prop("disabled", true);
						$('#product_t_code_dog_snack').prop("disabled", true);
						$('#product_t_code_dog_supplies').prop("disabled", true);
						$('#product_t_code_cat_meal').prop("disabled", true);
						$('#product_t_code_cat_snack').prop("disabled", true);
						$('#product_t_code_cat_supplies').prop("disabled", false);	
					}
				});
				
				
			}
		});		
		
		
		
	
	
		
	});
</script>

</html>
















