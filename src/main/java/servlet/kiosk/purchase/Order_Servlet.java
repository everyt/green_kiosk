package servlet.kiosk.purchase;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.logging.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import orders.Orders_Bean;
import orders.Orders_Mgr;
import orders.Orders_VO;

@WebServlet({"/api/kiosk/purchase/order", "/api/kiosk/purchase/order/primary-key"})
public class Order_Servlet extends HttpServlet {
	private static final long serialVersionUID = 822377164049874508L;
    private static final Logger logger = Logger.getLogger(Coupon_Servlet.class.getName());
    private static final String LOGGER_NAME = "Order_Servlet";

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
		logger.info(LOGGER_NAME + ": Processing HTTP GET request");
		
		PrintWriter out = res.getWriter();

		String endPoint = req.getServletPath();
		
		logger.info(LOGGER_NAME + ": Processing HTTP GET request by \"" + endPoint + "\"");
		
			if (endPoint.equals("/api/kiosk/purchase/order/primary-key")) {
				int pk = this.orders_mgr.getLastOrder();
				out.write("{"
						+ "\"result\": true,"
						+ "\"body\": {\"primaryKey\":" + pk + "}"
						+ "}");
			}
    }
    
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info(LOGGER_NAME + ": Processing HTTP POST request");
		
		PrintWriter out = res.getWriter();

    	String requestBody = ServletUtils.readRequestBody(req);

		if (requestBody == null || requestBody.isEmpty()) {
			res.sendError(400, "RequestBody is null");
			logger.info(LOGGER_NAME + ": Catch null parameter in HTTP POST request.");
			logger.severe("An error occurred: HTTP POST request' body is null");
			return;
		}
		
		try {
			requestBody = URLDecoder.decode(requestBody, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			res.sendError(400, "RequestBody is not encode by RFC-3986");
			logger.info(LOGGER_NAME + ": Catch not encoded by RFC-3986 parameter in HTTP POST request.");
			logger.severe("An error occurred while decoding coupon: " + e.getMessage());
          return;
		}
		
		String endPoint = req.getServletPath();
		
		logger.info(LOGGER_NAME + ": Processing HTTP POST request by \"" + endPoint + "\"");
		
		if (endPoint.equals("/api/kiosk/purchase/order")) {
			Orders_VO orders_vo = this.gson.fromJson(requestBody, Orders_VO.class);
			
			
			boolean flag = this.orders_mgr.addOrder(new Orders_Bean(orders_vo));
			
			if (flag) {
				int pk = this.orders_mgr.getLastOrder();
				out.write("{"
						+ "\"result\": true,"
						+ "\"body\": {\"primaryKey\":" + pk + "}"
						+ "}");
			} else {
				out.write("{"
						+ "\"result\": false"
						+ "}");
			}
		}

	}
}
