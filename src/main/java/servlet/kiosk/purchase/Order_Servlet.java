package servlet.kiosk.purchase;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import orders.Orders_Bean;
import orders.Orders_Mgr;
import orders.Orders_VO;

@WebServlet({"/api/kiosk/purchase/order", "/api/kiosk/purchase/order/primary-key"})
public class Order_Servlet extends HttpServlet {
	private static final long serialVersionUID = 822377164049874508L;

	private Gson gson;
	private Orders_Mgr orders_mgr;
	
	public Order_Servlet() {
        super();
	}
	
    @Override
	public void init(ServletConfig config) throws ServletException {
			super.init(config);
			this.gson = new Gson();
			this.orders_mgr = new Orders_Mgr();
    }
    
    @Override
	public void destroy() {
			super.destroy();
			this.gson = null;
			this.orders_mgr = null;
    }
    
    @Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			super.service(req, res) ;
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();

		String endPoint = req.getServletPath();
		
		if (endPoint.equals("/api/kiosk/purchase/order/primary-key")) {
			int pk = this.orders_mgr.getLastOrder();
			out.write("{"
					+ "\"result\": true,"
					+ "\"primaryKey\":" + pk + ""
					+ "}");
		}
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
		String order = sb.toString();
		
		if (order == null || order.isEmpty()) {
			res.sendError(400, "Parameter is null");
			return;
		}
		
		try {
			order = URLDecoder.decode(order, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			res.sendError(400, "Parameter is not encode by RFC-3986");
			e.printStackTrace();
          return;
		}
		
		String endPoint = req.getServletPath();
		
		if (endPoint.equals("/api/kiosk/purchase/order")) {
			Orders_VO orders_vo = this.gson.fromJson(order, Orders_VO.class);
			
			
			boolean flag = this.orders_mgr.addOrder(new Orders_Bean(orders_vo));
			
			if (flag) {
				int pk = this.orders_mgr.getLastOrder();
				out.write("{"
						+ "\"result\": true,"
						+ "\"primaryKey\":" + pk + ""
						+ "}");
			} else {
				out.write("{"
						+ "\"result\": false"
						+ "}");
			}
		}

	}
}
