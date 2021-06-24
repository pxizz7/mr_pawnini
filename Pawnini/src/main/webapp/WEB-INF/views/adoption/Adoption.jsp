<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <style type="text/css">
  	.img{
		width:300px;
  		
  		height: 300px;
  		box-shadow: 3px 3px 2px 2px rgba(0, 0, 0, 0.5);
  	}
  	.text{
  	display: flex;
  	justify-content: center;
  	align-items: center;
  	font-size: 20px;
  	font-weight: 600;
  	border-top: 1px solid rgba(0,0,0,0.3);
  	padding-top: 30px;
  	}
  </style>
  
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../style/Adoption.css" />
    <title>Snack</title>
  </head>
  
   <%@ include file="../include/Header.jsp" %> 
   
  <body>
  	<div class="Guide">
      <span>분양</span>
    </div>
    <h1 class="bener_text">They are waiting for their owners.</h1>
     <div id="player"></div>
    <section>
      <div class="sa sa-scaleDown">
        <ul class="bener_ul">
          <c:forEach items="${pawsList}" var="paws">
          <li>
          	<img src="${paws.paws_thumb_img}" class="img"><br>
        	<a href="getPaws.do?paws_id=${paws.paws_id}">
        	<span class="text">${paws.paws_name}</span></a>
          </li>
          </c:forEach>
        </ul>

      </div>
    </section>
   
   
    <%@ include file="../include/Footer.jsp" %>
   
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
    
  </body>
  
</html>
