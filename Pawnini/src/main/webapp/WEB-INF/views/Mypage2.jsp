<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="style/updateMember.css" />
		
<title>Insert title here</title>
<script type="text/javascript">
var checkPWD = false;
$(document).ready(function() {
	$("#member_pwd").keyup(function() {
		$("#checkPasswd").text("");
	});
	
	$("#chk_member_pwd").keyup(function() {
		var checkText = $("#checkPasswd");
		if ($("#member_pwd").val() == "" || $("#chk_member_pwd").val() == "") {
			checkText.css("color", "red");
			checkText.text("필수정보입니다.");
			checkPWD = false;
		} else if ($("#member_pwd").val() != $("#chk_member_pwd").val()) {
			checkPWD = false;
			checkText.text("패스워드가 동일하지 않습니다.");
			checkText.css("color", "red");
		} else {
			checkPWD = true;
			checkText.text("패스워드가 동일합니다.");
			checkText.css("color", "green");
		}
	});

	$("#email_select").change(function() {
		if ($("#email_select").val() == "1") {
			$("#email_addr").val("");
			$("#email_addr").prop("disabled", false);
		} else if ($("#email_select").val() == "") {
			$("#email_addr").val("");
			$("#email_addr").prop("disabled", true);
		} else {
			$("#email_addr").val($("#email_select").val());
			$("#email_addr").prop("disabled", true);
		}
	});

})

function searchPost() {
	new daum.Postcode({
		oncomplete : function(data) {
			var fullAddr = '';
			var extraAddr = '';

			if (data.userSelectedType == 'R') {
				fullAddr = data.roadAddress;
			} else {
				fullAddr = data.jibunAddress;
			}
			if (data.userSelectedType == 'R') {
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
			}
			document.getElementById('member_postcode').value = data.zonecode;
			document.getElementById('member_f_addr').value = fullAddr;
			document.getElementById('member_s_addr').value = '';
		}
	}).open();
}

// 회원정보 수정
function myinfoUp() {
	var member_id = '<c:out value = "${member.member_id}"/>'
	var member_pwd = $("#member_pwd").val();
	var member_name = $("#member_name").val();
	var member_nickname = $("#member_nickname").val();
	var member_postcode = $("#member_postcode").val();
	var member_f_addr = $("#member_f_addr").val();
	var member_s_addr = $("#member_s_addr").val();
	var myp = $("#myp").val();
	if (checkPWD == false) {
		console.log("비밀번호 다름");
	}
	if (checkPWD == false) {
		swal("", "필수항목이 비어있습니다. 입력해주세요.", "warning");
	} else {
		swal({
			icon : "warning",
			text : "정말 수정 하시겠습니까?",
			closeOnClickOutside : false,
			closeOnEsc : false,
			buttons : [ "돌아가기", "수정 완료!" ],
		}).then(function(isConfirm) {
			if (isConfirm) {
				swal('수정 완료!', '회원정보 수정을 완료했습니다.^^', 'success').then(function(isConfirm) {
					$.ajax({
						type : "POST",
						url : "updateMember.do",
						data : {
							"member_id" : member_id,
							"member_pwd" : member_pwd,
							"member_name" : member_name,
							"member_nickname" : member_nickname,
							"member_postcode" : member_postcode,
							"member_f_addr" : member_f_addr,
							"member_s_addr" : member_s_addr,
						},
						success : function(data) {
							alert("수정이 완료 되었습니다. 다시 로그인 해주세요.");
							$.ajax({
								type :"GET",
								url : "logout.do",
								data : {},
								success : function (data) {
									location.reload(true);
									window.location.href="gologin.do";
								}
							})
						},
						error : function(data) {
							console.log(member_id);
						}
					});
				});
			}
		})
	}
}

function cancel() {
	window.location.href="myPage.do";
}

// 회원 탈퇴
function clickout(){
	var member_id = '<c:out value = "${member.member_id}"/>';
	swal({
		  title: "정말 회원탈퇴 하시겠습니까?",
		  text: "회원탈퇴를 하시면 저장된 개인정보는 모두 사라지게 됩니다",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
				$.ajax({
					type : "POST",
					url : "deleteMember.do",
					data : {
						"member_id" : member_id
					},
					success : function(data) {
						alert("정상적으로 회원탈퇴가 이루어졌습니다.");
						$.ajax({
							type : "GET",
							url : "logout.do",
							data : {},
							success : function(data) {
								location.reload(true);
								window.location.href="main.do";
							}
						});
					},
					error : function(data) {
						console.log(data);
					}
				});
		  } else {
		    swal("취소되었습니다!",{
		    	icon:"error"
		    });
		  }
		});
}
</script>
</head>

     <%@ include file="include/Header.jsp" %>
<body>
	<div class="Guide">
      <span>회원 정보 수정</span>
    </div>
	<section>
			<div align="center">
				<form name="f1rm" id="f1rm">
					<h2 align="center">회원 정보 수정</h2>
					<table class="table">
						<tr>
							<th>아이디</th>
							<td>
								<label id="member_id" class="input" onFocus="">${member.member_id}</label><br>
								<label id="idchk"></label>
							</td>
						</tr>
						<tr>
							<th>변경할 비밀번호</th>
							<td><input type="password" id="member_pwd" class="input" maxlength="20" /></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" id="chk_member_pwd" class="input" maxlength="20" />
								<label id="checkPasswd"></label>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input type="text" id="member_name" class="input" maxlength="20" value="${member.member_name}"/>
							</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
								<input type="text" id="member_nickname" class="input" maxlength="20" value="${member.member_nickname}"/>
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" name="member_postcode" id="member_postcode" class="input" readonly size="10" value="${member.member_postcode}">
								<input type="button" onclick="searchPost()" style="cursor: pointer" value="우편번호 찾기"><br><br>
								<input type="text" name="member_f_addr" id="member_f_addr" class="input" size="60" value="${member.member_f_addr}" readonly>
							</td>
						</tr>
						<tr>
							<th id="a">상세주소</th>
							<td id="a"><input type="text" name="member_s_addr" id="member_s_addr" class="input" value="${member.member_s_addr}"></td>
						</tr>
					</table>
					</form>
						<input type="button" onclick="myinfoUp()" style="cursor: pointer" value="수정" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" onclick="clickout()" style="cursor: pointer" value="회원탈퇴" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" onclick="cancel()" style="cursor: pointer" value="취소" />
			</div>
		</section>

</body>
	 <%@ include file="include/Footer.jsp" %>
</html>
