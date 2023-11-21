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