<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CS getCsList -- working on css/html</title>
    <style type="text/css">
    	.main_title {
		text-align: center;
		padding: 20px auto;
		color: rosyBrown;
	}
   a, a:hover, a:focus, a:active {
      color: black;
      text-decoration: none;
   }
	</style>    
<link type="text/css" rel="stylesheet" href="../style/cs.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
 
</head>
<%@ include file="../include/HeaderBoot.jsp"%>
<body> 

<!-- my bit -->
	<div class="Guide">
      <span>고객센터</span>
    </div>
	
	<!-- 검색 기능 -->
		<form role="getForm" method="get">
	  	 <div class="container">
	           <div class="col-xs-2 col-sm-3">
					<select class="form-control" name="searchOption2">
							<option value="nth" <core:out value="${scri.searchOption eq null ? 'selected' : '' }"/>>- - 😺 필터 🐶 - -</option>
							<option value="t"<core:out value="${scri.searchOption eq 't' ? 'selected' : '' }"/>>제목</option>
							<option value="w"<core:out value="${scri.searchOption eq 'w' ? 'selected' : '' }"/>>작성자</option>
							<option value="c"<core:out value="${scri.searchOption eq 'c' ? 'selected' : '' }"/>>내용</option>
							<option value="twc"<core:out value="${scri.searchOption eq 'twc' ? 'selected' : '' }"/>>제목+작성자+내용</option>	
					</select>
				</div>	
				<div class="col-xs-8 col-sm-8">
					<div class="input-group">
							<input class="form-control" type="text" name="searchKeyword" id="keywordInput" placeholder="키워드를 입력하세요..." value="${scri.searchKeyword }"/>
							<span class="input-group-btn"><button id="searchBtn" type="button" class="btn btn-primary">검색! <i class="fas fa-search"></i></button></span>		
					</div>
				</div>	
				<div class="col-xs-2 col-sm-1">
					<span class="input-group-btn"><button type="button" class="btn btn-outline-secondary" style="border-radius: 10px;"><a href="redirectInsertCs.do">새 글 추가</a></button></span> <!--  로그인 해야함 -->											
					<!--<button type="button" class="btn btn-secondary"><a href="getCsList.do">새로고침</a></button>   -->	
				</div>
			</div>

		<!-- 상단 테이블 -->
   		<section class="container " style="margin-top:20%">		
			<core:choose>	
				<core:when test="${csPagination.totalCount > 0 }">
					<span> 게시글 수  : ${csPagination.totalCount}</span>
					<table  class="table table-hover">
						<tr class="cs"> <!-- from cs.css, need to fix it -->
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
					<!-- 	<th>공개 여부</th>  -->
							<th>작성일</th>
							<th>조회수</th>
					<!--  	
							<core:if test="${member.member_grade eq 2 }">
					-->		
								<th  class="admin btn btn-default">관리자 버튼</th>
					<!-- 	
							</core:if>
					-->		
						</tr>
						
						<core:forEach var="cs" items="${ csList }">
							<tr>	
								<td width="5%">${cs.cs_id }</td>
								<td width="*" align="left">
									<span style="padding-right:15px"></span>
									<!-- 비공개일때 조건 -->
									 <core:if test="${cs.cs_show eq 'N'}" >
										 <i class="fas fa-lock"></i>
							              <core:choose>
									           <core:when test="${cs.member_id eq member.member_id || member.member_grade eq 2 }"> 
													<core:choose>
														<core:when test="${cs.cs_re_order > 0 }">
															<core:forEach begin="1" end="${cs.cs_re_order}"  step="1">
																<span style="padding-left:20px; font-weight:bold; color:red;">Re : ↪   </span>
															</core:forEach>
															<a href="getCs.do?cs_id=${cs.cs_id }&curPage=${scri.curPage}&perPageNum=${scri.perPageNum }&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}">${cs.cs_title}</a>
														</core:when>
														<core:otherwise>
																<a href="getCs.do?cs_id=${cs.cs_id }&curPage=${scri.curPage}&perPageNum=${scri.perPageNum }&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}">${cs.cs_title}</a>
														</core:otherwise>
													</core:choose>	
												</core:when>
												<core:otherwise>비밀글은 작성자와 관리자만 볼 수 있습니다.</core:otherwise>
											</core:choose>
									</core:if>
									<!-- 공개일때 조건 -->
									<core:if test="${cs.cs_show eq 'Y'}" >
	              						<core:choose>
											<core:when test="${cs.cs_re_order > 0 }">
												<core:forEach begin="1" end="${cs.cs_re_order}"  step="1">
													<span style="padding-left:15px; font-weight:bold; color:red;">Re : ↪  </span>
												</core:forEach>
											<a href="getCs.do?cs_id=${cs.cs_id }&curPage=${scri.curPage}&perPageNum=${scri.perPageNum }&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}">${cs.cs_title}</a>
											</core:when>
											<core:otherwise>
												<a href="getCs.do?cs_id=${cs.cs_id }&curPage=${scri.curPage}&perPageNum=${scri.perPageNum }&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}">${cs.cs_title}</a>
											</core:otherwise>
										</core:choose>	
	               					</core:if>
	               					<!-- TESSSSSSSSSSSSSSSST -->
	               		<!-- 		<core:if test="${cs.cs_fileName ne null || cs.cs_fileName ne ''}">
	               						<span style="text-align:right; margin-left: 20px"><i class="far fa-file-alt"></i></span>
	               					</core:if>		 -->	
            					</td>
            					<core:choose>
	            					<core:when  test="${ member.member_grade eq 1 && (cs.member_id ne member.member_id)}">
	            						<td width="15%"><span style="color:red; font-weight:bold;">제한됨</span></td>
	            					</core:when>
	            					<core:otherwise>
		            					<td width="15%">${cs.cs_writer}</td>
	            					</core:otherwise>
            					</core:choose>
    					<!--  		<td width="5%">${cs.cs_show }</td>   -->
								<td width="20%"><fmt:formatDate value="${cs.cs_regdate }" pattern="yyyy년 MM월 dd일 HH시"/></td>			
								<td width="5%">${cs.cs_hit }</td>
								<core:if test="${member.member_grade eq 2 }">
									<td width="10%" class="admin">
										<button type="button" class="update_btn btn btn-outline-primary"><a href="updateCs.do?cs_id=${cs.cs_id}">수정</a></button> 
										<button type="button" class="delete_btn btn btn-outline-primary"><a href="deleteCs.do?cs_id=${cs.cs_id}">삭제</a></button> 		
									</td>		
								</core:if>		
							</tr>								
						</core:forEach>
					</table>
				</core:when>
				<core:otherwise>
					<p class="empty"><b><span>준비중입니다.. 👻</span></b></p>	
				</core:otherwise>
			</core:choose>	
		</section>
		
	<!--  css : add curpage, pagination (no outline), nextpage, prevpage  -->
		<section class="container">
		<core:if test="${csPagination.totalCount > 0 }">
				<!-- 페이지 네비게이션 출력 -->
					<table class="pagination">
						<tr>
							<td colspan="7" align="center">
							 <core:if test="${csPagination.prev}">
							  	<a class="prevpage" href="getCsList.do${csPagination.makeSearch(csPagination.startPage - 1)}">◀ 이전</a>
							  </core:if> 
							<core:forEach var="num"  begin="${csPagination.startPage}" end="${csPagination.endPage}">
									<core:choose>
										<core:when test="${csPagination.cri.curPage eq num }">
											<a href="getCsList.do${csPagination.makeSearch(num)}" class="curpage">${num}</a>&nbsp;
										</core:when>
										<core:otherwise>
											<a href="getCsList.do${csPagination.makeSearch(num)}">${num}</a>&nbsp;
										</core:otherwise>
									</core:choose>
							</core:forEach>
							<core:if test="${csPagination.next && csPagination.endPage >0}">
							 <a class="nextpage" href="getCsList.do${csPagination.makeSearch(csPagination.endPage+1)}">다음 ▶</a>
							</core:if>
							</td>
						</tr>			
					</table>
		</core:if>
		</section>	
	</form>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"></script>
	<script>
	$(document).ready(function () {
		var formObj = $("form[name='getForm']");
	
		//게시물 지우기
		$(".delete_btn").on("click", function(){
			var yn = confirm("게시글을 삭제하시겠습니까? \n게시물 삭제시 답변도 함게 삭제됩니다");
			if (yn == true) {
				formObj.attr("action", "deleteCs.do");
				formObj.attr("method", "post");
				formObj.submit();
				alert("게시물이 삭제되었습니다");
				location.reload();
			} else {
				alert("삭제를 실패했습니다.");
				return;
			}		
		})
	})
	
		function getCsList(curPage) {
			location.href="${path}/cs/getCsList?curPage="+curPage+"&searchOption=${searchOption}"+"&searchKeyword=${searchKeyword}";
		}
		//검색
		$(function(){
			$('#searchBtn').click(function() {
				self.location="getCsList.do"+'${csPagination.makeQuery(1)}'+"&searchOption="+$("select[name=searchOption2]").val()+"&searchKeyword="+encodeURIComponent($('#keywordInput').val());
			});
		});
	</script>
	</body>
<%@ include file="../include/Footer.jsp"%>
</html>