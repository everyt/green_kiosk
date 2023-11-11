package servlet.kiosk.purchase;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import orders.Orders_Bean;
import orders.Orders_Mgr;

@WebServlet("/api/kiosk/order")
public class Order_Servlet extends HttpServlet {
	private static final long serialVersionUID = 822377164049874508L;

	private Gson gson;
	private Orders_Mgr orders_mgr;
	
    @Override
	public void init(ServletConfig config) throws ServletException {
        super.init();
        this.gson = new Gson();
        this.orders_mgr = new Orders_Mgr();
    }
    
    @Override
	public void destroy() {
        super.destroy();
        this.gson = new Gson();
        this.orders_mgr = null;
    }
    
    @Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        super.service(req, res) ;
    }
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String order = req.getParameter("order");
		
		if (order == null || order.isEmpty()) {
			res.sendError(400, "Parameter is null");
		}
		
		try {
			URLDecoder.decode(order, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			res.sendError(400, "Parameter is not encode by RFC-3986");
			e.printStackTrace();
		}
		
		Orders_Bean orders_bean = this.gson.fromJson(order, Orders_Bean.class);
		
		this.orders_mgr.addOrder(orders_bean);
	}
}
