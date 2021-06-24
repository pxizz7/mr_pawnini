<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../style/getCartList.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<script>
$(document).ready(function(){
	$("#allCheck").click(function(){
		var chk = $("#allCheck").prop("checked");
		if(chk){
			$(".chBox").prop("checked", true);
		} else {
			$(".chBox").prop("checked", false);
		}
	});
	
	$(".chBox").click(function(){
		$("#allCheck").prop("checked", false);
	});
	
	$(".selectDeleteBtn").click(function(){
		var confirmVal = confirm("정말 삭제하시겠습니까?");
		
		if(confirmVal) {
			var checkArr = new Array();
			
			$("input[class='chBox']:checked").each(function(){
				checkArr.push($(this).attr("data-cart_id"));
			});
			
			$.ajax({
				url : "deleteCart.do",
				type : "post",
				data : {chbox : checkArr},
				success : function(result){
					if(result == 1){
						location.href = "getCartList.do";
					} else {
						("삭제 실패");
					}
				}
			});
		};
	});
	
	$(".orderInfoBtn").click(function(){
		location.href = "getOrderForm.do"
	})
	
	
	})
</script>

<body>

<a href="main.do">메인으로 가기</a>

<section id="content">
  
<ul>
 <li>
   <div class="allCheck">
   <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
  </div>
  
  <div class="delBtn">
   <button type="button" class="selectDeleteBtn">선택 삭제</button> 
  </div>
  
 </li>
 <c:set var="sum" value="0" />
 <c:forEach items="${cartList}" var="cartList">
 <li>
  <div class="checkBox">
   <input type="checkbox" name="chBox" class="chBox" data-cart_id="${cartList.cart_id}" />
  </div>
 
  <div class="thumb">
   <img src="${cartList.product_thumb_img}" />
  </div>
  <div class="cartInfo">
   <p>
    <span>제품명</span>&nbsp;${cartList.product_name}<br />
    <span>판매가</span>&nbsp;<fmt:formatNumber pattern="###,###,###" value="${cartList.product_price}" />&nbsp;원<br />
    <span>수량</span>&nbsp;${cartList.cart_amount} 개<br />
    <span>합계</span>&nbsp;<fmt:formatNumber pattern="###,###,###" value="${cartList.product_price * cartList.cart_amount}" />&nbsp;원
   </p>
   
     <div class="delete">
    <button type="button" class="delete_${cartList.cart_id}_btn" data-cart_id="${cartList.cart_id}">삭제</button>
    <script>
    $(".delete_${cartList.cart_id}_btn").click(function(){
		var confirmVal = confirm("정말 삭제하시겠습니까?");
		
		if(confirmVal) {
			var checkArr = new Array();
			
			checkArr.push($(this).attr("data-cart_id"));
			
			$.ajax({
				url : "deleteCart.do",
				type : "post",
				data : {chbox : checkArr},
				success : function(result){
					if(result == 1){
						location.href = "getCartList.do";
					} else {
						("삭제 실패");
					}
				}
			});
		}
    });
    </script>
   </div>
  </div>   
 </li>
 <c:set var="sum" value="${sum + (cartList.product_price * cartList.cart_amount)}" />
 </c:forEach>
</ul>
<hr>
	<div class="listResult">
		<div class="sum">
			총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />&nbsp;원
 		</div>
 		<div class="orderInfo">
 			<button type="button" class="orderInfoBtn">주문하러 가기</button>
 		</div>
	</div>

</section>
</body>
</html>