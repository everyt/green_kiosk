<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자(메뉴)</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/admin/Accounting/account.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/admin/menu.css">
<%@ include file="/admin/layouts/indexBase.jsp" %>
<%@ include file="/admin/layouts/bootstrap.jsp"%> 
<%@ include file="/admin/admin_check/check.jsp" %>
<%@ include file="/admin/layouts/header.jsp" %>

</head>
<body>
<%@ include file="/admin/layouts/left.jsp" %>
<main class="mainContent" id="mainContent">
</main>

</body>
<script>
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
}

<%-- 	function sub2() {
	  let formData = new FormData();
/* 	  formData.append("menu_no", document.getElementById("menu_no").value);
 */	  formData.append("menu_name", document.getElementById("menu_name").value);
/* /* 	  formData.append("menu_gubn", document.getElementById("menu_gubn").value);
 */ */	  formData.append("menu_price", document.getElementById("menu_price").innerHTML);
	  formData.append("menu_content", document.getElementById("menu_content").innerHTML);
/* 	  formData.append("menu_imgPath", document.getElementById("menu_imgPath").value);
	  formData.append("menu_isUse", document.getElementById("menu_isUse").value);
	  formData.append("menu_isSale", document.getElementById("menu_isSale").value); */

	  
	  fetch("<%=request.getContextPath()%>/api/admin/edit_menu", {
		    method: "POST",
		    body: formData
		  }).then(response => {
		    if (response.ok) {
		      return response.json();
		    } else {
		      throw new Error('Network response was not ok.');
		    }
		  }).then(res => {
		    if (res.result == "success") {
		      // 성공적으로 업데이트되었을 때, 화면을 다시 불러옵니다.
		      loadContent('<%=request.getContextPath()%>/admin/layouts/menu_main.jsp');
		    } else {
		      console.error("Update failed.");
		    }
		  }).catch(error => {
		    console.error('There has been a problem with your fetch operation:', error);
		  });
		} --%>
</script>
</html>

