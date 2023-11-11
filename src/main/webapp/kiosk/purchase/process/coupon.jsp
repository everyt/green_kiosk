<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="coupon.Coupon_Bean" %>
<%@ page import="java.sql.Timestamp" %>

<jsp:useBean id="Coupon_Mgr" class="coupon.Coupon_Mgr"/>

<%
	request.setCharacterEncoding("UTF-8");
	String couponCode = request.getParameter("couponCode");
	Coupon_Bean coupon_bean = Coupon_Mgr.readCouponByCode(couponCode);
	
	boolean isLimit = false;
	boolean isCorrect = false;
	
	if (coupon_bean != null && coupon_bean.getCoupon_issueDate() != null) {
		Timestamp timestamp_Now = new Timestamp(System.currentTimeMillis());
		Timestamp timestamp_Issue = coupon_bean.getCoupon_issueDate();
		Timestamp timestamp_Expire = coupon_bean.getCoupon_expireDate();
		Timestamp timestamp_LimitTime1 = new Timestamp(System.currentTimeMillis());
		Timestamp timestamp_LimitTime2 = new Timestamp(System.currentTimeMillis());
		
		if (coupon_bean.getCoupon_limitTime1() != null) {
			isLimit = true;
			timestamp_LimitTime1 = coupon_bean.getCoupon_limitTime1();
			timestamp_LimitTime2 = coupon_bean.getCoupon_limitTime2();
		}
		
		if (timestamp_Issue.compareTo(timestamp_Now) <= 0 && timestamp_Expire.compareTo(timestamp_Now) >= 0) {
			if (isLimit) {
				if (timestamp_LimitTime1.compareTo(timestamp_Now) <= 0 && timestamp_LimitTime2.compareTo(timestamp_Now) >= 0) {
					isCorrect = true;
				}
			} else {
				isCorrect = true;
			}
		}
	}
%>
<script src="../../../assets/js/kiosk/purchase/getCookie.js"></script>
<script>
	if (<%=isCorrect%>) {
    const coupon = {
	      code: <%=coupon_bean.getCoupon_code()%>,
	      name: '<%=coupon_bean.getCoupon_name()%>',
	      menuNo: <%=coupon_bean.getCoupon_menuNo()%>,
	      discount: <%=coupon_bean.getCoupon_discount()%>
    };
    
    let oldCoupons = '';
    oldCoupons = getCookie('coupons');
    
    let coupons = JSON.stringify(coupon);
    
    let replaced_coupons = coupons.replace(/([|])/g, '');
    
    if (!(oldCoupons === undefined)) {
    	replaced_coupons += ',' + oldCoupons;
    }
    
    document.cookie = "coupons" + "=[" + encodeURIComponent(replaced_coupons) + "]; path=/;";
		location.href = '../main.jsp?couponIsCorrect=true';
	} else {
	       
		location.href = '../coupon.jsp?isCorrect=false';
	}
</script>
