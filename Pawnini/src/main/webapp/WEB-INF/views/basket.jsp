<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>쇼핑몰 장바구니 예제</title>
    <link rel="stylesheet" href="style/basket.css" />
    <link rel="stylesheet" href="style/main.css" />
  </head>
   <%@ include file="include/Header.jsp" %>

  <body>
    <div id="bg1"></div>
    <div id="main_in">
      <div id="menu">
        <form action="/shop/search.php" method="post">
          <div id="search_ser">
            <ul>
              <li>
                <input type="text" placeholder="상품검색" size="50" id="ser" />
              </li>
              <li>
                <button id="se_br"><img src="/search.png" /></button>
              </li>
            </ul>
          </div>
        </form>
      </div>
      <div id="content">
        <h2>장바구니</h2>
        <table class="list-table">
          <thead>
            <tr>
              <th width="350">상품정보</th>
              <th width="120">상품금액</th>
              <th width="150">판매자명</th>
              <th width="100">등록일</th>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td width="300">
                <div class="bak_item">
                  <div class="pro_img">
                    <img
                      src="/shop/<?php echo $bask['pro_pic'];?>.jpg"
                      alt="propic"
                      title="propic"
                    />
                  </div>
                  <div class="pro_nt"><?php echo $bask['pro_name'];?></div>
                </div>
              </td>
              <td width="150"><?php echo $bask['price'];?></td>
              <td width="150">SWR쇼핑</td>
              <td width="100"><?php echo $bask['date']; ?></td>
            </tr>
          </tbody>
          <?php } ?>
        </table>
      </div>
    </div>
  </body>
      <%@ include file="include/Footer.jsp" %>
  
</html>
