<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../style/Adoption.css" />
    <title>Snack</title>
  </head>
  <%@ include file="../include/Header.jsp" %>
  <body>


    <h1>공사중</h1>

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
  </body>
</html>
