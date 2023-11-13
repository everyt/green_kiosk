
setInterval(function() {
    updateMenu();
}, 1000);

function updateMenu() {
	var type = "all";
    $.ajax({
        type: "POST",
        url: "./getMenuData",
        data: {
        	type: type
        },
        dataType: "json",
        contentType: "application/json; charset=UTF-8", 
        success: function (response) {
            if (response && response.length > 0) {
                // 받아온 채팅 목록을 활용하여 필요한 작업 수행
                console.log(response);
                
                // 예시: 받아온 목록을 HTML로 만들어 어딘가에 추가
                var chatListHtml = '';
                for (var i = 0; i < response.length; i++) {
                    // 각각의 값을 변수로 가져오기
					var menu_no = response[i].menu_no;
					var menu_imgPath = response[i].menu_imgPath;
					var menu_name = response[i].menu_name;
					var menu_gubn = response[i].menu_gubn;
					var menu_price = response[i].menu_price;
					var menu_content = response[i].menu_content;
					var menu_isUse = response[i].menu_isUse;
					var menu_isSale = response[i].menu_isSale;

                    // HTML에 추가
                    chatListHtml += '<div>' + menu_no + ': ' + menu_name + '</div>' ;
                }
                
                // Update the content of the main element
                $('#getMenuList').html(chatListHtml);
            } else {
                alert("Failed to fetch chat list.");
            }
        },
        error: function (xhr, status, error) {
            console.error("Ajax request failed:", status, error);
        }
    });
}


function loadContent(url) {
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
}


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

