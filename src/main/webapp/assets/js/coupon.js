function cate_pop(cate, can_cate) {
	let s_category = document.querySelector("."+cate)
	document.querySelector(".one").attributes.onclick.value = "cate_pop('one',\""+can_cate+"\")"
	document.querySelector(".set").attributes.onclick.value = "cate_pop('set',\""+can_cate+"\")"
	document.querySelector(".side").attributes.onclick.value = "cate_pop('side',\""+can_cate+"\")"
	document.querySelector(".drink").attributes.onclick.value = "cate_pop('drink',\""+can_cate+"\")"
	let can_cates = JSON.parse(can_cate.replaceAll("\'", "\""))
	console.log(can_cates)
	if (s_category != null) {
		if (s_category.classList.contains("cant_use") == false) {
			let categorys = document.querySelectorAll(".cate_pop");
			let pop_menu = document.querySelector(".kiosk_box")
			categorys.forEach((category) => {
				if (category.classList.contains(cate)) {
					category.classList.add("on");
					pop_menu.innerHTML = ""
					if (cate == "one") {
						pop_one.forEach((menu) => {
							let html = `<div>
					                    	<img src="${menu.img}" style="height:165px">
					                    	<span>${menu.name}</span>
					                    </div>`
					                    
					        pop_menu.insertAdjacentHTML("beforeend", html)
						})
					}
					
					if (cate == "set") {
						pop_set.forEach((menu) => {
							let html = `<div>
					                    	<img src="${menu.img}" style="height:165px">
					                    	<span>${menu.name}</span>
					                    </div>`
					                    
					        pop_menu.insertAdjacentHTML("beforeend", html)
						})
					}
					
					if (cate == "side") {
						pop_side.forEach((menu) => {
							let html = `<div>
					                    	<img src="${menu.img}" style="height:165px">
					                    	<span>${menu.name}</span>
					                    </div>`
					                    
					        pop_menu.insertAdjacentHTML("beforeend", html)
						})
					}
					
					if (cate == "drink") {
						pop_drink.forEach((menu) => {
							let html = `<div>
					                    	<img src="${menu.img}" style="height:165px">
					                    	<span>${menu.name}</span>
					                    </div>`
					                    
					        pop_menu.insertAdjacentHTML("beforeend", html)
						})
					}
					
				} else {
					category.classList.remove("on");
				}
			})
		}
	}
}