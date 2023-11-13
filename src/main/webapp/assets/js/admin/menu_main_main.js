
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

