<%@ page import ="com.pawnini.model.product_inq.impl.Product_inqDAO" %>
<%@ page import ="com.pawnini.model.product_inq.Product_inqDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에 저장된 게시글 정보를 꺼낸다.
	Product_inqDTO product_inqDTO = (Product_inqDTO)session.getAttribute("product_inqDTO");
%>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../style/reviewDetail.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".inq_repUpdateBtn").on("click", function(){
			location.href = "go_updateInq_rep.do?inq_id=${product_inq.inq_id}&inq_rep_id="+$(this).attr("data-rno");
		});
		
		$(".inq_repDeleteBtn").on("click", function(){
			location.href = "deleteInq_rep.do?inq_id=${product_inq.inq_id}&inq_rep_id="+$(this).attr("data-rno");
		});
		
		$(".product_inqUpdateBtn").on("click", function(){
			location.href = "/go_updateProduct_inq.do?inq_id=${product_inq.inq_id}&page=${scri.page}&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		});
		
		$(".product_inqListBtn").on("click", function(){
			location.href = "getProduct_inqList.do";
		});
		
		$(".product_inqDeleteBtn").on("click", function(){
			var deleteChk = confirm("게시글을 삭제하시겠습니까?");
			if(deleteChk == true){
				location.href="deleteProduct_inq.do?inq_id=${product_inq.inq_id}&page=${scri.page}&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			}
			
		});
	});
</script>
</head>
  <%@ include file="../include/HeaderBoot.jsp" %>

<body>
	<div class="Guide">
      <span>상품문의</span>
    </div>
	<div class="container">
	<section id="container">
		<div>
		<input name="inq_id" type="hidden" id="inq_id" value="${product_inq.inq_id}">
			<div class="form-group">
				<label for="inq_name" class="col-sm-2 control-label">작성자</label>
				<input type="text" name="inq_name" class="form-control" value="${product_inq.inq_name}" readonly>
			</div>
			<div class="form-group">
				<label for="inq_title" class="col-sm-2 control-label">제목</label>
				<input type="text" name="inq_title" class="form-control" value="${product_inq.inq_title}" readonly>
			</div>
			<div class="form-group">
				<label for="inq_content" class="col-sm-2 control-label">내용</label>
				<textarea name="inq_content" rows="10" cols="40" class="form-control" readonly>${product_inq.inq_content}</textarea>
			</div>
			<div class="form-group">
				<label for="inq_show" class="col-sm-2 control-label"></label> 
				<div class="inputArea"></div>
			</div>
			<div class="form-group">
 				<label for="inq_image" class="col-sm-2 control-label">이미지</label>
 				<img src="${product_inq.inq_thumb}"/>
			</div>
			<div class="form-group">
				<label for="member_id" class="col-sm-2 control-label"></label>
				<input type="hidden" name="member_id" value="${product_inq.member_id}" >
			</div>
			<div class="form-group">
				<label for="product_id" class="col-sm-2 control-label"></label>
				<input type="hidden" name="product_id" value="${product_inq.product_id}" >
				<input type="hidden" id="inq_ans" value="${product_inq.inq_ans}"> 
			</div>
				<div>
					<c:if test="${product_inq.inq_name eq member.member_nickname}">
					<button type="button" class="product_inqUpdateBtn btn btn-success">수정</button>
					</c:if>
					<c:if test="${product_inq.inq_name eq member.member_nickname || member.member_grade eq '2'}">
					<button type="button" class="product_inqDeleteBtn btn btn-warning">삭제</button>
					</c:if>
					<button type="button" class="product_inqListBtn btn">목록</button>	
				</div>
			</div>
		<hr>
		

			
			
		<!-- 답글 -->
	<div id="inq_rep">
		<ol class="inq_repList">
			<c:forEach items="${inq_repList}" var="inq_repList">
				<li>
					<p>
						글쓴이: ${inq_repList.inq_rep_name} &nbsp;&nbsp;  작성일: <fmt:formatDate value="${inq_repList.inq_rep_date}" pattern="yyyy-MM-dd" /> </P><hr>
					<p>답변 제목: ${inq_repList.inq_rep_title}</p>
					<p>답변 내용: ${inq_repList.inq_rep_content}</p>
					<div>
						<c:if test="${member.member_grade eq '2' }">
						<button type="button" class="inq_repUpdateBtn btn btn-warning" data-rno="${inq_repList.inq_rep_id}">수정</button>
						<button type="button" class="inq_repDeleteBtn btn btn-danger" data-rno="${inq_repList.inq_rep_id}">삭제</button>
						</c:if>
					</div>
				</li>
			</c:forEach>
		</ol>
	</div>
	
	<!-- 답글 입력창 -->
<c:if test="${ member.member_grade eq '2'}">
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<form name="inq_repForm" class="form-horizontal" method="post" action="${contextPath}/insertInq_rep.do">
		<input type="hidden" id="inq_id" name="inq_id" value="${product_inq.inq_id}">
		<div class="form-group">
			<label for="inq_rep_title" class="col-sm-2 control-label">답글제목</label>
			<div class="col-sm-10">
				<input type="text" id="inq_rep_title" name="inq_rep_title" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="inq_rep_name" class="col-sm-2 control-label">답글작성자</label>
			<div class="col-sm-10">
				<input type="text" id="inq_rep_name" name="inq_rep_name" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="inq_rep_content" class="col-sm-2 control-label">답글 내용</label>
			<div class="col-sm-10">
				<textarea name="inq_rep_content" rows="3" cols="30" class="form-control"></textarea>
			</div>
		</div>


		<div class="form-group replydiv">
			<div class="col-sm-10">
				<input type="hidden" id="inq_ans" name="inq_ans" value="Y" />
				<button type="submit" class="insertInq_repBtn btn btn-success" id="updateInq_ans" >작성</button>
				
			</div>
		</div>
	</form>	
</c:if>
	</section>
	<hr>
</div>
</body>
   <%@ include file="../include/Footer.jsp" %>

</html>
