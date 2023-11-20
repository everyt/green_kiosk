let totalAmountByNameCookie = getCookieValue("totalAmountByName");
let totalAmountByNameCookieObject = JSON.parse(totalAmountByNameCookie);
let menu_name = Object.keys(totalAmountByNameCookieObject);
let menu_amount = Object.values(totalAmountByNameCookieObject);
	
function barChart(){
	const menuData = menu_name.map((name, index) => ({name, amount : menu_amount[index]}));
	menuData.sort((a, b) => b.amount - a.amount); //오름 차순 정렬
	  const top10MenuData = menuData.slice(0, 10); // 상위 10개 아이템만 선택
  const ctx = document.getElementById('myChart');
  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: top10MenuData.map(item => item.name),
      datasets: [{
       label:  '판매량',
        data: top10MenuData.map(item => item.amount),
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      },
      responsive : true,
      plugins : {
		  title : {
			  display : true,
			  text : "당일 메뉴별 판매량(상위 10개)",
		  }
	  }
    }
  });
}  


function barChart2() {

const dateValues = priceSumDate.map(date => new Date(date).getDate());
console.log(priceSumDate);
  const ctx = document.getElementById('myChart2');
  new Chart(ctx, {
    type: 'line',
    data: {
      labels: ['일요일' ,'월요일' , '화요일', '수요일', '목요일' , '금요일' , '토요일'],
      datasets: [{
        label: '요일별 매출 (단위 : 원)',
        data: priceSumdaily,
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      },
      responsive: true,
      plugins: {
        title: {
          display: true,
          text: '요일별 매출 (일주일)',
        },
        datalabels: {
			formatter: function(dateValues, ctx) {
				 return dateValues[ctx.dataIndex];
			}
		},
      }
    }
  });
}


function barChart3(){
	const menuData = menu_name.map((name, index) => ({name, amount : menu_amount[index]}));
	menuData.sort((a, b) => b.amount - a.amount); //오름 차순 정렬
	  const top10MenuData = menuData.slice(0, 20); // 상위 20개 아이템만 선택
  const ctx = document.getElementById('myChart');
  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: top10MenuData.map(item => item.name),
      datasets: [{
       label:  '판매량',
        data: top10MenuData.map(item => item.amount),
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      },
      responsive : true,
      plugins : {
		  title : {
			  display : true,
			  text : "당월 메뉴별 판매량(상위 20개)",
		  }
	  }
    }
  });
}  
window.addEventListener('DOMContentLoaded', function () {
  barChart();
  barChart2();
  
});


function getCookieValue(cookieName) {
	const name = cookieName + "=";
	const decodedCookie = decodeURIComponent(document.cookie);
	const cookieArray = decodedCookie.split(';');
		
	for (let i = 0; i < cookieArray.length; i++) {
		let cookie = cookieArray[i].trim();
		if (cookie.indexOf(name) === 0) {
			return cookie.substring(name.length, cookie.length);
		}
	}
	return "";
}

function cookieSeparate(cookieObject) {
  const labels = Array.from(cookieObject.keys());
  const data = Array.from(cookieObject.values());


  return {
    labels: labels,
    data: data,
    label: '# of Votes'
  };
}

