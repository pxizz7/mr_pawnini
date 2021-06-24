<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../style/adoptionHome.css" />

</head>
   <%@ include file="../include/Header.jsp" %> 
<body>

<div class="Guide">
      <span>ADOPTION</span>
    </div>
    <h1 class="bener_text">They are waiting for their owners.</h1>
    <div id="player"></div>

    <section>
      <div class="sa sa-scaleDown">
        <ul class="bener_ul">
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
        </ul>
      </div>
    </section>
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

    <!-- 스크롤 반응 소스 -->
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

    <!-- 유투브 api -->
    <script>
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement("script");

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName("script")[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player("player", {
          height: "700",
          width: "100%",
          videoId: "LwfU0oy2ako",
          events: {
            onReady: onPlayerReady,
            onStateChange: onPlayerStateChange,
          },
        });
      }

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        event.target.playVideo();
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          setTimeout(stopVideo, 6000);
          done = true;
        }
      }
      function stopVideo() {
        player.stopVideo();
      }
    </script>
    <script
      src="https://kit.fontawesome.com/583cb96774.js"
      crossorigin="anonymous"
    ></script>

</body>
    <%@ include file="../include/Footer.jsp" %>
</html>
