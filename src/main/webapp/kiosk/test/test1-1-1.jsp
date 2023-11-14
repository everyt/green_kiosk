<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="menu.Menu_menu_Bean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="mMgr" class="menu.Manager_Menu"  />
<link href="style3.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet">
<link rel='stylesheet' href='../../assets/css/micromodal.css' />
<script src='https://unpkg.com/micromodal/dist/micromodal.min.js'></script>

<html>

<head>

</head>
<body>
<div class="container">

	 <div class="head color1" align="center">	<h1>KIOSK</h1> <br>
	 </div>
	 <div class="main color2" align="center">	
	 	<div class="page "onclick="jumoon0()" ><h2>단 품</h2></div>
	 	<div class="page "onclick="jumoon1()" ><h2>세 트</h2></div>
	 	<div class="page "onclick="jumoon2()" ><h2>음 료 수</h2></div>
	 	<div class="page "onclick="jumoon3()" ><h2>사 이 드</h2></div>
	 </div>

	<div class="item1 "onclick="hrefTo()">
		<div class="rowbox">
 			<img src="../images/hamburger0.jpg" >
 				<div class="colbox">
 				  <H1>데리버거</H1>
 				  <h2 style="color:blue;" >3500~</h2>
 				 </div>
		</div>
	</div>
	
	<div class="item2" onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger1.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item3 " onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger2.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item4" onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger3.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 				 	 <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item5" onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger4.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 				  	<h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>
	
	<div class="item6" onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger5.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item7" onclick="btn-open-popup()">
		<div class="rowbox">
 			<img src="../images/hamburger6.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>
	
	<div class="item8" onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger7.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>



<div class= "menu">
  <div class="modal micromodal-slide" id="modal-1" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1">
      <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
        <main class="modal__content" id="modal-1-content">
				<div class= "chucheon color3"><h1>선택한 메뉴</h1></div>
					<div>	ㅇㅇㅇㅇ	</div>
				<div class= "chucheon color3"><h1>추천 메뉴</h1></div>
						<div class="item1 ">
							<div class="rowbox">
					 			<img src="../images/cola.jpg" >
					 				<div class="colbox">
					 				  <H1>데리버거</H1>
					 				  <h2 style="color:blue;" >3500~</h2>
					 				</div>
							</div>
						</div>
	
	<div class="item2">
		<div class="rowbox">
 			<img src="../images/cola1.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item3">
		<div class="rowbox">
 			<img src="../images/saida.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item4">
		<div class="rowbox">
 			<img src="../images/saida1.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 				 	 <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item5">
		<div class="rowbox">
 			<img src="../images/milkiseu.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 				  	<h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>
	
	<div class="item6">
		<div class="rowbox">
 			<img src="../images/mauntindyu.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item7">
		<div class="rowbox">
 			<img src="../images/fanta.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>
	
	<div class="item8">
		<div class="rowbox">
 			<img src="../images/orange juice.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>










          </p>
        </main>
      </div>
    </div>
  </div>
</div>


    <button class="btn-open-popup">Modal 띄우기</button>
	
  <div class="header" style="width: inherit; font-weight: 400; font-size: 1.2rem; border-radius: 0; justify-content: space-between; background-color: #eee;">
    <span style="color:black;">총주문내역</span>
    <span id="count" style="font-size:1.2rem; font-weight: 600; color:black;"></span>
    <span id="price" style="font-size:1.2rem; font-weight: 600; color:red;"></span>
  </div>
		


<%
	Vector<Menu_menu_Bean> vector = mMgr.getMenuList(1);
	
	int menuLength = vector.size();

	if (vector.isEmpty()){
		out.println("등록된 메뉴가 없습니다.");
	} else {
		for (int i = 0; i < menuLength; i++) {
			Menu_menu_Bean bean = vector.get(i);
			
%>

<%
		}
	}

%>








<script>
//document.querySelector(".modal micromodal-slide").style.display = 'none';
//document.querySelector(".modal micromodal-slide").style.display = 'inline-block';

	MicroModal.init();

function modal() {
	

    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.btn-open-popup');

    btnOpenPopup.addEventListener('click', () => {
      modal.style.display = 'block';
    });
	
}	
	
MicroModal.init();

	const back = () => {
	  localStorage.setItem('mobile', false);
	  location.href = 'main.jsp';
	}
	const hrefTo = (type) => {
	  localStorage.setItem('paymentType', type);
	  MicroModal.show('modal-1');
	  setTimeout(() => {
	  }, 2500)
}	
	
