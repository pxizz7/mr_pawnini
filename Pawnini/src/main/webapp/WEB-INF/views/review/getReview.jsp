<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>getReview</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../style/reviewDetail.css"/>

<style type="text/css">
	li {
		padding: 12px;viols
	}
	section {
		margin-top: 20px;
	}
	.thu_img {
		width: 150px;
		height: 100px;
	}
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='reviewForm']");
		
		$(".reviewReplyUpdateBtn").on("click", function(){
			location.href = "/updateReviewReplyView.do?rev_id=${review.rev_id}&rev_com_id="+$(this).attr("data-rno");
		});
		
		$(".reviewReplyDeleteBtn").on("click", function(){
			location.href = "/deleteReviewReply.do?rev_id=${review.rev_id}&rev_com_id="+$(this).attr("data-rno");
		});
		
		$(".reviewListBtn").on("click", function(){
			location.href = "/getReviewList.do?page=${scri.page}&perPageNum=${scri.perPageNum}"
							+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		});
		
		$(".updateBtn").on("click", function(){
			location.href = "/updateReviewView.do?rev_id=${review.rev_id}&page=${scri.page}&perPageNum=${scri.perPageNum}"
							+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		});
		
		$(".reviewDeleteBtn").on("click", function(){
			var deleteChk = confirm("게시글을 삭제하시겠습니까?");
			if(deleteChk == true){
				formObj.attr("action", "/deleteReview.do");
				formObj.attr("method", "post");
				formObj.submit();
			}
			
		});
		
		
		
		var likeval = ${like};
		
		if(likeval>0){
			console.log(likeval);
			$("#like").attr("class", "glyphicon glyphicon-heart");
			$(".like").prop('name', likeval)
		}else {
			console.log(likeval);
			$("#like").attr("class", "glyphicon glyphicon-heart-empty");
			$(".like").prop('name', likeval)
		}
		
		$(".like").on("click", function() {
			var that = $(".like");
			var sendData = {'rev_id' : '${review.rev_id}', 'like' : that.prop('name')};
			$.ajax({
				url: '/reviewLike.do',
				type: 'post',
				data: sendData,
				success: function(data){
					that.prop('name', data);
						if(data==1) {
							$('#like').attr("class", "glyphicon glyphicon-heart");
							likeCount();
						}
						else {
							$('#like').attr("class", "glyphicon glyphicon-heart-empty");
							likeCount();
						}
					}
				})
			});

		
		function likeCount() {
			var that = $(".totalLike")
			var sendData = {'rev_id' : '${review.rev_id}', 'totalLike' : that.prop('name')};
			$.ajax({
				url: '/reviewLikeCount.do',
				type: 'post',
				data: sendData,
				success: function(count){
					$("#totalLike").html(count);
				},
				});
			}
		
		});
		
</script>
</head>
  <%@ include file="../include/HeaderBoot.jsp" %>
