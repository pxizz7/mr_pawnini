<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../style/getList.css" />
<style type="text/css">
.pagination{
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	text-decoration: none;
    	list-style: none;
}

.pagination li {
	padding: 10px;
	font-size: 28px;
}

</style>
</head>
   <%@ include file="../../include/Header.jsp" %> 
<body>
	<div class="Guide">
      <span>ADMIN</span>
    </div>
    <div align="center">
       
       <h1> 상품 관리 리스트 </h1>
       <span>등록된 상품 수 : ${pageMaker.totalCount} 개</span>
       <table border="1">
          <tr class="head">
             <td>등록번호
             <td>사진
             <td>1차분류
             <td>2차분류
             <td>3-1차분류
             <td>3-2차분류
             <td>브랜드
             <td>상품명
             <td>상품옵션
             <td>재고
             <td>가격
             <td>조회수
             <td>등록일시
             <td colspan="2">
          <c:forEach items="${productList}" var="product">
          <tr>
             <td>${product.product_id}
             <td><img src="${product.product_thumb_img}" class="thu_img">   
             <td>${product.product_f_code}   
             <td>${product.product_s_code}
             <td>${product.product_t_code}
             <td>${product.product_t_code2}
             <td>${product.product_brand}
             <td>${product.product_name}
             <td>${product.product_option}
             <td>${product.product_stock}
             <td>${product.product_price}
             <td>${product.product_hits}
             <td>${product.product_date}
             <td><a href="getProduct.do?product_id=${product.product_id}">수정</a>
             <td><a href="deleteProduct.do?product_id=${product.product_id}">삭제</a>
          </c:forEach>
       </table>
       <div class="button">
       <a href="goInsertProduct.do">신규 등록</a><br>
       <a href="goProductList.do">상품페이지</a>
      </div>
    </div>
      <div>
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href="getProductList${pageMaker.makeSearch(pageMaker.startPage -1)}">이전</a></li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li <c:out value="${pageMaker.cri.page == idx ? 'class=info ' : '' }"/>>
					<a href="getProductList.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="getProductList${pageMaker.makeSearch(pageMaker.endPage +1)}">다음</a></li>
				</c:if>
			</ul>
		</div>
 </body>

    <%@ include file="../../include/Footer.jsp" %>
</html>