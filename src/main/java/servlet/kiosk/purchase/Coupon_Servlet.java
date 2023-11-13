package servlet.kiosk.purchase;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import coupon.Coupon_Bean;
import coupon.Coupon_Mgr;
import coupon.Coupon_VO;

@WebServlet({ "/api/kiosk/purchase/coupon", "/api/kiosk/purchase/couponArray" })
public class Coupon_Servlet extends HttpServlet {
	private static final long serialVersionUID = 822377164049874508L;

	private Gson gson;
	private Coupon_Mgr coupon_mgr;
	
	public Coupon_Servlet() {
        super();
	}
	
    @Override
	public void init(ServletConfig config) throws ServletException {
		this.gson = new Gson();
		this.coupon_mgr = new Coupon_Mgr();
    }
    
    @Override
	public void destroy() {
		this.gson = null;
		this.coupon_mgr = null;
    }
    
    @Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			super.service(req, res) ;
    }
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();
		
		BufferedReader reader = req.getReader();
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = reader.readLine()) != null) {
			sb.append(line);
		}
		String coupon = sb.toString();
		
		if (coupon == null || coupon.isEmpty()) {
			res.sendError(400, "Parameter is null");
			return;
		}
		
		try {
			coupon = URLDecoder.decode(coupon, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			res.sendError(400, "Parameter is not encode by RFC-3986");
			e.printStackTrace();
          return;
		}

		String endPoint = req.getServletPath();
		
		if (endPoint.equals("/api/kiosk/purchase/couponArray")) {
			
			Type type = new TypeToken<ArrayList<Coupon_VO>>() {}.getType();
			List<Coupon_VO> list_coupons_vo = this.verify(gson.fromJson(coupon, type));
			
			if (list_coupons_vo == null || list_coupons_vo.isEmpty()) {
				out.write("[{"
						+ "\"code\": \"x\","
						+ "\"name\": \"x\","
						+ "\"menuNo\": 0,"
						+ "\"discount\": 0"
						+ "}]");
			} else {
				out.write(gson.toJson(list_coupons_vo));
			}
		} else if (endPoint.equals("/api/kiosk/purchase/coupon")) {
			
			Type type = new TypeToken<Map<String, String>>() {}.getType();
			Map<String, String> coupon_map = gson.fromJson(coupon, type);
			
			if (coupon_mgr.checkCouponCode(coupon_map.get("code")) > 0) {
				Coupon_Bean coupon_bean = coupon_mgr.readCouponByCode("code");
				
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
				if (isCorrect) {
					out.write("[{"
							+ "\"code\": \"" + coupon_map.get("code") + "\","
						    + "\"name\": \"" + coupon_bean.getCoupon_name() + "\","
							+ "\"menuNo\": \"" + coupon_bean.getCoupon_menuNo() + "\","
							+ "\"discount\": \"" + coupon_bean.getCoupon_discount() + "\","
							+ "}]");
				} else {
					out.write("[{"
							+ "\"code\": \"t\","
							+ "\"name\": \"x\","
							+ "\"menuNo\": 0,"
							+ "\"discount\": 0"
							+ "}]");
				}
			} else {
				out.write("[{"
						+ "\"code\": \"x\","
						+ "\"name\": \"x\","
						+ "\"menuNo\": 0,"
						+ "\"discount\": 0"
						+ "}]");
			}
		}
		
	}
	
	private List<Coupon_VO> verify(List<Coupon_VO> list) { // 쿠폰매니저로 리스트 돌려서 검증함
		List<Coupon_VO> verifiedList = new ArrayList<Coupon_VO>();

		for (Coupon_VO vo : list) {
			String code = vo.getCode();
			
			if (coupon_mgr.checkCouponCode(code) > 0) {
					verifiedList.add(vo);
			}
		}
		
		return verifiedList;
	}
}
