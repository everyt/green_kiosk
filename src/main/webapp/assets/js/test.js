	fetch("/green_kiosk/api/user/find_id?name="+name+"&phone="+phone, {
		method: "post"
	}).then(response => {
		response.json().then((data) => {
			if (data.result == "") {
				alert("검색된 아이디가 없습니다.\n다른 정보로 다시 시도해보세요.")
			} else {
				alert("검색된 아이디\n"+data.result)
			}
			
		})
	})