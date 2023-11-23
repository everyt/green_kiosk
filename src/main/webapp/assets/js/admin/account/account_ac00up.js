/*	function getFoodList(value)
	{
	console.log("value = " + value)
    var parsedData = JSON.parse("["+ value +"]");
    parsedData.forEach(function(order) {
    	order.forEach(function(item) {
    		//menu name
    		var menuName = item.name;
    		//menu amount
    		var amount = parseInt(item.amount);
    		
    		if(menuMap.has(menuName)) { 
    			menuMap.set(menuName, menuMap.get(menuName) + amount);
    		} else {
    			menuMap.set(menuName, amount);
    		}
    	});
    });
    console.log("parsedData = " + parsedData);
    
    const menuArray = Array.from(menuMap.entries());
    const menuData = menuArray.map(([menuName, amount]) => ({menuName, amount}));
    console.log("menuArray = " + menuArray);
    console.log("menuData = " +menuData);
	}
	
*/

//쿠폰
function delete_coupon_type(numb) {
	let context = sessionStorage.getItem("context");
	let del_confrim = confirm(numb+"번 쿠폰을 삭제하시겠습니까?");
	if (del_confrim) {
		fetch (context+"/api/admin/coupon/delete", {
			method: "POST",
			body: JSON.stringify({
				"numb": numb
			})
		}).then((response) => {
			response.json().then((data) => {
				if (data.result == "success") {
					alert("쿠폰이 정상적으로 삭제 되었습니다.")
					loadContent('/green_kiosk/admin/Event/coupon_info.jsp');
				} else {
					alert("삭제중 오류가 발생하였습니다.\n사유 : 알수 없는 오류입니다");
				}
			})			
		})
	}
}