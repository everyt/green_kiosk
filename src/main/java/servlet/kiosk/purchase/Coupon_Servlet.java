package servlet.kiosk.purchase;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import coupon.Coupon_Mgr;
import coupon.Coupon_VO;

@WebServlet("/api/kiosk/coupons")
public class Coupon_Servlet extends HttpServlet {
	private static final long serialVersionUID = 822377164049874508L;

	private Gson gson;
	private Coupon_Mgr coupon_mgr;
	
    @Override
	public void init(ServletConfig config) throws ServletException {
        super.init();
        this.gson = new Gson();
        this.coupon_mgr = new Coupon_Mgr();
    }
    
    @Override
	public void destroy() {
        super.destroy();
        this.gson = null;
        this.coupon_mgr = null;
    }
    
    @Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        super.service(req, res) ;
    }
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String coupons = req.getParameter("coupons");
		
		if (coupons == null || coupons.isEmpty()) {
			res.sendError(400, "Parameter is null");
		}
		
		try {
			URLDecoder.decode(coupons, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			res.sendError(400, "Parameter is not encode by RFC-3986");
			e.printStackTrace();
		}
		
		List<Coupon_VO> list_coupons_bean = this.verify(gson.fromJson(coupons, (Type) new ArrayList<Coupon_VO>()));
		
		res.getWriter().write(gson.toJson(list_coupons_bean));
	}
	
	private List<Coupon_VO> verify(List<Coupon_VO> list) {
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
