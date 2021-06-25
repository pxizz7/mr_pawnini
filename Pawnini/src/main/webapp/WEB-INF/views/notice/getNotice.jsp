<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>공지사항 상세</title>
	</head>
	  <%@ include file="../include/Header.jsp" %>
	<body>
		<center>
		<div class="Guide">
      		<span>공지사항</span>
    	</div>
			<form action="go_updateNotice.do" method="post">
			<input name="notice_id" type="hidden" value="${ notice.notice_id }" />
				<table border="1" cellpadding="0" cellspacing="0" >
					<tr>
						<td bgcolor="orange" width="80">제목</td>
						<td align="left">${ notice.notice_title }
					</tr>
					<tr>
						<td bgcolor="orange">작성자</td>
						<td align="left">${ notice.notice_name }</td>
					</tr>
					<tr>
						<td bgcolor="orange">내용</td>
						<td align="left">
							<textarea name="notice_content" cols="70" rows="23" readonly="readonly">${ notice.notice_content }</textarea>
						</td>
					</tr>
					<tr>
						<td bgcolor="orange">등록일</td>
						
						<td><fmt:formatDate value="${ notice.notice_date }" pattern="yyyy-MM-dd" /></td>
					</tr>
			<c:if test ="${notice.notice_name eq member.member_nickname}">
					<tr>
						<td colspan="2" align="center">
						<input type="submit" value="수정하기">
					</tr>
			</c:if>
				</table>
			</form>
			<c:if test ="${notice.notice_name eq member.member_nickname}">
			<a href="deleteNotice.do?notice_id=${ notice.notice_id}">글 삭제</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<a href="getNoticeList.do">글 목록</a>
		</center>
	</body>
	   <%@ include file="../include/Footer.jsp" %>
</html>
