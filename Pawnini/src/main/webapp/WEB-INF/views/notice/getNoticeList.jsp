<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>
</head>
<link rel="stylesheet" href="../style/noticeList.css" />

	  <%@ include file="../include/Header.jsp" %>

<body>
		<div class="Guide">
      		<span>공지사항</span>
    	</div>
<div class="container">

<table class="table table-hover">
			<tr class="product">
				<th>글번호
				<th>제목
				<th>작성자
				<th>등록일
				
			</tr>
			<c:forEach items="${noticeList}" var="notice">
				<tr>
					<td>${ notice.notice_id }</td>
					<td align="left"><a	href="getNotice.do?notice_id=${ notice.notice_id }">
					 ${ notice.notice_title }</a></td>
					<td>${ notice.notice_name }</td>
					<td><fmt:formatDate value="${ notice.notice_date }" pattern="yyyy-MM-dd" /></td>

				</tr>
			</c:forEach>
		</table>
</div>
<div align="center">
		<c:if test="${member.member_grade == 2}">
		<a href="go_insertNotice.do">새 글 등록</a>
		</c:if>
</div>
</body>
   <%@ include file="../include/Footer.jsp" %>
</html>
