<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 답글</title>
<%
	int cs_id = Integer.parseInt(request.getParameter("cs_id"));
	int cs_re_group = Integer.parseInt(request.getParameter("cs_re_group"));
	int cs_re_order = Integer.parseInt(request.getParameter("cs_re_order"));
	int cs_re_depth = Integer.parseInt(request.getParameter("cs_re_depth"));

		
%>
<!-- 게시글 번호 -->
<c:set var="cs_id" value="<%= cs_id %>"/>
<c:set var="cs_re_group" value="<%= cs_re_group %>"/>
<c:set var="cs_re_order" value="<%= cs_re_order %>"/>
<c:set var="cs_re_depth" value="<%= cs_re_depth %>"/>

<script src="http://code.jquery.com/jquery-latest.js"></script>
	<link type="text/css" rel="stylesheet" href="../style/cs.css"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
  <%@ include file="../include/HeaderBoot.jsp" %>
<body>

<h2>게시판 답글 - # ${ cs_id} :  </h2>
<div>
	<form id="csForm" name="csForm">
		<input type="text" id="cs_parent_cs_id" name="cs_parent_cs_id" value="${cs.cs_id }"/>
		<input type="hidden" name="member_id" value="${member.member_id }"/>
		<input type="hidden" name="cs_re_group" value="${cs.cs_re_group }"/>
		<input type="hidden" name="cs_re_order" value="${cs.cs_re_order }"/>
		<input type="hidden" name="cs_re_depth" value="${cs.cs_re_depth }"/>	
		<table>
		<tr>
            <td><label for="cs_title">제목</label><input type="text" id="cs_title" name="cs_title" required autofocus></td> 
        </tr>
         <tr>
            <td><label for="cs_writer">작성자</label><input type="text" id="cs_writer" name="cs_writer" required></td>
 				<!--  로그인 하면 후 멤버아이디도 보여주기 -->
            <td><label for="member_id">멤버아이디</label>${member.member_id }</td>
         </tr>
         <tr>
            <td><label for="cs_show">공개 여부</label>
                  <select name="cs_show" id="cs_show">
                           <option selected>${cs.cs_show }</option>
                       </select>
            </td>
         </tr>
         <tr>
            <td><label for="cs_content">내용</label><br><textarea name="cs_content" id="cs_content" cols="50" rows="10" required></textarea>
         </tr>     
         <tr>
            <td><label for="cs_fileName">파일</label><input type="file" name="cs_fileName" id="cs_fileName"/>
         </tr>   
     </table>
     <button type="button" class="reply_btn">답글 추가</button>
     <button type="reset" >입력 초기화</button>
     <a href="getCsList.do">목록으로..</a>
	</form>
</div>

<script type="text/javascript">
//게시판 목록 페이지 이동
function getCsList() {
	location.href="getCsList.do?curPage=${scri.curPage}"+"&perPageNum=${scri.perPageNum}"+
	"&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}";
}		
$(document).ready(function() {
	var formObj = $("form[name='csForm']");
	
	$(".reply_btn").on("click", function() {
		 var cs_id = $("#cs_id").val();
		 var cs_re_group = $("#cs_re_group").val();
		 var cs_re_order = $("#cs_re_order").val();
		 var cs_re_depth = $("#cs_re_depth").val();
		 var cs_parent_cs_id = $("#cs_parent_cs_id").val();
		 var cs_title = $("#cs_title").val();
	      var cs_writer = $("#cs_writer").val();
	      var cs_show = $("#cs_show").val();
	      var cs_content = $("#cs_content").val();
	      var cs_fileName = $("#cs_fileName").val();
	      var member_id =$("#member_id").val();

	      if (cs_title == "") {
				alert("제목을 입력해주세요!");
				$("#cs_title").focus();
				return;
	      }
	      if (cs_writer == "") {
				alert("작성자를 입력해주세요!");
				$("#cs_writer").focus();
				return;
	      }
	      if (cs_content == "") {
				alert("내용을 입력해주세요!");
				$("#cs_content").focus();
				return;
	      }
	      
		var csReply = confirm("답글을 추가하시겠습니까?");
		
		if (csReply) {
			formObj.attr("action", "insertCsReply.do");
			formObj.submit();
		}	
	})
});
function getCsList() {
	location.href="getCsList.do?curPage=${scri.curPage}"+"&perPageNum=${scri.perPageNum}"+
	"&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}";
}		
</script>
</body>
<%@ include file="../include/Footer.jsp"%>
</html>