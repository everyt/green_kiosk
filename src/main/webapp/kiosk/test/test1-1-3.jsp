<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="menu.Menu_menu_Bean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="mMgr" class="menu.Manager_Menu"  />
<link href="style3.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet">
<script src='https://unpkg.com/micromodal/dist/micromodal.min.js'></script>

<html>

<head>
<script>
  MicroModal.init();

  const hrefTo = (type) => {
    MicroModal.show('modal-1');
  };

  const hrefTo1 = (type) => {
    MicroModal.show('modal-1-1');
    MicroModal.init(); // 모달 초기화
  };

  const hrefTo2 = (type) => {
    MicroModal.init(); // 모달 초기화
    MicroModal.show('modal-2');
  };

  const hrefTo3 = (type) => {
    MicroModal.show('modal-2-1');
    MicroModal.init(); // 모달 초기화
  };

  const back = (type) => {
    MicroModal.close('modal-1');
  };

  const back1 = (type) => {
    MicroModal.close('modal-1-1');
  };

  const back2 = (type) => {
    MicroModal.close('modal-2');
  };

  const back3 = (type) => {
    MicroModal.close('modal-2-1');
  };

  
//---------------------------------------------------------------------------------------------------------------------------------------------------------------

  // 주문 내역을 저장할 배열
  let basketArray = [];
  
//장바구니에 메뉴 추가
  const addToBasket = (menuName, price) => {
      const menuItem = {
          name: menuName,
          price: price,
          amount: 1, // 초기 수량은 1로 설정
      };

      // 이미 장바구니에 있는지 확인
      const existingItem = basketArray.find(item => item.name === menuName);

      if (existingItem) {
          // 이미 존재하는 경우 수량 증가
          existingItem.amount++;
      } else {
          // 새로운 메뉴인 경우 배열에 추가
          basketArray.push(menuItem);
      }

      // 장바구니 업데이트
      updateBasket();
  };



  
  
//장바구니 표시 업데이트
  const updateBasket = () => {
    console.log(basketArray);

    // 총 가격과 항목 수를 계산합니다
    let totalPrice = 0;
    let itemCount = 0;
	let menuNames = [];
	
    basketArray.forEach(item => {
        menuNames.push(item.name); // 메뉴 이름을 배열에 추가
      totalPrice += item.price * item.amount;
      itemCount += item.amount;
    
    });

    document.getElementById('menu').innerText = '버거 이름: ' + menuNames.join(', ');
    document.getElementById('count').innerText = '총 수량: ' + itemCount + '개';
    document.getElementById('price').innerText = '총 금액: ' + totalPrice + '원';

    const orderDetailsDiv = document.getElementById('orderDetails');

    if (orderDetailsDiv) {
      orderDetailsDiv.innerHTML = ''; // 이전 내용 초기화

      
      
      basketArray.forEach(item => {
        const orderItemDiv = document.createElement('div');
        orderItemDiv.innerHTML = `<span>${item.name}</span> | <span>${item.amount}개</span> | <span>${item.price * item.amount}원</span>`;
        orderDetailsDiv.appendChild(orderItemDiv);    
      });
    }
  };


  // 예제에서는 각 메뉴의 클릭 이벤트에 addToBasket 함수를 추가하였습니다.
	document.addEventListener('DOMContentLoaded', function () {

  // 실제로는 각 메뉴 클릭 시 해당 메뉴의 이름과 가격을 전달하여야 합니다.
  document.querySelector('.item1').addEventListener('click', () => addToBasket('데리버거', 3500));
  document.querySelector('.item2').addEventListener('click', () => addToBasket('더블 데리버거', 3500));
  document.querySelector('.item3').addEventListener('click', () => addToBasket('불고기버거', 3500));
  document.querySelector('.item4').addEventListener('click', () => addToBasket('더블 불고기버거', 3500));
  document.querySelector('.item5').addEventListener('click', () => addToBasket('치킨버거', 3500));
  document.querySelector('.item6').addEventListener('click', () => addToBasket('더블 치킨버거', 3500));
  document.querySelector('.item7').addEventListener('click', () => addToBasket('치즈버거', 3500));
  document.querySelector('.item8').addEventListener('click', () => addToBasket('더블 클래식 치즈버거', 3500));
	
  document.querySelector('.item1-1').addEventListener('click', () => openModal('포테이토', 1500));
  document.querySelector('.item2-1').addEventListener('click', () => openModal('양념감자', 2500));	
	});


  // 클릭한 햄버거 정보를 저장할 변수
  let selectedBurger = {};


  // 햄버거를 클릭했을 때 모달 창을 열고 정보를 표시하는 함수
