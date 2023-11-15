var menuType = "all";

function updateMenu(menuType) {
	console.log('Received menuType:', menuType);
    $.ajax({
        type: "POST",
		url: "./admin/getAccountData?type="+"all",
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
							            '<input type="button" value="수정">' +
							        '</td>' +
							        '<td>' +
							            '<input type="button" value="삭제" onclick="deleteOrder(\'' + order_no + '\')">' +
							        '</td>' +
							    '</tr>';

                    // HTML에 추가
                    chatListHtml += htmlTemplate;                    
                   }
                
                // Update the content of the main element
                $('.getMenuList').html(chatListHtml);
                
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
    updateMenu(menuType);
});


function formatNumber(number) {
    // 숫자를 3자리마다 쉼표로 구분
    var df = new Intl.NumberFormat('ko-KR');
    return df.format(number);
}


/*function loadContent(url) {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
      // Ajax 요청이 완료되고 페이지를 가져온 경우 메인 페이지를 업데이트
      document.getElementById('mainContent').innerHTML = xhr.responseText;
      // 맨 상단으로 가도록
      window.scrollTo(0, 0);
    }
  };
  xhr.open('GET', url, true);
  xhr.send();
}*/

/*
var auto_refresh = setInterval(
function ()
{
$('#mainContent').load('menu_main.jsp').fadeIn("slow");
}, 500); 

	var auto_refresh = setInterval(function () {
	  $('#mainContent').load('<%=request.getContextPath()%>/admin/layouts/menu_main.jsp').fadeIn("slow");
	}, 500);
	
	function loadContent(url) {
	  var xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      document.getElementById('mainContent').innerHTML = xhr.responseText;
	      window.scrollTo(0, 0);
	    }
	  };
	  xhr.open('GET', url, true);
	  xhr.send();
	}
	
	function openPopup(url) {
	  var popupWidth = 500;
	  var popupHeight = 300;
	  var popupX = (window.screen.width/2) - (popupWidth/2);
	  var popupY = (window.screen.height/2) - (popupHeight/2);
	  var popup = window.open(url, 'PopupWindow', 'width=popupWidth, height=popupHeight, scrollbars=yes, left=popupX, top=popupY');
	}
	
	function closePopup(popup) {
	  if (popup && !popup.closed) {
	    popup.close();
	  }
	}*/
	
	
function openPopup(url) {
  var popupWidth = 500;
  var popupHeight = 300;
  var popupX = (window.screen.width/2) - (popupWidth/2);
  var popupY = (window.screen.height/2) - (popupHeight/2);
  var popup = window.open(url, 'PopupWindow', 'width=popupWidth, height=popupHeight, scrollbars=yes, left=popupX, top=popupY');
}


