<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="style/Login.css" />
    <link rel="stylesheet" href="style/main.css" />
    
    <script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="/logout.do";
		});
	})
	</script>
  </head>
   <%@ include file="include/Header.jsp" %>
  <body>
 
<div align="center">
	
	<div class="Guide">
      <span>LOGIN</span>
    </div>
	
	<form class="Form" name="loginForm" method="post" action="/login.do">
		 <h1 class="Form_title">Login</h1>
		<c:if test="${member == null}">
			<div>
				<input class="Form_Login" type="text" id="userId" name="member_id" placeholder="User Name">
			</div>
			<div>
				<input class="Form_Password" type="password" id="member_pwd" name="member_pwd" placeholder="User password">
			</div>
			<div class="Login_box">
				<button class="button_Login" type="submit">로그인</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<div>
				<input class="Form_Login" type="text" id="userId" name="member_id" placeholder="User Name">
			</div>
			<div>
				<input class="Form_Password" type="password" id="member_pwd" name="member_pwd" placeholder="User password">
			</div>
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
			<div class="Login_box">
				<button class="button_Login" type="submit">로그인</button>
			</div>
		</c:if>
	</form>
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
</div>

  </body>
  <%@ include file="include/Footer.jsp" %> 
</html>
