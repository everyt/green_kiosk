/**
 * 
 */
window.addEventListener('DOMContentLoaded', function() {
	let lo_user_id = localStorage.getItem("user_id");
	let save_id = document.getElementById("save_id");
	if (lo_user_id != null) {
		document.loginFrm.mem_id.value = lo_user_id;
		save_id.checked = true;
	}
})

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
	
	//로그인 함수
	function login() {
		let loginfrm = document.loginFrm
		
		let id = loginfrm.mem_id.value
		let pw = loginfrm.mem_pw.value
		
		let save_id = document.getElementById("save_id");
		
		if (id.trim() === "") {
			alert("아이디를 입력해주세요");
			loginfrm.mem_id.focus();
		} else {
			if (pw.trim() === "") {
				alert("비밀번호를 입력해주세요.");
				loginfrm.mem_pw.focus();
			} else {
				if (save_id.checked) {
					localStorage.setItem("user_id", id);
				} else {
					localStorage.removeItem("user_id");
				}
				
				loginfrm.submit();
			}
		}
	}