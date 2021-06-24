<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<script type="text/javascript">
	$(document).ready(function(){
	$("#logoutBtn").on("click", function(){
		location.href="/logout.do";
	})
	
})
</script>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<form name="loginForm" method="post" action="${contextPath}/login.do">
		<c:if test="${member == null}">
			<div>
				<label for="member_id">아이디</label>
				<input type="text" id="userId" name="member_id">
			</div>
			<div>
				<label for="member_pwd">비밀번호</label>
				<input type="password" id="member_pwd" name="member_pwd">
			</div>
			<div>
				<button type="submit">로그인</button>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.member_id}님 환영 합니다.</p>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
</body>
</html>