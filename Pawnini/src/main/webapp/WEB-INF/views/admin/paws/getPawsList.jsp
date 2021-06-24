<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../style/getList.css" />

</head>
   <%@ include file="../../include/Header.jsp" %> 
<body>
	<div class="Guide">
      <span>ADMIN</span>
    </div>
    <div align="center">
       
       <h1> 분양 관리 리스트 </h1>
       <table border="1">
          <tr class="head">
             <td>등록번호
             <td>사진
             <td>1차분류
             <td>2차분류
             <td>이름
             <td>나이
             <td>성별
             <td>중성화여부
             <td>건강
             <td>등록일시
             <td colspan="2">
          <c:forEach items="${pawsList}" var="paws">
          <tr>
             <td>${paws.paws_id}
             <td><img src="${paws.paws_thumb_img}" class="thu_img">   
             <td>${paws.paws_f_code}   
             <td>${paws.paws_s_code}
             <td>${paws.paws_name}
             <td>${paws.paws_age}
             <td>${paws.paws_sex}
             <td>${paws.paws_is_neutered}
             <td>${paws.paws_health}
             <td>${paws.paws_regdate}
             <td><a href="getPaws.do?paws_id=${paws.paws_id}">수정</a>
             <td><a href="deletePaws.do?paws_id=${paws.paws_id}">삭제</a>
          </c:forEach>
       </table>
       <div class="button">
       <a href="goInsertPaws.do">신규 등록</a><br>
       <a href="getPawsList.do">분양페이지</a>
      </div>
    </div>
 </body>

    <%@ include file="../../include/Footer.jsp" %>
</html>