<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ page import ="com.pawnini.model.cs.CsDTO" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.util.Date" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pawnini - [${cs.cs_title } ]</title>
    <style type="text/css">
   a, a:hover, a:focus, a:active {
      color: black;
      text-decoration: none;
   }
</style>    
<link type="text/css" rel="stylesheet" href="../style/cs.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<%@ include file="../include/HeaderBoot.jsp"%>
<body> 


<!--  MY BIT -->

	<div class="container">
		<div class="input-group">
			<h1>${cs.cs_title } 상세 내용</h1>
			<button  type="button" class="list_btn" onclick="getCsList();">게시글 목록</button>
			<c:if test="${member.member_grade eq 2 }">
			<button type="button" class="reply_btn">답글달기</button> 
			</c:if>
			<c:if test="${member.member_id eq cs.member_id || member.member_grade eq 2}">
				<button type="button" class="update_btn" onclick="goUpdateCs();">수정</button> 
				<button type="button" class="delete_btn">삭제</button> 
			</c:if>
		</div>
	</div>
	
	<!-- scri 값 보간하기 위해서  -->
	<section id="container">
		<form name="csForm" role="form">
		<div class="hidden">
			<input type="hidden" id="cs_id" name="cs_id" value="${cs.cs_id }"/>
			<input type="hidden" id="cs_re_group"  name="cs_re_group" value="${cs.cs_re_group }"/>
			<input type="hidden" id="cs_re_order" name="cs_re_order" value="${cs.cs_re_order }"/>
			<input type="hidden" id="cs_re_depth" name="cs_re_depth" value="${cs.cs_re_depth }"/>	
			<input type="hidden" id="curPage" name="curPage" value="${scri.curPage}"/>
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"/>
			<input type="hidden" id="searchOption" name="searchOption" value="${scri.searchOption}"/>
			<input type="hidden" id="searchKeyword" name="searchKeyword" value="${scri.searchKeyword}"/>
			<input type="hidden" id="totalCount" name="totalCount" value="${csPagination.totalCount}"/>
		</div>	
		<table  class="table table-hover">
			<tr>
				<td ><label for="cs_title">제목</label> ${cs.cs_title }</td>
			</tr>
			<tr>
				<td><label for="cs_member_id">멤버아이디</label> ${cs.member_id }</td>
			</tr>
			<tr>
				<td><label for="cs_writer">작성자</label> ${cs.cs_writer }</td>
			</tr>
			<tr>
				<td><label for="cs_regdate">작성일</label>
				<fmt:formatDate value="${cs.cs_regdate }" pattern="yyyy년 MM월 dd일 HH시mm분"/></td>
			</tr>			
			<tr>
				<td><label for="cs_show">공개 여부</label> ${cs.cs_show }</td>
			</tr>
			<tr>
				<td><label for="cs_content">내용</label><br>
					<textarea id="cs_content" name="cs_content" cols="50" rows="10" readonly> ${cs.cs_content }</textarea>
				</td>
			</tr>
			<!-- 
			<c:if test="${cs.cs_fileName ne null || ( cs.cs_fileName ne '') }">	x	 -->
				<tr align="left">
					<td><label for="cs_uploadFile">첨부파일</label>
					<a id="cs_uploadFile" href="fileDownload.do?cs_fileName=${cs.cs_fileName }">${cs.cs_fileName }</a></td>
				</tr>
		<!-- 	</c:if>
			 -->
		</table>
		<br><br><br>	
	</form>
</section>
	
		<!--  NEED TO FIX THE CONDITION(CORRESPONDS TO THE SEARCH RESULT AND THE PAGE LIMIT --  hide it when it reaches the min and max-->
	<section class="container">	
		<div class="pagination">	
			<table border="1">
			<c:set var="ci" value="${cs.cs_id }"/>
			<c:choose>
				<c:when test="${cs.prev_cs_id le 0}">
					<tr ><td>이전 글이 없습니다.</td></tr>
					<tr><td><a id="nextPost" href="getCs.do?cs_id=${cs.next_cs_id }&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}" >다음글 : ${cs.next_cs_id} ${cs.next_cs_title }</a></td>
				</c:when>
				<c:when test="${ ci ge csPagination.totalCount}">
					<tr><td><a id="prevPost"  href="getCs.do?cs_id=${cs.prev_cs_id }&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}">이전글 : ${cs.prev_cs_id} ${cs.prev_cs_title }</a></td>
					<tr><td>다음 글이 없습니다.</td>
				</c:when>
				<c:otherwise>
					<tr><td><a id="prevPost"  href="getCs.do?cs_id=${cs.prev_cs_id }&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}">이전글 : ${cs.prev_cs_id} ${cs.prev_cs_title }</a></td>
					<tr><td><a id="nextPost" href="getCs.do?cs_id=${cs.next_cs_id }&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}" >다음글 : ${cs.next_cs_id} ${cs.next_cs_title }</a></td>
				</c:otherwise>
			</c:choose>
			</table>
		</div>
	</section>
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		var formObj = $("form[name='csForm']");
		
		//게시물 지우기
		$(".delete_btn").on("click", function(){
			var yn = confirm("게시글을 삭제하시겠습니까?  게시물 삭제시 답변도 함게 삭제됩니다");
			if (yn) {
				formObj.attr("action", "deleteCs.do");
				formObj.attr("method", "post");
				formObj.submit();
				alert("게시물이 삭제되었습니다");
			} else {
				alert("삭제를 실패했습니다.");
				return;
			}		
		})
		
		//reply button
	$(".reply_btn").on("click", function () {
		var cs_id = $("#cs_id").val();
		var cs_re_group = $("#cs_re_group").val();
		var cs_re_order  = $("#cs_re_order").val();
		var cs_re_depth = $("#cs_re_depth").val();
		location.href="csReply.do?cs_id="+cs_id+"&cs_re_group="+cs_re_group+"&cs_re_order="+cs_re_order+"&cs_re_depth="+cs_re_depth;			
	});
});
	
	//게시판 - 수정 페이지 이동
	function goUpdateCs() {
		location.href="updateCs.do?cs_id=${cs.cs_id}";
	}
	//게시판 - 목록 페이지 이동
	function getCsList(){
		location.href="getCsList.do?curPage=${scri.curPage}"+"&perPageNum=${scri.perPageNum}"+
				"&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}";
	};	
</script>

</body>
<%@ include file="../include/Footer.jsp"%>
</html>