<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style/main.css" />
    <link rel="stylesheet" href="style/Mypages.css" />
    <title>Pawnini</title>
  </head>
     <%@ include file="include/Header.jsp" %>
  
  <body>
    <div class="wrap">
      <div class="greenContainer">
        <div>
        <c:set var="grade" value="${member.member_grade}"/>
   	<c:if test="${grade eq 1}">
          <div class="grade">일반 회원</div>
    </c:if>
   	<c:if test="${grade eq 2}">
          <div class="grade">관리자</div>
    </c:if>
          <div class="name">${member.member_nickname}</div>
        </div>
        <div class="modify">i</div>
      </div>
      <div class="summaryContainer">
        <div class="item">
          <div class="number">354</div>
          <div>단골상점</div>
        </div>
        <div class="item">
          <div class="number">354</div>
          <div>상품후기</div>
        </div>
        <div class="item">
          <div class="number">354</div>
          <div>적립금(BLCT)</div>
        </div>
      </div>
      <div class="shippingStatusContainer">
        <div class="title">주문/배송조회</div>
        <div class="status">
          <div class="item">
            <div>
              <div class="green number">6</div>
              <div class="text">장바구니</div>
            </div>
            <div class="icon">></div>
          </div>
          <div class="item">
            <div>
              <div class="number">0</div>
              <div class="text">결제완료</div>
            </div>
            <div class="icon">></div>
          </div>
          <div class="item">
            <div>
              <div class="green number">1</div>
              <div class="text">배송중</div>
            </div>
            <div class="icon">></div>
          </div>
          <div class="item">
            <div>
              <div class="green number">3</div>
              <div class="text">구매확정</div>
            </div>
          </div>
        </div>
      </div>
      <div class="listContainer">
        <a href="#" class="item">
          <div class="icon">ii</div>
          <div class="text">주문목록<span class="circle"></span></div>
          <div class="right">></div>
        </a>
        <a href="getReviewList.do" class="item">
          <div class="icon">ii</div>
          <div class="text">상품후기</div>
          <div class="right">></div>
        </a>
        <a href="getProduct_inqList.do" class="item">
          <div class="icon">ii</div>
          <div class="text">상품문의</div>
          <div class="right">></div>
        </a>
        <a href="#" class="item">
          <div class="icon">ii</div>
          <div class="text">단골상점</div>
          <div class="right">></div>
        </a>
        <a href="#" class="item">
          <div class="icon">ii</div>
          <div class="text">찜한상품</div>
          <div class="right">></div>
        </a>
      </div>
      <div class="listContainer">
        <a href="#" class="item">
          <div class="icon">ii</div>
          <div class="text">
            <span>내지갑</span>
            <span class="smallLight">
              <span>|</span>
              <span>보유 적립금</span>
            </span>
          </div>
          <div class="right">
            <span class="blct">175 BLCT</span>
            >
          </div>
        </a>
        <a href="#" class="item">
          <div class="icon">ii</div>
          <div class="text">알림</div>
          <div class="right">></div>
        </a>
        <a href="#" class="item">
          <div class="icon">ii</div>
          <div class="text">설정</div>
          <div class="right">></div>
        </a>
      </div>
      <div class="infoContainer">
        <a href="#" class="item">
          <div>icon</div>
          <div>공지사항</div>
        </a>
        <a href="mypage1.do?member_id=${member.member_id}" class="item">
          <div>icos</div>
          <div>회원정보수정</div>
        </a>
        <a href="#" class="item">
          <div>icon</div>
          <div>고객센터</div>
        </a>
      </div>
    </div>
  </body>
<%@ include file="include/Footer.jsp" %>
  
</html>
