var menuType = "all";

function updateMenu(menuType) {
	document.cookie = "menuType=" + menuType;
	console.log('Received menuType:', menuType);
    $.ajax({
        type: "POST",
        url: "./index/getMenuData?type="+menuType,
        dataType: "json",
        data: {
        	type : menuType
        },
        contentType: "application/json; charset=UTF-8", 
success: function (response) {
    if (response && response.length > 0) {
        var foodCount = {};
        var priceSum = 0;
        var chatListHtml = '';

        for (var i = 0; i < response.length; i++) {
            var order_foods = response[i].order_foods;
            
            for (var j = 0; j < order_foods.length; j++) {
                var foodItem = order_foods[j];

                if (foodItem) {
                    var foodName = foodItem.name;
                    var foodAmount = parseInt(foodItem.amount);

                    if (foodCount[foodName]) {
                        foodCount[foodName] += foodAmount;
                    } else {
                        foodCount[foodName] = foodAmount;
                    }
                }
            }

            var order_price = response[i].order_price;
            priceSum += order_price;
        }

        var htmlTemplate =
            '<div class="col-xl-3 col-md-6 mb-4">' +
            '<div class="card border-left-warning shadow h-100 py-2">' +
            '<div class="card-body">' +
            '<div class="row no-gutters align-items-center">' +
            '<div class="col mr-2">' +
            '<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">' +
            priceSum.toFixed(2) + '</div>' +
            '<div class="h5 mb-0 font-weight-bold text-gray-800"></div>' +
            '</div>' +
            '<div class="col-auto">' +
            '<i class="fas fa-comments fa-2x text-gray-300"></i>' +
            '</div>' +
            '</div>' +
            '</div>' +
            '</div>' +
            '</div>';

        chatListHtml += htmlTemplate;

        $('.getMenuList').html(chatListHtml);

    } else {
        console.error("No data received or data is empty.");
    }
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


