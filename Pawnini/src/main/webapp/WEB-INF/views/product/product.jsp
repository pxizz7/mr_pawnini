<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../style/main.css" />
    <link rel="stylesheet" href="../style/product.css" />
    <title>meal</title>
  </head>
  <%@ include file="../include/Header.jsp" %>
  <body>
	<div class="Guide">
      <span>상품 목록</span>
    </div>
    <!-- 강아지 -->
    <c:if test="${param.searchOption == 'dog' }">
		<c:if test="${param.searchKeyword == 'meal'}">
  	  		<div class="Kategorie">
          		<h4>분류 ></h4>
          		<ul class="Kategorie_ul">
	            	<a href="goProductList.do?searchOption=dog&searchKeyword=meal&searchKeyword3=건식"><li>건식</li></a>
            		<a href="goProductList.do?searchOption=dog&searchKeyword=meal&searchKeyword3=습식"><li>습식</li></a>
          		</ul>
    		</div>
		</c:if>
		<c:if test="${param.searchKeyword == 'snack'}">
    		<div class="Kategorie">
	          	<h4>분류 ></h4>
          		<ul class="Kategorie_ul">
	            	<a href="goProductList.do?searchOption=dog&searchKeyword=snack&searchKeyword3=껌"><li>껌</li></a>
            		<a href="goProductList.do?searchOption=dog&searchKeyword=snack&searchKeyword3=사사미"><li>사사미</li></a>
            		<a href="goProductList.do?searchOption=dog&searchKeyword=snack&searchKeyword3=저키/트릿"><li>저키/트릿</li></a>
            		<a href="goProductList.do?searchOption=dog&searchKeyword=snack&searchKeyword3=비스켓"><li>비스켓</li></a>
            		<a href="goProductList.do?searchOption=dog&searchKeyword=snack&searchKeyword3=소시지"><li>소시지</li></a>
            		<a href="goProductList.do?searchOption=dog&searchKeyword=snack&searchKeyword3=캔/파우치"><li>캔/파우치</li></a>
          		</ul>
    		</div>
		</c:if>
		<c:if test="${param.searchKeyword == 'supplies'}">
    		<div class="Kategorie">
	          	<h4>분류 ></h4>
          		<ul class="Kategorie_ul">
	            	<a href="goProductList.do?searchOption=dog&searchKeyword=supplies&searchKeyword3=의류/악세사리"><li>의류/악세사리</li></a>
        	    	<a href="goProductList.do?searchOption=dog&searchKeyword=supplies&searchKeyword3=식기/이동장"><li>식기/이동장</li></a>
    	        	<a href="goProductList.do?searchOption=dog&searchKeyword=supplies&searchKeyword3=집/방석"><li>집/방석</li></a>
    	        	<a href="goProductList.do?searchOption=dog&searchKeyword=supplies&searchKeyword3=배변/위생"><li>배변/위생</li></a>
    	        	<a href="goProductList.do?searchOption=dog&searchKeyword=supplies&searchKeyword3=장난감"><li>장난감</li></a>
    	        	<a href="goProductList.do?searchOption=dog&searchKeyword=supplies&searchKeyword3=미용/목욕"><li>미용/목욕</li></a>
   	     	  	</ul>
	    	</div>
		</c:if>
    </c:if>
    
    <!-- 고양이 -->
    <c:if test="${param.searchOption == 'cat' }">
		<c:if test="${param.searchKeyword == 'meal'}">
  	  		<div class="Kategorie">
          		<h4>분류 ></h4>
          		<ul class="Kategorie_ul">
	            	<a href="goProductList.do?searchOption=cat&searchKeyword=meal&searchKeyword3=건식"><li>건식</li></a>
	            	<a href="goProductList.do?searchOption=cat&searchKeyword=meal&searchKeyword3=습식"><li>습식</li></a>
          		</ul>
    		</div>
		</c:if>
		<c:if test="${param.searchKeyword == 'snack'}">
    		<div class="Kategorie">
	          	<h4>분류 ></h4>
          		<ul class="Kategorie_ul">
	            	<a href="goProductList.do?searchOption=cat&searchKeyword=snack&searchKeyword3=수제"><li>수제간식</li></a>
	            	<a href="goProductList.do?searchOption=cat&searchKeyword=snack&searchKeyword3=츄르"><li>츄르</li></a>
	            	<a href="goProductList.do?searchOption=cat&searchKeyword=snack&searchKeyword3=육포/사사미"><li>육포/사사미</li></a>
	            	<a href="goProductList.do?searchOption=cat&searchKeyword=snack&searchKeyword3=껌/뼈"><li>껌/뼈</li></a>
	            	<a href="goProductList.do?searchOption=cat&searchKeyword=snack&searchKeyword3=빵/비스켓"><li>빵/비스켓</li></a>
	            	<a href="goProductList.do?searchOption=cat&searchKeyword=snack&searchKeyword3=캔디"><li>캔디</li></a>
          		</ul>
    		</div>
		</c:if>
		<c:if test="${param.searchKeyword == 'supplies'}">
    		<div class="Kategorie">
	          	<h4>분류 ></h4>
          		<ul class="Kategorie_ul">
	          		<a href="goProductList.do?searchOption=cat&searchKeyword=supplies&searchKeyword3=장난감"><li>장난감</li></a>
	          		<a href="goProductList.do?searchOption=cat&searchKeyword=supplies&searchKeyword3=배변/위생"><li>배변/위생</li></a>
	          		<a href="goProductList.do?searchOption=cat&searchKeyword=supplies&searchKeyword3=미용/목욕"><li>미용/목욕</li></a>
	          		<a href="goProductList.do?searchOption=cat&searchKeyword=supplies&searchKeyword3=캣타워/집"><li>캣타워/집</li></a>
   	     	  	</ul>
	    	</div>
		</c:if>
    </c:if>
    
    
    <div class="grid">
      <ul class="product">
    <c:forEach items="${productList}" var="product">
        <li class="product_li">
          <a href="detailProduct.do?product_id=${product.product_id}">
            <img class="product_img" src="${product.product_thumb_img}" />
             <ul class="product_list">
              <li class="product_title">${product.product_name}</li>
              <li class="product_cash">가격 <fmt:formatNumber pattern="###,###,###" value="${product.product_price}" /> 원</li>
              <li class="product_rank">재고 : ${product.product_stock }</li>
            </ul>
          </a>
        </li>
    </c:forEach>
      </ul>
    </div>
    
     <div>
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href="goProductList${pageMaker.makeSearch(pageMaker.startPage -1)}">이전</a></li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li <c:out value="${pageMaker.cri.page == idx ? 'class=info ' : '' }"/>>
					<a href="goProductList.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="goProductList${pageMaker.makeSearch(pageMaker.endPage +1)}">다음</a></li>
				</c:if>
			</ul>
		</div>

	<div class="Bouns">
      <ul class="Bouns_ul">
        <li>
          <h3> <i class="fas fa-drumstick-bite lg"></i>신선한 사료</h3>
        </li>
        <li>
          <h3><i class="far fa-clock"></i>유통기한 100% 책임제</h3>
       
        </li>
        <li>
          <h3><i class="fas fa-shipping-fast"></i>신속! 정확! 배송!</h3>
        </li>
        <li>
          <h3><i class="fas fa-rss"></i>만원 이상 구매시 무료배송</h3>
        </li>
     </ul>
    </div>


   <%@ include file="../include/Footer.jsp" %>

  </body>
</html>
