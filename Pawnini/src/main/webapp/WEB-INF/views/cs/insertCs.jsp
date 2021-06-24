<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function insertCs() {
		var cs_title = $("#cs_title").val();
		var cs_writer = $("#cs_writer").val();
		var cs_show = $("#cs_show").val();
		var cs_content = $("#cs_content").val();
		var cs_img = $("#cs_img").val();
		var cs_file = $("#cs_file").val();
		var member_id =$("#member_id").val();
		$.ajax({
			type : "POST",
			url : "insertCs.do",
			data : {
				"cs_title" : cs_title,
				"cs_writer" : cs_writer,
				"cs_show" : cs_show,
				"cs_content" : cs_content,
				"cs_img" : cs_img,
				"cs_file" : cs_file,
				"member_id" : member_id 
			},
			success : function(data) {
				window.location.href = "getCsList.do";
			}
		})
	}
</script>

</head>
<body>
<div>
	<h1>CS 등록</h1>
		<table>
			<tr>
				<td><label for="cs_title">제목</label><input type="text" id="cs_title" name="cs_title" required autofocus></td>
			</tr>
			<tr>
				<td><label for="cs_writer">작성자</label><input type="text" id="cs_writer" name="cs_writer" required></td>
			</tr>
			<tr>
				<td><label for="cs_show">공개 여부</label>
						<select name="cs_show" id="cs_show">
	                  		<option value="Y">Y</option>
	                    	<option value="N">N</option>
                    	</select>
				</td>
			</tr>
			<tr>
				<td><label for="cs_content">내용</label><br><textarea name="cs_content" id="cs_content" cols="50" rows="10" required></textarea>
			</tr>
			<tr>
				<td><label for="cs_img">이미지</label><input type="text" name="cs_img" id="cs_img">
			</tr>			
			<tr>
				<td><label for="cs_file">파일</label><input type="file" name="cs_file" id="cs_file"/>
			</tr>	
			<!-- 일단은 -->		
			<tr>
				<td><label for="member_id">멤버아이디</label><input type="text" name="member_id" id="member_id"/>
			</tr>				
			<tr>
				<td><input class="insertBtn" type="button" onclick="insertCs()" style="cursor: pointer" value="글 등록">
			</tr>
		</table>
	<hr>
	<a href="getCsList.do">게시글 목록</a>
</div>
</body>
</html>