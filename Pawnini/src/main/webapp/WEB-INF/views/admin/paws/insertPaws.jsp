<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script src="http://code.jquery.com/jquery-1.10.1.js"></script>
 <link rel="stylesheet" href="../../style/AdoptionRegistration.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
   <%@ include file="../../include/Header.jsp" %> 
<body>
	 <div class="Guide">
      <span>분양 등록</span>
    </div>


   <div align="center">
      <form action="insertPaws.do" method="post" enctype="multipart/form-data">
         <table class="table">
            <tr>
               <td><span>1차분류</span>
               <select class="option" name="paws_f_code">
                  <option value="DOG">강아지</option>
                  <option value="CAT">고양이</option>
               </select>
            <tr>
               <td><span>2차분류</span><input type="text" name="paws_s_code">
            <tr>
               <td><span>이름</span><input type="text" name="paws_name">
            <tr>
               <td><span>나이</span><input type="text" name="paws_age">
            <tr>
               <td>
               <div class="inputArea">
                   <label for="paws_img">이미지</label>
                   <input class="file" type="file" id="paws_img" name="file" />
             </tr>
             <tr>
                <td><span>미리보기</span>
                   <div class="select_img"><img src="" /></div>
               </div>
            <tr>
               <td><span>설명</span><textarea rows="10" cols="40" name="paws_desc"></textarea>
            <tr>
               <td><span>성별</span><input type="text" name="paws_sex">
            <tr>
               <td><span>중성화여부</span>
               <select class="option_two"  name="paws_is_neutered">
                        <option  value="Y">Y</option>
                       <option  value="N">N</option>
                    </select>
            <tr>
               <td><span>건강상태</span><input type="text" name="paws_health">
            <tr>
               <td><input class="button" type="submit" value="등록">
         </table>
      </form>
      <br>
      <a class="list" href="AdminGetPawsList.do">목록</a>
   </div>
</body>
    <%@ include file="../../include/Footer.jsp" %>
 <script>
  $("#paws_img").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(300);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>

</html>