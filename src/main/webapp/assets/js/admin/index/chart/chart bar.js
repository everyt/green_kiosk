
/*function barChart(){
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

*/
function barChart2() {

const dateValues = priceSumDate.map(date => new Date(date).getDate());

  const ctx = document.getElementById('myChart2');
  new Chart(ctx, {
    type: 'line',
    data: {
      labels: ['일요일' ,'월요일' , '화요일', '수요일', '목요일' , '금요일' , '토요일'],
      datasets: [{
        label: '요일별 매출 (단위 : 원)',
        data: priceweekily,
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



function barChart3() {
	
	 const existingChart = Chart.getChart('myChart3');
    if (existingChart) {
        existingChart.destroy();
    }
    
  const entriesArray = Array.from(menuAmountMap.entries());
  const menuData2 = entriesArray.map(([name, amount]) => ({ name, amount }));
  menuData2.sort((a, b) => b.amount - a.amount);
  const top20MenuData = menuData2.slice(0, 20);

  const ctx = document.getElementById('myChart3').getContext('2d');
  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: top20MenuData.map(item => item.name),
      datasets: [{
        label: '판매량',
        data: top20MenuData.map(item => item.amount),
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
          text: "당월 메뉴별 판매량(상위 20개)"
        }
      }
    }
  });
}





function barChart4() {
    const existingChart = Chart.getChart('myChart4');
    if (existingChart) {
        existingChart.destroy();
    }

  const entriesTermArray = Array.from(menuAmountTermMap.entries());
  const menuTermData = entriesTermArray.map(([name, amount]) => ({ name, amount }));
  menuTermData.sort((a, b) => b.amount - a.amount);
  const top20MenuTermData = menuTermData.slice(0, 20);
  console.log("entriesTermArray : " + entriesTermArray);
	console.log(top20MenuTermData.map(item => item.name));
		console.log(top20MenuTermData.map(item => item.amount));

    const ctx = document.getElementById('myChart4').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: top20MenuTermData.map(item => item.name),
            datasets: [{
                label: '판매량',
                data: top20MenuTermData.map(item => item.amount),
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
                    text: `선택한 기간의 메뉴별 판매량`
                }
            }
        }
    });
}









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


window.addEventListener('DOMContentLoaded', function() {
     //barChart();
});