const openModal = (burgerName, burgerPrice) => {
    selectedBurger = {
        name: burgerName,
        price: burgerPrice,
    };

    // 모달 창에 햄버거 정보 표시
    document.getElementById('modalBurgerName').innerText = selectedBurger.name;
    document.getElementById('modalBurgerPrice').innerText = selectedBurger.price;
    
    const modal1Items = document.querySelectorAll('.modal-1-item');
    modal1Items.forEach((item) => {
      item.addEventListener('click', () => {
        selectedAdditionalItem = {
          name: item.querySelector('.item-name').innerText,
          price: parseInt(item.querySelector('.item-price').innerText),
        };
        addToBasket(selectedAdditionalItem.name, selectedAdditionalItem.price);
        MicroModal.close('modal-1');
        MicroModal.show('modal-2');
        MicroModal.init(); // 모달 초기화
      });
    });

    MicroModal.close('modal-1-1');
    MicroModal.show('modal-2');
    MicroModal.init(); // 모달 초기화
  };

</script>


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

	<div class="item1" onclick="hrefTo('item1')">
		<div class="rowbox">
 			<img src="../images/hamburger0.jpg">
 				<div class="colbox">
 				  <span id="hamburger0" style="font-size:36px; margin :10px" >데리버거</span>
 				  <span id="don" style="font-size:30px; margin :10px; color:blue;" >3500~</span>
 				 </div>
		</div>
	</div>
	
	<div class="item2" onclick="hrefTo('item2')">
		<div class="rowbox">
 			<img src="../images/hamburger1.jpg" >
 				<div class="colbox">
 				  <span id="hamburger1" style="font-size:36px; margin :10px" >더블 데리버거</span>
 				  <span id="don" style="font-size:30px; margin :10px; color:blue;" >3500~</span>
 				</div>
		</div>
	</div>
	
	<div class="item3 " onclick="hrefTo('item3')">
		<div class="rowbox">
 			<img src="../images/hamburger2.jpg" >
 				<div class="colbox">
 			 	  <span id="hamburger2" style="font-size:36px; margin :10px" >불고기버거</span>
 				  <span id="don" style="font-size:30px; margin :10px; color:blue;" >3500~</span>
				</div>
		</div>
	</div>
	
	<div class="item4" onclick="hrefTo('item4')">
		<div class="rowbox">
 			<img src="../images/hamburger3.jpg" >
 				<div class="colbox">
 				  <span id="hamburger3" style="font-size:36px; margin :10px" >더블 불고기버거</span>
 				  <span id="don" style="font-size:30px; margin :10px; color:blue;" >3500~</span>
 				</div>
		</div>
	</div>
	
	<div class="item5" onclick="hrefTo('item5')">
		<div class="rowbox">
 			<img src="../images/hamburger4.jpg" >
 				<div class="colbox">
 				  <span id="hamburger4" style="font-size:36px; margin :10px" >치킨버거</span>
 				  <span id="don" style="font-size:30px; margin :10px; color:blue;" >3500~</span>

 				</div>
		</div>	
	</div>
	
	<div class="item6" onclick="hrefTo('item6')">
		<div class="rowbox">
 			<img src="../images/hamburger5.jpg" >
 				<div class="colbox">
 				  <span id="hamburger5" style="font-size:36px; margin :10px" >더블 치킨버거</span>
 				  <span id="don" style="font-size:30px; margin :10px; color:blue;" >3500~</span>

 				</div>
		</div>
	</div>
	
	<div class="item7" onclick="hrefTo('item7')">
		<div class="rowbox">
 			<img src="../images/hamburger6.jpg" >
 				<div class="colbox">
 				  <span id="hamburger6" style="font-size:36px; margin :10px" >치즈버거</span>
 				  <span id="don" style="font-size:30px; margin :10px; color:blue;" >3500~</span>

 				</div>
		</div>	
	</div>
	
	<div class="item8" onclick="hrefTo('item8')">
		<div class="rowbox">
 			<img src="../images/hamburger7.jpg" >
 				<div class="colbox">
 				  <span id="hamburger7" style="font-size:36px; margin :10px" >더블 클래식치즈버거</span>
 				  <span id="don" style="font-size:30px; margin :10px; color:blue;" >3500~</span>

 				</div>
		</div>	
	</div>


