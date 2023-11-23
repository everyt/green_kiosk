<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="user.Member_Mgr" %>
<%@ page import="user.Member_Bean" %>
<%@ page import="coupon.Coupon_kind_Bean" %>
<%@ page import="coupon.Coupon_kind_Mgr" %>
<%@ page import="coupon.Coupon_Bean" %>
<%@ page import="coupon.Coupon_Mgr" %>
<%
	String cPath = request.getContextPath();

	Object mem_id = session.getAttribute("mem_id");
	Member_Mgr u_mgr = new Member_Mgr();
	Member_Bean bean = null;
	String mem_ac = "user";
	if (mem_id != null) {
		bean = u_mgr.getMember(String.valueOf(mem_id));
		mem_ac = bean.getMem_ac();
	}
	
	Coupon_kind_Mgr c_k_mgr = new Coupon_kind_Mgr();
	Coupon_Mgr c_mgr = new Coupon_Mgr();
	
	int maxsize = 0;
	int printable_count = 0;
	int user_coupon_count = 0;
	
	Vector<Coupon_Bean> user_coupons = c_mgr.getUserCoupon(String.valueOf(mem_id));
	Vector<Coupon_kind_Bean> printable_coupons = c_k_mgr.get_printable(String.valueOf(mem_id));
	
	printable_count = printable_coupons.size();
	user_coupon_count = user_coupons.size();
	
	if (printable_count >= user_coupon_count) {
		maxsize = printable_count;
	} else {
		maxsize = user_coupon_count;
	}
%>
<html>
<head>
<title>W3.CSS Templatee</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="<%=cPath %>/assets/css/reset.css">
<link rel="stylesheet" href="<%=cPath %>/assets/css/index.css">
<script src="<%=cPath %>/assets/js/index.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
.w3-bar-block .w3-bar-item {padding:20px}
</style>
</head>
<script>
//회원가입 창 여는 함수
function open_register() {
	let url = "<%=cPath %>/register/register.jsp"
	window.open(url, "회원가입", "width=460, height=600")
}
</script>
<body>
<!-- Sidebar (hidden by default) -->
<%@ include file="/index/base/sidebar.jsp"%>
<!-- Top menu -->
<%@ include file="/index/base/head.jsp" %>
  
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1300px;margin-top:100px">
	<div class="coupon_title">
		<span style="transform: translate(120%, -110%); position: absolute; font-weight: 900">발급 가능한 쿠폰 ( <%=printable_count %> 개 )</span>
		<span style="transform: translate(525%, -110%); position: absolute; font-weight: 900">사용 가능한 쿠폰 ( <%=user_coupon_count %> 개 )</span>
	</div>
	<div class="coupon_tables" style="display:flex">
		<table border="1" style="width:40%">
			<tr style="background-color: powderblue">
				<th>쿠폰명</th>
				<th width="20%">유효기간</th>
				<th width="20%">발급하기</th>
			</tr>
	<%
		for (Coupon_kind_Bean printable_coupon : printable_coupons) {
			%>
				<tr style="background-color: powderblue" height="12.5%">
					<td height="12.5%" align="center"><%=printable_coupon.getName() %></td>
					<%
						String s_vaild = "";
						int vaild_date = printable_coupon.getVaild_date();
						if (vaild_date == -1) {
							%>
								<td align="center">무제한</td>
								<td align="center">발급하기</td>
							<%
						} else {
							s_vaild = vaild_date + " 일";
						}//if
						
						if (vaild_date == 0) {
							%>
								<td align="center" style="background-color:pink" title="비정상 유효기간입니다. 발급이 불가능합니다."><%=s_vaild %></td>
								<td align="center">발급 불가</td>
							<%
						}
						if (vaild_date > 0) {
							%>
								<td align="center"><%=s_vaild %></td>
								<td align="center">발급하기</td>
							<%
						} //if
					%>
				</tr>
			<%
		} //for
		int deffp = 0;
		if (maxsize > printable_count) {
			deffp = maxsize - printable_count;
		}

		for (int i = 0; i < deffp; i++) {
			%>
			<tr style="background-color:powderblue" height="12.5%">
				<td align="center"></td>
				<td align="center"></td>
				<td align="center"></td>
			</tr>
			<%
		}
				%>
		</table>
		
			
		<table border="1" style="width:60%; margin-left: 2%">
			<tr style="background-color:bisque">
				<th>쿠폰명</th>
				<th width="30%">쿠폰번호</th>
				<th width="15%">남은일수</th>
				<th width="15%">사용하기</th>
			</tr>
			<%
			int user_count = 0;
			for (Coupon_Bean user_coupon : user_coupons) {
				String base_code = user_coupon.getCoupon_code();
				String code = base_code.substring(0,3) + " - " + base_code.substring(4, 8) + " - " + base_code.substring(9, 13) + " - " + base_code.substring(14, 18);
				
				int vaild_date = c_k_mgr.get_type_with_name(user_coupon.getCoupon_name()).getVaild_date();
				user_count += 1;
				if (vaild_date != -1) {
					LocalDateTime issueday = user_coupon.getCoupon_issueDate().toLocalDateTime();
					LocalDateTime endday = issueday.plusDays(vaild_date);
					LocalDateTime now = LocalDateTime.now();
					
					if (now.isBefore(endday)) {
					%>
					<tr style="background-color:bisque" height="12.5%">
						<td align="center"><%=user_coupon.getCoupon_name() %></td>
						<td align="center"><%=code %></td>
						<td align="center"><%=vaild_date %> 일</td>
						<td align="center">사용하기</td>
					</tr>
					<%
					}//if 
				} else {
					%>
					<tr style="background-color:bisque" height="12.5%">
						<td align="center"><%=user_coupon.getCoupon_name() %></td>
						<td align="center"><%=code %></td>
						<td align="center">무제한</td>
						<td align="center">사용하기</td>
					</tr>
					<%
				}
			}//for
			
			int deff = 0;
			if (maxsize > user_count) {
				deff = maxsize - user_count;
			}

			for (int i = 0; i < deff; i++) {
				%>
				<tr style="background-color:bisque" height="12.5%">
					<td align="center"></td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center"></td>
				</tr>
				<%
			}
					%>
		</table>
	</div>
  
  <hr id="about">
  
  <!-- Footer -->

<%@ include file="/index/base/footer.jsp" %>

<!-- End page content -->
</div>


<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}

function myAccFunc() {
	  var x = document.getElementById("demoAcc");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	    x.previousElementSibling.className += " w3-green";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	    x.previousElementSibling.className = 
	    x.previousElementSibling.className.replace(" w3-green", "");
	  }
	}

function myAccFunc1() {
	  var x = document.getElementById("demoAcc1");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	    x.previousElementSibling.className += " w3-green";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	    x.previousElementSibling.className = 
	    x.previousElementSibling.className.replace(" w3-green", "");
	  }
	}

function myAccFunc2() {
	  var x = document.getElementById("demoAcc2");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	    x.previousElementSibling.className += " w3-green";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	    x.previousElementSibling.className = 
	    x.previousElementSibling.className.replace(" w3-green", "");
	  }
	}

</script>

</body>
</html>
