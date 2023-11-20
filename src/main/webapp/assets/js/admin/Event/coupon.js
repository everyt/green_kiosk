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
	
	window.addEventListener('beforeunload', unload_listener);
})

function upload() {
	const unload_listener = (event) => {
		event.preventDefault();
		console.log(event);
		event.returnValue = "정말 이창을 닫으시겠습니까?\n내용이 저장되지 않습니다.";
	}
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	
	let categorys = new Array();
	let name = document.uploadFrm.coupon_name.value;
	let discount_per = document.uploadFrm.coupon_discount.value;
	let desc = document.uploadFrm.coupon_desc.value;
	let enable = document.uploadFrm.coupon_enable.checked;
	let vaild_date = document.uploadFrm.coupon_vaild_date.value;
	Array.prototype.forEach.call(document.uploadFrm.category.options, (ele) => {
		if (ele.selected) {
			categorys.push(ele.value);
		}
	})
	if (name.trim() != "") {
		if (desc.trim() != "") {
			if (discount_per.trim() != "") {
				if (categorys.length != 0) {
					fetch(contextPath+"api/admin/coupon/add", {
						method: "POST",
						body: JSON.stringify({
							"name": name,
							"desc": desc,
							"discount_per": discount_per,
							"enable": enable,
							"category": JSON.stringify(categorys),
							"vaild_date": vaild_date
						})
					}).then((response) => {
						response.json().then((data) => {
							if (data.result == "success") {
								window.removeEventListener('beforeunload', unload_listener);
								opener.loadContent('/green_kiosk/admin/Event/coupon_info.jsp')
								alert("쿠폰이 정상적으로 등록 되었습니다. 해당 창을 닫으셔도됩니다.")
								self.close();
							} else {
								if (data.reason == "already using name") {
									alert("등록중 오류가 발생하였습니다.\n사유 : 이미 사용중인 이름입니다");
								} else {
									alert("등록중 오류가 발생하였습니다.\n사유 : 알수 없는 오류입니다");
								}
							}
						})
					})
				}
			}
		}
	}
}

