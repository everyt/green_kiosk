<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String cPath = request.getContextPath();
%>

<html>
<head>
	<title>회원가입</title>
	<link rel="stylesheet" href="<%=cPath %>/assets/css/register.css">
</head>
<script>
function maxLengthCheck(object) {  
	if (object.value.length > parseInt(object.attributes.maxlength)) {
		object.value = object.value.slice(0, object.max.length);
	}
}

function idcheck() {
	let regfrm = document.regFrom;
	
	let id = regfrm.mem_id;
	
	if (id.value.trim() === "") {
		alert("아이디를 입력해주세요.");
		id.focus();
	} else {
		let url = "<%= cPath%>/register/reg_idcheck.jsp?usid="+id.value
		window.open(url, "아이디 확인", "width=500, height=100");
	}
}

//회원가입
function register() {
	let regfrm = document.regFrom;
	
	let id = regfrm.mem_id;
	let pw = regfrm.mem_pw;
	let re_pw = regfrm.loginPwConfirm;
	let name = regfrm.mem_name;
	let phone = regfrm.mem_phone;
	
	if (id.value.trim() === "") {
		alert("아이디를 입력해주세요.");
		id.focus();
	} else {
		if (pw.value.trim() === "") {
			alert("비밀번호를 입력해주세요.");
			pw.focus();
		} else {
			if (re_pw.value.trim() === "") {
				alert("비밀번호 확인을 입력해주세요.")
				re_pw.focus();
			} else {
				if (pw.value != re_pw.value) {
					alert("비밀번호가 서로 일치 하지 않습니다.");
					pw.focus();
				} else {
					if (name.value.trim() === "") {
						alert("이름을 입력해주세요.");
						name.focus();
					} else {
						if (phone.value.trim() === "") {
							alert("핸드폰 번호를 입력해주세요.");
							phone.focus();
						} else {
							if (phone.value.length != 11) {
								alert("전화번호는 11글자 이어야합니다.").
								phone.focus();
							} else {
								regfrm.submit();
							}
						}
					}
				}
			}
		}
	}
}

//비밀번호 표시 함수
function password_visable(bool) {
	let pw_input = document.getElementById("pw");
	let ps_hide = document.getElementById("ps_hide");
	let ps_show = document.getElementById("ps_show");
	if (bool == "true") {
		pw_input.type = "text";
		ps_hide.style.display = "none";
		ps_show.style.display = "";
	} else {
		pw_input.type = "password";
		ps_show.style.display = "none";
		ps_hide.style.display = "";
	}
}

//비밀번호 표시 함수
function re_password_visable(bool) {
	let pw_input = document.getElementById("pw_re");
	let ps_hide = document.getElementById("ps_hide_re");
	let ps_show = document.getElementById("ps_show_re");
	if (bool == "true") {
		pw_input.type = "text";
		ps_hide.style.display = "none";
		ps_show.style.display = "";
	} else {
		pw_input.type = "password";
		ps_show.style.display = "none";
		ps_hide.style.display = "";
	}
}

</script>
<body>
<form action="<%=cPath %>/register/reg_proc.jsp" method="POST" class="joinForm" name="regFrom">
                                                                                               
      <h2>회원가입</h2>
      <div class="textForm">
        <input name="mem_id" type="text" class="id" placeholder="아이디" maxlength="22">
      </div>
      <input class="idcheck" onclick="idcheck()" type="button" value="아이디 중복확인"/>
      <div class="textForm">
        <input name="mem_pw" type="password" class="pw" id="pw" placeholder="비밀번호" maxlength="23">
        <div class="eyes_pw">
			<i id="ps_hide" onclick="password_visable('true')" class="on"></i>
			<i id="ps_show" onclick="password_visable('false')" style="display:none" class="off"></i>
		</div>
      </div>
       <div class="textForm">
        <input name="loginPwConfirm" type="password" class="pw" id="pw_re" placeholder="비밀번호 확인" maxlength="23">
        <div class="eyes_pw">
			<i id="ps_hide_re" onclick="re_password_visable('true')" class="on"></i>
			<i id="ps_show_re" onclick="re_password_visable('false')" style="display:none" class="off"></i>
		</div>
      </div>
      <div class="textForm">
        <input name="mem_name" type="text" class="name" placeholder="이름">
      </div>
      <div class="textForm">
        <input name="mem_phone" type="text" maxlength="11" class="cellphoneNo" oninput="maxLengthCheck(this)" placeholder="전화번호" >
      </div>
      <input type="button" onclick="register()" class="btn" value="가 입 하 기"/>
    </form>
</body>
</html>