<div class= "menu">
  <div class="modal micromodal-slide" id="modal-1" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1">
      <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
        <main class="modal__content" id="modal-1-content">
				<div class= "chucheon1 color3"><h1>선택한 메뉴</h1></div>
					<div class="qqw">	ㅇㅇㅇㅇ	</div>
				<div class= "chucheon2 color3"><h1>추천 메뉴</h1></div>
					<div class="page1" onclick="hrefTo2()"><H1 style="color:black;">다 음</H1></div>		
					<div class="page3" onclick="back()"><H1 style="color:black;">닫 기</H1></div>		
				

 <!-- 포테이토 메뉴 아이템 -->
	<div class="item1-1 modal-1-item" onclick="hrefTo1('item1-1')">
      <div class="rowbox">
        <img src="../images/potato.jpg" >
        <div class="colbox">
          <h1>포테이토</h1>
          <h2 style="color:blue;" >3500~</h2>
        </div>
      </div>
    </div>

	<div class="item2-1 modal-1-item" onclick="hrefTo1('item2-1')">
      <div class="rowbox">
        <img src="../images/potato1.jpg" >
        <div class="colbox">
          <h1>양념 감자</h1>
          <h2 style="color:blue;" >3500~</h2>
        </div>
      </div>
    </div>
	
	<div class="item3-1">
		<div class="rowbox">
 			<img src="../images/potato2.jpg" >
 				<div class="colbox">
 				     <H1>포테이토(L)</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item4-1">
		<div class="rowbox">
 			<img src="../images/cheese.jpg" >
 				<div class="colbox">
 				     <H1>치즈 스틱</H1>
 				 	 <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item5-1">
		<div class="rowbox">
 			<img src="../images/cheese2.jpg" >
 				<div class="colbox">
 				     <H1>치즈 볼</H1>
 				  	<h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>
	
	<div class="item6-1">
		<div class="rowbox">
 			<img src="../images/chicken.jpg" >
 				<div class="colbox">
 				     <H1>치킨 너겟</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item7-1">
		<div class="rowbox">
 			<img src="../images/ojingeo.jpg" >
 				<div class="colbox">
 				     <H1>오징어 링</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>
	
	<div class="item8-1">
		<div class="rowbox">
 			<img src="../images/potato3.jpg" >
 				<div class="colbox">
 				     <H1>웨지 <br>포테이토</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>

        </main>
      </div>
    </div>
  </div>
</div>



  <div class="modal micromodal-slide" id="modal-1-1" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1">
      <div class="modal__container1" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
        <main class="modal__content2" id="modal-2-content">
				<div class="potato"><h1 style="background-color:#b4fffb">맛을 선택하세요.</h1></div>
		        <div class="potato1" ><h1>어니언</h1></div>
		        <div class="potato2" ><h1>치즈</h1></div>
		        <div class="potato3" ><h1>칠리</h1></div>
				<div class="page5" id="close_btn" onclick="back1()"><H1 style="color:black;">닫 기</H1></div>		
				
		</main>
	  </div>
	</div>
  </div>











<!-- 음료수 modal -->

<div class= "menu">
  <div class="modal micromodal-slide" id="modal-2" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1">
      <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
        <main class="modal__content" id="modal-1-content">
				<div class= "chucheon1 color3"><h1>선택한 메뉴</h1></div>
					<div class="qqw">	ㅇㅇㅇㅇ	</div>
				<div class= "chucheon2 color3"><h1>추천 메뉴</h1></div>

	<div class="item1-2 ">
		<div class="rowbox">
			<img src="../images/cola.jpg" >
				<div class="colbox">
				  <H1>데리버거</H1>
				  <h2 style="color:blue;" >3500~</h2>
				</div>
		</div>
	</div>
	
	<div class="item2-2">
		<div class="rowbox">
 			<img src="../images/cola1.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item3-2">
		<div class="rowbox">
 			<img src="../images/saida.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item4-2">
		<div class="rowbox">
 			<img src="../images/saida1.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 				 	 <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item5-2">
		<div class="rowbox">
 			<img src="../images/milkiseu.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 				  	<h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>
	
	<div class="item6-2">
		<div class="rowbox">
 			<img src="../images/mauntindyu.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item7-2">
		<div class="rowbox">
 			<img src="../images/fanta.jpg" >
 				<div class="colbox" onclick="hrefTo1()">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>
	
	<div class="item8-2">
		<div class="rowbox">
 			<img src="../images/orange juice.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>

        </main>
      </div>
    </div>
  </div>
</div>


	<div class="order" id="totalOrder" style="width: inherit; font-weight: 400; font-size: 1.2rem; border-radius: 0; justify-content: space-between; background-color: #eee;">
			 	<div >
	  			<span style="font-size:36px; font-weight: 600; color:black;margin :10px">총주문내역</span>
			 	</div>
			  	<div class="menu" >
			  	<span class="Ordermenu" id="menu" style="font-size:36px; font-weight: 600; color:black;margin :10px"></span>
			    </div>
			 
			  	<div class="count" >
			  	<span class="count" id="count" style="font-size:36px; font-weight: 600; color:black;margin :10px"></span>  
			    </div>
			  	
			  	<div class="price" >
			  	<span id="price" style="font-size:36px; font-weight: 600; color:black;margin :10px"></span>
				</div>
	</div>
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

    
</script>






</body>
</html>
