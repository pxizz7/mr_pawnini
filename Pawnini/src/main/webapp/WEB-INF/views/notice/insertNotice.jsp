<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>공지사항 등록</title>
</head>
	  <%@ include file="../include/Header.jsp" %>

<body>
<center>
		<div class="Guide">
      		<span>공지사항</span>
    	</div>

	<form action="insertNotice.do" method="post">
	<table border="1" cellpadding="0" cellspacing="0">
	    <tr>
	        <td width="70">제목</td><td align="left">
	        <input type="text" name="notice_title"/></td>
	    </tr>
	    <tr>
	        <td>작성자</td><td align="left">
	        <input type="text" name="notice_name" size="10" value="${member.member_nickname}" readonly="readonly"></td>
	    </tr>
	    <tr>
	        <td>내용</td><td align="left">
	        <textarea name="notice_content" cols="70" rows="23"></textarea></td>
	    </tr>
	    
	    <tr>
	        <td colspan="2" align="center">
	        <input type="submit" value=" 새글 등록 "/></td>
	    </tr>
	</table>
	</form>
	<hr>
	<a href="getNoticeList.do">글 목록 가기</a>
</center>
</body>
   <%@ include file="../include/Footer.jsp" %>

</html>
