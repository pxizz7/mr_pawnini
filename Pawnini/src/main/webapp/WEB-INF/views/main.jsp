<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <!-- 모바일 대응을 위한 뷰포트 기본 설정 -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="style/main.css" />
    <title>PawNiNi</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css"
    />
  </head>
	<%@ include file="include/Header.jsp" %>
  <body>


    <!-- stlye 은 slick 영역 확인용 -->
    <div class="slider">
      <div id="slider-div">
        <div><img class="slider-div-image" src="./images/slider.jpg" /></div>
        <div><img class="slider-div-image" src="./images/slider2.jpg" /></div>
        <div><img class="slider-div-image" src="./images/slider3.jpg" /></div>
        <div><img class="slider-div-image" src="./images/slider4.jpg" /></div>
      </div>
    </div>

       <main>
      <!-- <section>
        <div class="sa sa-up_own"></div>
      </section> -->
      <div class="Store_Save">
        <h1 class="Store_h1">추천상품!!!</h1>
      </div>
      <section>
        <div class="sa sa-down"></div>
        <div class="sa sa-down"></div>
        <div class="sa sa-down"></div>
        <div class="sa sa-down"></div>
        <div class="sa sa-down"></div>
        <!-- <div class="sa sa-right">디비전 7</div>
        <div class="sa sa-left">디비전 8</div>
        <div class="sa sa-left">디비전 8</div> -->
      </section>

      <h1 class="Store_two_text">오늘의 할인</h1>
      <section>
        <div class="sa sa-_brand"></div>
        <div class="sa sa-_brand"></div>
        <div class="sa sa-_brand"></div>
        <div class="sa sa-_brand"></div>
        <div class="sa sa-_brand"></div>
      </section>

      <div>
        <h1 class="Brand_text">인기 브랜드</h1>
        <div class="brand">
          <ul class="brand_grid">
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
            <li>6</li>
            <li>7</li>
            <li>8</li>
          </ul>
        </div>
      </div>

    </main>
	
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

    <%@ include file="include/Footer.jsp" %>
  

    <script>
      // Scroll Animation (sa, 스크롤 애니메이션)
      const saTriggerMargin = 300;
      const saElementList = document.querySelectorAll(".sa");

      const saFunc = function () {
        for (const element of saElementList) {
          if (!element.classList.contains("show")) {
            if (
              window.innerHeight >
              element.getBoundingClientRect().top + saTriggerMargin
            ) {
              element.classList.add("show");
            }
          }
        }
      };

      window.addEventListener("load", saFunc);
      window.addEventListener("scroll", saFunc);
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
    <script>
      $(function () {
        $("#slider-div").slick({
          slide: "div", //슬라이드 되어야 할 태그 ex) div, li
          infinite: true, //무한 반복 옵션
          slidesToShow: 1, // 한 화면에 보여질 컨텐츠 개수
          slidesToScroll: 1, //스크롤 한번에 움직일 컨텐츠 개수
          speed: 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
          arrows: true, // 옆으로 이동하는 화살표 표시 여부
          dots: true, // 스크롤바 아래 점으로 페이지네이션 여부
          autoplay: true, // 자동 스크롤 사용 여부
          autoplaySpeed: 3000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
          pauseOnHover: true, // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
          vertical: false, // 세로 방향 슬라이드 옵션
          prevArrow:
            "<button type='button' class='slick-prev'>Previous</button>", // 이전 화살표 모양 설정
          nextArrow: "<button type='button' class='slick-next'>Next</button>", // 다음 화살표 모양 설정
          dotsClass: "slick-dots", //아래 나오는 페이지네이션(점) css class 지정
          draggable: true, //드래그 가능 여부

          responsive: [
            // 반응형 웹 구현 옵션
            {
              breakpoint: 960, //화면 사이즈 960px
              settings: {
                //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                slidesToShow: 3,
              },
            },
            {
              breakpoint: 768, //화면 사이즈 768px
              settings: {
                //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                slidesToShow: 2,
              },
            },
          ],
        });
      });
    </script>
  </body>
</html>
