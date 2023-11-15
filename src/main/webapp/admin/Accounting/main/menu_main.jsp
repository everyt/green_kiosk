<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/layouts/BeanManager.jsp" %>


<main>
  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">매장 관리 페이지</h1>
        <p class="lead text-body-secondary"></p>
        <p>
          <a href="javascript:void(0)" class="btn btn-primary my-2" onClick="loadContent('sales/ac00.jsp');updateMenu('all')">거래 내역 페이지</a>
          <a href="javascript:void(0)" class="btn btn-primary my-2" onClick="loadContent('inventory/iv00.jsp')">재고 관리 페이지</a>
          <!-- <a href="#" class="btn btn-secondary my-2"></a> -->
        </p>
      </div>
    </div>
  </section>

  <div class="album py-5 bg-body-tertiary">
    
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      <%
      	int menu_no = 0;
		String menu_imgPath = null;
		String menu_name = null;
		String menu_gubn = null;
		int menu_price = 0;
		String menu_content = null;
		int menu_isUse = 0;
		int menu_isSale = 0;
		int count = 0;
		int menu_amount = 0;
	
		
		Vector<Menu_component_Bean> vlist = menuMgr.getComponenctlist();
		int vlistsize = vlist.size();
		
		for (Menu_component_Bean bean : vlist) {
			menu_no = bean.getComponent_no();
			menu_name = bean.getComponent_name();
			menu_price = bean.getComponent_price();
			menu_imgPath = bean.getComponent_imgPath();
			menu_amount = bean.getComponent_amount();
			count++;
		
      %>
        <div class="col">
          <div class="card shadow-sm">
            <img src="/downloadfile2/<%=menu_imgPath%>"class="bd-placeholder-img card-img-top" width="100%" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
            <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em"><span class="menu_name"><%=menu_name%></span></text></image>
            <div class="card-body">
              <p class="card-text" align="center"><%=menu_content%></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="javascript:void(0)" class="btn btn-sm btn-outline-secondary" onclick="openPopup('<%=request.getContextPath()%>/admin/Menu/View.jsp?menu_no=<%=menu_no%>')">상세보기</a>
                  <a href="javascript:void(0)" class="btn btn-sm btn-outline-secondary" onclick="openPopup('<%=request.getContextPath()%>/admin/Menu/Edit.jsp?menu_no=<%=menu_no%>')">수정하기</a>
                </div>
                <%
                	String menu_price1 = formatNumber(menu_price);
                %>
                <small class="text-body-secondary"><%=menu_price1%>원</small>
              </div>
            </div>
          </div>
        </div>
        
        <% } %>
<!-- not repeat div -->
      </div>
    </div>
  </div>

</main>

<footer class="text-body-secondary py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1">Album example is © Bootstrap, but please download and customize it for yourself!</p>
    <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="/docs/5.3/getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>

    
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	<%!
    public String formatNumber(double number) {
        // 숫자를 3자리마다 쉼표로 구분
        java.text.DecimalFormat df = new java.text.DecimalFormat("#,###");
        return df.format(number);
    }
	
	public String formatTime(Long number) {
		java.text.DecimalFormat df = new java.text.DecimalFormat("#,###");
		return df.format(number);
	}
%>
window.addEventListener('DOMContentLoaded', function() {
sleep(1)
    updateMenu("all");
});
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
</script>
<script>

function openPopup(url) {
	  // 팝업 창을 엽니다.
	  // 'url'은 열고자 하는 페이지의 URL입니다.
	  var popupWidth = 800;
	  var popupHeight = 600;
	  var popupX = (window.screen.width/2) - (popupWidth/2);
	  var popupY = (window.screen.height/2) - (popupHeight/2);
	  var popup = window.open(url, 'PopupWindow', 'width=popupWidth, height=popupHeight, scrollbars=yes, left=popupX, top=popupY');

<%-- 	  // 팝업이 닫힐 때 이벤트를 감지하여 부모 창의 loadContent 함수를 호출하여 menu_main.jsp를 새로고침합니다.
	  var interval = setInterval(function() {
	    if (popup.closed) {
	      clearInterval(interval);
	      loadContent('<%=request.getContextPath()%>/admin/layouts/menu_main.jsp');
	    }
	  }, 100);
	   --%>
	}

	//팝업창을 닫습니다.
function closePopup(popup) {
	  if (popup && !popup.closed) {
	    popup.close();
	  }
	}
</script>
<script>
   //---- 재고 수정.
	function iv02(numb){        
		document.readFrm.numb.value=numb;
		document.readFrm.action="iv02.jsp";
		document.readFrm.target="content";
		document.readFrm.submit();
	}
	
	function updateMenu(menuType) {
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

	function deleteOrder(order_no)
	{
		location.href = "./sales/ac00Delete.jsp?order_no=" + order_no; 
	}
   
	function sleep(sec) {
		  return new Promise(resolve => setTimeout(resolve, sec * 1000));
	}
	
	async function sub() {
		window.open('', 'aaa','width=300,height=200,scrollbars=no,resizable=no,status=yes,menubar=no,toolbar=no,top=50,left=50');
		document.regFrm.target = 'aaa'
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
	
	
	
</script>
	


