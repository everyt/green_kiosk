var orderFoodsValue  = null;
	
	
	
	function iv02(numb){        
		document.readFrm.numb.value=numb;
		document.readFrm.action="iv02.jsp";
		document.readFrm.target="content";
		document.readFrm.submit();
	}
	
	function updateMenu(menuType, page) {
		console.log('Received menuType:', menuType);
	    $.ajax({
	        type: "POST",
			url: "./sales/admin/getAccountData?type=all",
	        dataType: "json",
	        data: {
	        	type : menuType
	        },
	        contentType: "application/json; charset=UTF-8", 
	        success: function (response) {
	            if (response && response.length > 0) {
	                // 받아온 채팅 목록을 활용하여 필요한 작업 수행
	                console.log(response);
	                
	                // 예시: 받아온 목록을 HTML로 만들어 어딘가에 추가
	                var chatListHtml = '';
	                let maxpage = response.length / 10;
	                console.log(Math.round(maxpage))
	                for (var i = 0; i < response.length; i++) {
	                    // 각각의 값을 변수로 가져오기
	                    var order_no = response[i].order_no;
	                    var order_time = response[i].order_time;
	                    var order_foods = response[i].order_foods;
			            var order_price = response[i].order_price;
			            var order_discount = response[i].order_discount;
			            var order_coupon = response[i].order_coupon;
			            var order_type = response[i].order_type;
			            var order_use_mile = response[i].order_use_mile;
			            var order_use_mile_amount = response[i].order_use_mile_amount;
			            var order_add_mile = response[i].order_add_mile;
			            var order_add_mile_amount = response[i].order_add_mile_amount;
			            var order_is_maked = response[i].order_is_maked;
			            var order_who = response[i].order_who;
			            var order_is_togo = response[i].order_is_togo;

						let pagemin = page * 9;
						if (page == 1) {
							pagemin = 0;
						}
						if (page / 10 > 1) {
	                        startpage = Math.floor((page/10))*10
	                        endpage = Math.floor((page/10))*10 + 1 + 10
	                    }else{
	                        startpage = 1
	                        endpage = 11
	                    }
						let pagemax = pagemin + 9;
						if (i >= pagemin && i < pagemax) {
						var htmlTemplate =
									
								    '<tr>' +
								        '<td align="center">' + order_no + '</td>' +
								        '<td align="center">' + order_time + '</td>' +
								        '<td align="center">' +
								            '<div class="text-over-cut">' + order_foods + '</div>' +
								        '</td>' +
								        '<td align="center">' + order_price + '</td>' +
								        '<td align="center">' + order_discount + '</td>' +
								        '<td align="center">' +
								            '<div class="text-over-cut">' + order_coupon + '</div>' +
								        '</td>' +
								        '<td align="center">' + order_type + '</td>' +
								        '<td align="center">' + order_add_mile + '</td>' +
								        '<td align="center">' + order_is_maked + '</td>' +
								        '<td>' +
								            '<input type="button" value="수정" onclick="update(\'' + order_no + '\')">' +
								        '</td>' +
								        '<td>' +
								            '<input type="button" value="삭제" onclick="deleteOrder(\'' + order_no + '\')">' +
								        '</td>' +
								    '</tr>';
								      // HTML에 추가
	                    chatListHtml += htmlTemplate; 
							}
	                                     
	                   }
	                
	                // Update the content of the main element
	                //$('.getMenuList').html(chatListHtml);
	                document.querySelector(".getMenuList").insertAdjacentHTML("beforeend", chatListHtml)
	                
	            } else {
	/*                alert("Failed to fetch chat list.");
	*/            }
	        },
	        error: function (xhr, status, error) {
	            console.error("Ajax request failed:", status, error);
	        }
	    });
	}
	
window.addEventListener('DOMContentLoaded', function() {
    updateMenu(menuType, 1);
});


// 3. 관리자 페이지 - 거래내역 삭제
function deleteOrder(order_no, callback) {
    location.href = "./sales/ac00Delete.jsp?order_no=" + order_no;
    if (typeof callback == 'function') {
		callback();
	}
}
// 3 . 관리자 페이지 - 거래내역 수정
function deleteOrder(order_no, callback) {
    location.href = "./sales/ac00up.jsp?order_no=" + order_no;
    if (typeof callback == 'function') {
		callback();
	}
}


function sleep(sec) {
    return new Promise(resolve => setTimeout(resolve, sec * 1000));
}

async function sub() {
    window.open('', 'aaa', 'width=300,height=200,scrollbars=no,resizable=no,status=yes,menubar=no,toolbar=no,top=50,left=50');
    document.regFrm.target = 'aaa';
    document.regFrm.submit();
}
	
	

	function sub2() {
		let frm = document.regFrm; 
		let no = frm.component_no.value;
		let name = frm.component_name.value;
		let price = frm.component_price.value;
		let amount = frm.component_amount.value;
		let component_imgPath = frm.component_imgPath.value;
		fetch("<%=request.getContextPath()%>/api/admin/edit_jaego?no="+no+"&name="+name+"&price="+price+"&amount="+amount+"&imgpath="+component_imgPath, {
			method: "post"
		}).then(response => {
			response.json().then((res) => {
				if (res.result == "success") {
					alert("수정에 성공했습니다")
					loadContent('inventory/iv00.jsp');
				} else {
					alert("변경에 실패했습니다")
				}
			})
		})
	}
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("재고를 삭제합니다.");
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
	}
	//--재고 관리 페이지 수량 조절
	function count(type, num)  {   
		  // 결과를 표시할 element
		  const resultElement = document.getElementById('amount'+num);
		  const per_price = parseInt(document.getElementById('price'+num).innerText);
		  const totalElement = document.getElementById('total'+num);
		
	       
		  let price = 0; 
		  let AllPrice = 0;
		 
		  // 현재 화면에 표시된 값
		  let number = resultElement.innerText;
		  
		  
		  // 더하기/빼기
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		  }else if(type === 'minus')  {
			  number = parseInt(number) - 1;
			  
		   
		  }
		  if (number < 0) {
			  alert("갯수는 0미만일수 없습니다.")
		  } else {
			  // 결과 출력
			  resultElement.innerText = number;
			  
			   price = number * per_price;
			   allPrice = AllPrice + price;
			
			   totalElement.innerText = price+"원";
			   let alprice = 0;
			   document.getElementsByName("total").forEach((ele) => alprice = alprice + parseInt(ele.innerText.replace("원","").replace(",","")))
			  	document.getElementById("allprice").innerText="재고 총 금액 : "+alprice.toLocaleString()+" 원";
			   
				fetch("<%=request.getContextPath()%>/api/admin/set_amount?no="+num+"&amount="+number,{
					method: "post"
				}).then(response => {
					response.json().then((res) => {
						if (res.result == "success") {
						} else {
							alert("갯수 변경중 오류가 발생하였습니다.\n"+res);
						}
					})
				})
		  }
		 
	}
	




	function getFoodList(value)
	{
		const menuMap = new Map();
		value = document.getElementById("foods").value;
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
    let res = "";
    let i = 0;
    menuArray.forEach((ele) => {
			res += ele[0] + " X " + ele[1] + ", "	
	})
	
	document.regFrm.order_foods.value = res.substring(0, res.length-2)
    console.log("menuArray = " + menuArray);
    console.log("menuData = " +menuData);
	}
	

