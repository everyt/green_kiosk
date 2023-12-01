package servlet.kiosk.purchase;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URLDecoder;
import java.util.logging.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import mile.Mileage_VO;
import user.Member_Mgr;

@WebServlet("/api/kiosk/purchase/mileage")
public class Mileage_Servlet extends HttpServlet {
	private static final long serialVersionUID = 822377164049874508L;
    private static final Logger logger = Logger.getLogger(Coupon_Servlet.class.getName());
    private static final String LOGGER_NAME = "Mileage_Servlet";

	private Gson gson;
	private Member_Mgr member_mgr;
	
	public Mileage_Servlet() {
        super();
	}
	
    @Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.gson = new Gson();
		this.member_mgr = new Member_Mgr();
    }
    
    @Override
	public void destroy() {
		super.destroy();
		this.gson = null;
		this.member_mgr = null;
    }
    
    @Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			super.service(req, res);
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
		
		requestBody = requestBody.substring(1, requestBody.length() - 1);
		requestBody = requestBody.replace("\\", "");
		
		System.out.println(requestBody);

		Type type = new TypeToken<Mileage_VO>() {}.getType();
		Mileage_VO mileage_vo = gson.fromJson(requestBody, type);
		if (mileage_vo.getType().equals("phoneNumber")) {
			if (member_mgr.checkPhone(mileage_vo.getValue())) {
				out.write("{"
						+ "\"result\": true, \"body\":"
						+ gson.toJson(mileage_vo)
						+ "}");
			} else {
					out.write("{"
							+ "\"result\": false}");
			}
		} else if (mileage_vo.getType().equals("cardNumber")) {
			if (member_mgr.checkCard(mileage_vo.getValue())) {
				out.write("{"
						+ "\"result\": true, \"body\":"
						+ gson.toJson(mileage_vo)
						+ "}");
			} else {
					out.write("{"
							+ "\"result\": false}");
			}
		}
    }

}
