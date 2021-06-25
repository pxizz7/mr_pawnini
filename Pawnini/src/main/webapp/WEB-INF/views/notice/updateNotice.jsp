<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>공지사항 수정</title>
</head>
	  <%@ include file="../include/Header.jsp" %>
<body>
<div align="center">
		<div class="Guide">
      		<span>공지사항</span>
    	</div>

	<!-- <h1>글 등록</h1> -->
	<!-- <a href="logout.do">Log-out</a>
	<hr> -->
	<form action="updateNotice.do" method="post">
	<table border="1" cellpadding="0" cellspacing="0">
	    <tr>
	        <td width="70">제목</td><td align="left">
	        <input type="text" name="notice_title" value="${notice.notice_title }"></td>
	    </tr>
	    <tr>
	        <td>작성자</td><td align="left">
	        <input type="text" name="notice_name" size="10" value="${notice.notice_name }" readonly="readonly"></td>
	    </tr>
	    <tr>
	        <td>내용</td><td align="left">
	        <textarea name="notice_content" cols="70" rows="23">${notice.notice_content }</textarea></td>
	    </tr>
	    
	    <tr>
	        <td colspan="2" align="center">
	        <input type="submit" value=" 수정 "/></td>
	    </tr>
	</table>
	</form>
	<hr>
	<!-- <a href="getNoticeList.do">글 목록 가기</a> -->
</div>
</body>
   <%@ include file="../include/Footer.jsp" %>
</html>
 