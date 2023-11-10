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

</script>
</html>

