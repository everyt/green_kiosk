function updateContent(menuType) {
	document.cookie = "menuType=" + menuType;
	console.log('Received menuType:', menuType);
    $.ajax({
        type: "POST",
        url: "./Menu/getMenuData?type="+"all",
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
                if (menuType != "component"){
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

					const pathname = "/" + window.location.pathname.split("/")[1] + "/";
					const origin = window.location.origin;
					const contextPath = origin + pathname;
						console.log('Received menu_imgPath:', menu_imgPath);

			var htmlTemplate =
				'<div class="col">' +
			    '<div class="card shadow-sm">' +
			    '<img id="menu_imgPath" src="' + menu_imgPath + '" class="bd-placeholder-img card-img-top" width="100%" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">' +
			    '<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em"><span class="menu_name" id="menu_name">' + menu_name + '</span></text></image>' +
			    '<div class="card-body">' +
			    '<p class="card-text" align="center" id="menu_content">' + menu_content + '</p>' +
			    '<div class="d-flex justify-content-between align-items-center">' +
			    '<div class="btn-group">' +
			    '<a href="javascript:void(0)" class="btn btn-sm btn-outline-secondary" onclick="openPopup(\'' + contextPath +'Menu/View.jsp?menu_no=' + menu_no + '\')">상세보기</a>' +
			    '<a href="javascript:void(0)" class="btn btn-sm btn-outline-secondary" onclick="openPopup(\'' + contextPath + 'Menu/Edit.jsp?menu_no=' + menu_no + '\')">수정하기</a>' +
			    '</div>' +
			    '<small class="text-body-secondary">' + formatNumber(menu_price) + '원</small>' +
			    '</div>' +
			    '</div>' +
			    '</div>' +
			    '</div>';

                    // HTML에 추가
                    chatListHtml += htmlTemplate;                    
                   }
                
                // Update the content of the main element
                $('.getMenuList').html(chatListHtml);
                } else {
				var chatListHtml = '';
                for (var i = 0; i < response.length; i++) {
                    // 각각의 값을 변수로 가져오기
                    var component_no = response[i].component_no;
                    var component_imgPath = response[i].component_imgPath;
                    var component_name = response[i].component_name;
                    var component_price = response[i].component_price;
                    var component_amount = response[i].component_amount;              

					const pathname = "/" + window.location.pathname.split("/")[1] + "/";
					const origin = window.location.origin;
					const contextPath = origin + pathname;
					
			var htmlTemplate =
				'<div class="col">' +
			    '<div class="card shadow-sm">' +
			    '<img id="menu_imgPath" src="' + component_imgPath + '" class="bd-placeholder-img card-img-top" width="100%" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">' +
			    '<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em"><span class="menu_name" id="menu_name">' + component_name + '</span></text></image>' +
			    '<div class="card-body">' +
			    '<p class="card-text" align="center" id="menu_content">' + '현재 수량 : ' + component_amount + '</p>' +
			    '<div class="d-flex justify-content-between align-items-center">' +
			    '<div class="btn-group">' +
			   	'<a href="javascript:void(0)" class="btn btn-sm btn-outline-secondary" onclick="openPopup(\'' + contextPath +'Menu/componentView.jsp?component_no=' + component_no + '\')">상세보기</a>' +
			    '<a href="javascript:void(0)" class="btn btn-sm btn-outline-secondary" onclick="openPopup(\'' + contextPath + 'Menu/componentEdit.jsp?component_no=' + component_no + '\')">수정하기</a>' +
			    '</div>' +
			    '<small class="text-body-secondary">' + formatNumber(component_price) + '원</small>' +
			    '</div>' +
			    '</div>' +
			    '</div>' +
			    '</div>';

                    // HTML에 추가
                    chatListHtml += htmlTemplate;                    
                   }
                
                // Update the content of the main element
                $('.getMenuList').html(chatListHtml);					
				}
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
    updateMenu(all);
});
