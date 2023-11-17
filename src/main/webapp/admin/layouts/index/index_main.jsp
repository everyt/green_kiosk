<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/admin/index/index_main.js"></script>

<script>
const foods = new Map();
</script>
<%@ include file ="/admin/layouts/index/index_parsing.jsp" %>
<script>
foods.set("data_value", '<%=values.toString()%>')
foods.set("data_key", '<%=keys.toString() %>')
const keys = JSON.parse(foods.get("data_key"))
const values = JSON.parse(foods.get("data_value"))

let foods_list = new Array();
let foods_map = new Map();
let i = 0
keys.forEach((entry) => {
	
	if (entry === "index" && i != 0) {
		foods_list.unshift(foods_map);
		foods_map = new Map();
	}
	foods_map.set(entry, values[i])
	i = i + 1
})


let totalAmountByName = new Map();

foods_list.forEach(foods_map => {

    for (const [key, value] of foods_map.entries()) {
        if (key === "name") {

            let name = value;

            let amount = parseInt(foods_map.get("amount"));

            if (totalAmountByName.has(name)) {
                totalAmountByName.set(name, totalAmountByName.get(name) + amount);
            } else {
                totalAmountByName.set(name, amount);
            }
        }
    }
});

let totalAmountByNameObject = {};
totalAmountByName.forEach((value , key) => {
	totalAmountByNameObject[key] = value;
});

let totalAmountByNameJSON = JSON.stringify(totalAmountByNameObject);
document.cookie = "totalAmountByName=" + totalAmountByNameJSON;
// 결과 출력
console.log("Total Amount by Name:", totalAmountByName);

</script>
<main class="mainContent">
  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">차트 페이지</h1>
        <p class="lead text-body-secondary"></p>

      </div>
    </div>
  </section>

  <div class="album py-5 bg-body-tertiary">    
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 getMenuList">

<!-- not repeat div -->
      </div>
      
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/admin/index/chart/chart bar.js"></script>      
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<div>
<canvas id="myChart" style="display: block; box-sizing: border-box; height: 300px; width: 1200px;" width="1200"></canvas>
</div>

<div>
<canvas id="myChart2"  style="display: block; box-sizing: border-box; height: 232px; width: 696px;" width="696"></canvas>
</div>


  
                        
    </div>
  </div>
</main>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js"></script>


