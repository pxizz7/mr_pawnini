<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../style/event.css" />
    <title>Snack</title>
  </head>

 <%@ include file="../include/Header.jsp" %> 
	<div class="Guide">
      <span>EVENT</span>
    </div>

    <h1 class="event_Title">TODAY EVENT</h1>
      
        <div class="event">

          <ul class="event_grid">

            <li class="js-clock">
              <h1>HOT TIME</h1>
              <h3>00:00</h3>
            </li>

            <li class="js-clock-two">
            <h1>HOT TIME</h1>
            <h4 class="js_clock_h4">00:00</h4>  
            </li>

            <li>3</li>
            <li>4</li>
            <li>5</li>
            <li>6</li>
            <li>7</li>
            <li>8</li>
            <li>9</li>
            <li>10</li>
          </ul>
      </div>

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
    <script src="../js/clock.js"></script>
    <script src="../js/clock2.js"></script>
  </body>
</html>