//-------------------------------------------------------------------------------------------------------------------------------------
  const inputDigits = (num) => { // 숫자 3자리로 끊어서 쉼표(,) 넣어서 문자열로 리턴해주는 함수
	  const str = num.toString();
	  const length = str.length;
	  let result = [];
	  let j = 0;

	  for (let k = length - 1; k >= 0; k--) {
	    j++;
	    result.push(str[k]);
	    if (j % 3 === 0 && k !== 0) result.push(',');
	  }

	  return result.reverse().join('');
	};
	
let basketArray = null; // 장바구니 변수 생성
if (sessionStorage.getItem('basketArray')) { // 세션스토리지에 장바구니가 있으면
	basketArray = JSON.parse(sessionStorage.getItem('basketArray')); // 세션스토리지에서 장바구니를 불러온다
} else {
	basketArray = [{
	    index: 0,
	    name: '치즈버거',
	    price: 3000,
	    amount: 5,
	  }]
}

  const drawArrayToHTMLElement = (element, arr, drawCallback) => { // HTML을 그리는 함수를 핸들링하는 함수
    if (arr == null) {        // 배열이 비어 있으면
      element.innerHTML = ''; // HTML도 비운다
    } else {                  // 배열이 차 있으면
      let html = drawCallback(arr); // HTML을 그리는 콜백함수를 실행한다
    
      element.innerHTML = html;     // HTML을 DOM에 삽입한다
    }
  };

  const deleteBasketItem = (startIndex, index) => { // 장바구니에서 아이템 삭제
    basketArray.splice(index, 1); // 장바구니 변수에서 아이템을 인덱스로 제거
    sessionStorage.setItem('basketArray', JSON.stringify(state.foods)); // 세션스토리지에 저장
    generateBasketPageHTML(state.foods, page); // 다시 그리는 함수
  }

  const generateBasketPageHTML = (arr, startIndex = 0) => { // HTML 실시간 생성 함수
    let html = '';

    for (let i = startIndex; i < startIndex + 5; i++) { // 시작 인덱스부터 5개까지 출력
      html += `<div class='basket' style='border-bottom: 0px;'>`;
      html += `<span style='width: 30%;'>` + (i < arr.length ? arr[i].name : '&nbsp;') + `</span>`;  //이름
      html += `<span style='width: 10%;'>` + (i < arr.length ? arr[i].amount : '&nbsp;') + `</span>`;//양
      // 여기에 양 조절할 수 있는 카운터 버튼 추가 (arr[i].amount)을 수정하는.
      html += `<span style='width: 20%;'>` + (i < arr.length ? arr[i].price : '&nbsp;') + `</span>`; //가격
      if (i < arr.length) {
        html += `<div 'width: 16%;' onClick='deleteBasketItem(`// 필요한 함수로 변경. 토핑추가하는 함수
        + startIndex + ',' + i                                 // 인자도 변경
        + `)'><div class='rowbox delete-button'><p class='delete-text'>토핑추가</p></div></div>`
      html += `<div 'width: 8%;' onClick='deleteBasketItem(` // 필요한 함수로 변경. 메뉴 변경하는 함수
      + startIndex + ',' + i                                 // 인자도 변경
      + `)'><div class='rowbox delete-button'><p class='delete-text'>변경</p></div></div>`
      html += `<div 'width: 8%;' onClick='deleteBasketItem(`
      + startIndex + ',' + i
      + `)'><div class='rowbox delete-button'><p class='delete-text'>삭제</p></div></div>`
      } else {
          html += `<span style='width: 30%;'>'&nbsp;'</span>`;
      }
      html += `</div>`;
    }

    return html;
  };
  
(() => { // 즉시실행함수 (검색)
	drawArrayToHTMLElement(
		document.querySelector('#basket'),
		basketArray,
		generateBasketPageHTML
	); // drawArrayToHTMLElement함수는 이런 꼴로 실행되어야 함
	
	let count = 0;
  let price = 0;
  
	if (basketArray !== null) {
	      count = basketArray.reduce((arr, cur) => { // 배열 누산
      return arr + cur.amount;
    }, 0)
    price = basketArray.reduce((arr, cur) => { // 배열 누산
      return arr + cur.amount * cur.price;
    }, 0)
	}
	
  document.querySelector('#count').innerHTML = `<span style="margin-right:0.8rem">` // DOM HTML 변경
  + count
  + `</span style="font-size:1.05rem"><span>개</span>`;
  
  document.querySelector('#price').innerHTML = `<span>` // DOM HTML 변경
  + inputDigits(price)
  + `</span>`;
})();

	
</script>

</body>
</html>
