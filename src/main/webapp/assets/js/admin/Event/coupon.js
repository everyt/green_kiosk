window.addEventListener('DOMContentLoaded', function() {
	const enable_switch = document.getElementById("coupon_enable");
	const unload_listener = (event) => {
		event.preventDefault();
		console.log(event);
		event.returnValue = "정말 이창을 닫으시겠습니까?\n내용이 저장되지 않습니다.";
	}


	enable_switch.addEventListener('change', function(event) {
		let cvar = event.srcElement.checked;
		if (cvar === true) {
			alert("이제 이 쿠폰은 발급이 가능합니다.")
		} else {
			alert("이제 이 쿠폰은 발급이 불가능합니다.")
		}
	})
	
	window.addEventListener('beforeunload', unload_listener, { capture: true });
})

function upload() {
	window.removeEventListener('beforeunload', unload_listener, { capture: true });
}

