var checkID = false;
var checkPWD = false;
var checkNAME = false;

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
	
	$("#member_name").blur(function() {
		checkName();
	});
})

function doSignup() {
	var member_id = $("#member_id").val();
	var member_pwd = $("#member_pwd").val();
	var member_name = $("#member_name").val();
	var member_year = $("#birth_year").val() + "-" + $("#birth_month").val() + "-" + $("#birth_day").val();
	var member_email = $("#email_id").val() + "@" + $("#email_addr").val(); 
	var member_phone = $("#NUMst").val() + "-" + $("#NUMnd").val() + "-" + $("#NUMrd").val();
	var member_zipcode = $("#member_postcode").val();
	var member_faddr = $("#member_f_addr").val();
	var member_laddr = $("#member_s_addr").val();
	if (checkID == false) { console.log("아이디 중복검사 안함"); }
	if (checkPWD == false) { console.log("비밀번호 다름"); }
	if (checkNAME == false) { console.log("이름이 비어있음"); }
	if (checkID == false || checkPWD == false || checkNAME == false ) {
		swal("", "필수항목이 비어있습니다. 입력해주세요.", "warning");
	} else {
		$.ajax({
			type : "POST",
			url : "join",
			data : {
				"member_id" : member_id,
				"member_pwd" : member_pwd,
				"member_name" : member_name,
				"member_nikname" : member_nikname,
				"member_email" : member_email,
				"member_phone" : member_phone,
				"member_postcode" : member_postcode,
				"member_f_addr" : member_f_addr,
				"member_s_addr" : member_s_addr
			},
			success : function(data) {
				window.location.href="main";
			}
		});
	}
}

function idChk() {
	var member_id = $("#member_id").val();
	var oMsg = $("#idchk");
	if (!member_id) {
		swal("", "아이디를 입력해주세요.", "error");
	} else {
		$.ajax({
			type : "POST",
			url : "checkID",
			data : {
				"member_id" : member_id
			},
			success : function(data) {
				if (data == 0) {
					$("#member_id").attr("disabled", true);
					oMsg.css("color", "green");
					oMsg.text("사용 가능한 아이디입니다.");
					checkID = true;
				} else if (data != 0) {
					$("#idchk").css("color", "red");
					$("#idchk").text("이미 존재하는 아이디입니다.");
					checkID = false;
				} else { console.log('ERROR'); }
			}, error : function(error) { swal("", member_id, "error"); }
		});
	}
}

function checkBirth() {
	var birthDay;
	var yy = $("#birth_year").val();
	var mm = $("#birth_month").val();
	var dd = $("#birth_day").val();
	var oMsg = $("#birchk");
	
	if (yy == "" && mm == "" && dd == "") {
		oMsg.css("color", "red");
		oMsg.text("태어난 년도 4자리를 정확히 입력해주세요");
		return false;
	}
	
	if (mm.length == 1) {
		mm = "0" + mm;
	}
	
	if (dd.length == 1) {
		dd = "0" + dd;
	}
	
	if(yy == "") {
		oMsg.css("color", "red");
		oMsg.text("태어난 년도를 선택하세요");
		return false;
	}
	
	if(mm == "") {
		oMsg.css("color", "red");
		oMsg.text("태어난 월을 선택하세요");
		return false;
	}
	
	if(dd == "") {
		oMsg.css("color", "red");
		oMsg.text("태어난 일(날짜) 2자리를 정확히 입력하세요.");
		return false;
	}
	
	if(dd.length != 2 || dd.indexOf('e') != -1 || dd.indexOf('E') != -1) {
		oMsg.css("color", "red");
		oMsg.text("태어난 일(날짜) 2자리를 정확히 입력하세요.");
		return false;
	}
	
	birthDay = yy + mm + dd;
	if(!isValidDate(birthDay)) {
		oMsg.css("color", "red");
		oMsg.text("생년월일을 다시 확인해주세요.");
		return false;
	}
	
	var age = calcAge(birthDay);
	
	if(age < 0) {
		oMsg.css("color", "red");
		oMsg.text("외계인이신가요");
		return false;
	} else if (age >= 100) {
		oMsg.css("color", "red");
		oMsg.text("정말이신가요?");
		return false;
	} else if (age < 14) {
		oMsg.css("color", "red");
		oMsg.text("만 14세 미만의 어린이는 가입할 수 없습니다.");
		return false;
	} else {
		checkYEAR = true;
		oMsg.text("");
		return true;
	}
	checkYEAR = true;
	return true;
}

function calcAge(birth) {
	var date = new Date();
	var year = date.getFullYear();
	var month = (date.getMonth() + 1);
	var day = date.getDate();
	if (month < 10) {
		month = "0" + month;
	}
	if (day < 10) {
		day = "0" + day;
	}
	var monthDay = month + "" + day;
	
	birth = birth.replace("-", "").replace("-", "");
	var birthdayy = birth.substr(0, 4);
	var birthdaymd = birth.substr(4, 4);
	
	var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
	console.log("age: " + age);
	return age;
}

function isValidDate(param) {
	try {
		param = param.replace(/-/g, "");
		
		if(isNaN(param) || param.length != 8) {
			return false;
			checkYEAR = false;
		}
		
		var year = Number(param.substring(0, 4));
		var month = Number(param.substring(4, 6));
		var day = Number(param.substring(6, 8));
		
		if (month < 1 || month > 12) {
			return false;
			checkYEAR = false;
		}
		
		var maxDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		var maxDay = maxDaysInMonth[month - 1];
		
		if (month == 2 && (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {
			maxDay = 29;
		}
		
		if (day <= 0 || day > maxDay) {
			return false;
			checkYEAR = false;
		}
		return true;
		checkYEAR = true;
	} catch (err) {
		checkYEAR = false;
	}
}

function checkName() {
	var oMsg = $("#chkname");
	var nonchar = /[^가-힣a-zA-Z0-9]/gi;
	
	var name = $("#member_name").val();
	if (name == "") {
		oMsg.css("color", "red");
		oMsg.text("필수정보입니다.");
		return false;
	}
	
	if (name != "" && nonchar.test(name)) {
		oMsg.css("color", "red");
		oMsg.text("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
		return false;
	}
	checkNAME = true;
	oMsg.text("");
	return true;
}

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
			document.getElementById('member_zipcode').value = data.zonecode;
			document.getElementById('member_faddr').value = fullAddr;
			document.getElementById('member_laddr').focus();
		}
	}).open();
}