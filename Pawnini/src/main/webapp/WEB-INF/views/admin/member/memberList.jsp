<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../style/memberList.css" />
<title>Insert title here</title>
</head>
   <%@ include file="../../include/Header.jsp" %> 
  <body>
  <div class="Guide">
      <span>ADMIN</span>
    </div>
      <div align="center">
         <h1>회원 리스트</h1>
         <table  border="1">
            <tr class="head">
               <td>아이디      
               <td>이름
               <td>닉네임
               <td>이메일
               <td>전화번호
               <td>가입일
               <td>등급
               <td>
            <c:forEach items="${memberList}" var="member">
            <tr>
               <td>${member.member_id}
               <td>${member.member_name}
               <td>${member.member_nickname}
               <td>${member.member_email}
               <td>${member.member_phone}
               <td>${member.member_regdate}
               <td class="manger"><c:if test="${member.member_grade == 1}">회원</c:if>
               <c:if  test="${member.member_grade == 2}"><span style="color:red">관리자</span></c:if>
               <td><a href="kickMember.do?member_id=${member.member_id}">회원삭제</a>
            </c:forEach>
         </table>
      </div>
   </body>

    <%@ include file="../../include/Footer.jsp" %>
</html>