<body>
	<div class="Guide">
      <span>리뷰</span>
    </div>
	   <div class="container">
   <section id="container">
      <div>
      <form name="reviewForm" role="form" method="post">
      <input name="rev_id" type="hidden" value="${review.rev_id}">
      <input name="page" type="hidden" value="${scri.page}">
      <input name="perPageNum" type="hidden" value="${scri.perPageNum}">
      <input name="searchType" type="hidden" value="${scri.searchType}">
      <input name="keyword" type="hidden" value="${scri.keyword}">
      </form>
      <input name="member_id" type="hidden" value="${member.member_id}">
         <div class="form-group">
            <label for="rev_writer" class="col-sm-2 control-label">글쓴이</label>
            <input type="text" name="rev_writer" class="form-control" value="${review.rev_writer}" readonly>
         </div>
         <div class="form-group">
            <label for="rev_title" class="col-sm-2 control-label">제목</label>
            <input type="text" name="rev_title" class="form-control" value="${review.rev_title}" readonly>
         </div>
         <div class="form-group">
            <label for="rev_f_category" class="col-sm-2 control-label">애완동물 크기</label>
            <input type="text" name="rev_f_category" value="${review.rev_f_category}" readonly>
         </div>
         <div class="form-group">
            <label for="rev_content" class="col-sm-2 control-label">내용</label>
            <textarea name="rev_content" rows="10" cols="40" class="form-control" readonly>${review.rev_content}</textarea>
         </div>
         <div class="form-group">
            <label for="rev_f_img" class="col-sm-2 control-label">썸네일</label>
            <img src="${review.rev_thumb_img}" id="rev_thumb_img"/>
         </div>
         <div class="form-group">
            <label for="rev_stars" class="col-sm-2 control-label">평점</label>
            <input type="number" name="rev_stars" placeholder="1~5 사이의 평점 입력" value="${review.rev_stars}" readonly>
         </div>
         <div class="form-group">
            <label for="rev_show" class="col-sm-2 control-label">공개</label>
            <input type="text" name="rev_show" value="${review.rev_show}" readonly>
         </div>
         <div class="form-group">
            <label for="product_id" class="col-sm-2 control-label">상품코드</label>
            <input type="text" name="product_id" value="${review.product_id}" readonly>
         </div>
         <div class="form-group">
            <a class="like">좋아요
            <span id="like" class="glyphicon glyphicon-heart"></span>
            </a>
            <a class="totalLike">
            <span id="totalLike">${review.rev_like_cnt}</span>
            </a>
         </div>
         <c:if test="${review.rev_writer eq member.member_nickname}">
            <button type="button" class="updateBtn btn btn-success">수정</button>
         </c:if>
         <c:if test="${review.rev_writer eq member.member_nickname || member.member_grade eq '2'}">
            <button type="button" class="reviewDeleteBtn btn btn-warning">삭제</button>
         </c:if>
            <button type="button" class="reviewListBtn btn btn-default">목록</button>
         </div>
         
   
   
   <!-- 후기 댓글 -->
   <div class="reply" id="reply">
      <ol class="replyList">
         <c:forEach items="${reviewReplyList}" var="replyList">
            <li>
               <p>
                  글쓴이: ${replyList.rev_com_writer} <br>
                  작성일: <fmt:formatDate value="${replyList.rev_com_moddate}" pattern="yyyy-MM-dd" />
               </p>
               <p>${replyList.rev_com_content}</p>
               <div>
               	<c:if test="${replyList.rev_com_writer eq member.member_id || member.member_grade eq '2'}">
                  <button type="button" class="reviewReplyUpdateBtn btn btn-warning" data-rno="${replyList.rev_com_id}">수정</button>
                  <button type="button" class="reviewReplyDeleteBtn btn btn-danger" data-rno="${replyList.rev_com_id}">삭제</button>
             	</c:if>
               </div>
            </li>
         </c:forEach>
      </ol>
   </div>
   
   <!-- 후기 댓글 작성 -->
   <%-- <c:set var="contextPath" value="${pageContext.request.contextPath}"/> --%>
   <form name="reviewReplyForm" class="form-horizontal" method="post" action="/insertReviewReply.do">
      <input type="hidden" id="rev_id" name="rev_id" value="${review.rev_id}">
      <input type="hidden" name="member_id" value="${member.member_id}"/>
      
      <div class="form-group">
         <label for="rev_com_writer" class="col-sm-2 control-label">댓글 글쓴이</label>
         <div class="col-sm-10">
            <input type="text" id="rev_com_writer" name="rev_com_writer" value="${member.member_nickname}" />
         </div>
      </div>
      
      <div class="form-group">
         <label for="rev_com_content" class="col-sm-2 control-label">댓글 내용</label>
         <div class="col-sm-10">
            <textarea name="rev_com_content" rows="3" cols="30" class="form-control"></textarea>
         </div>
      </div>
      
      <div class="form-group">
         <label for="rev_com_show" class="col-sm-2 control-label">공개</label>
         <div class="col-sm-10">
            <select name="rev_com_show">
                        <option value="Y">공개</option>
                       <option value="N">비공개</option>
               </select>
         </div>
      </div>

      <div class="form-group replydiv">
         <div class="col-sm-10">
            <button type="submit" class="insertReviewReplyBtn btn btn-success">작성</button>
         </div>
      </div>

   </form>
   </section>
   <hr>
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
</body>
<%@ include file="../include/Footer.jsp"%>
</html>