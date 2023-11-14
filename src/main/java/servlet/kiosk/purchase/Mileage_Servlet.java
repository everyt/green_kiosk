package servlet.kiosk.purchase;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URLDecoder;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import user.Member_Mgr;
import mile.Mileage_VO;

@WebServlet("/api/kiosk/purchase/mileage")
public class Mileage_Servlet extends HttpServlet {
	private static final long serialVersionUID = 822377164049874508L;

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
		PrintWriter out = res.getWriter();
		
		BufferedReader reader = req.getReader();
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = reader.readLine()) != null) {
			sb.append(line);
		}
		String mileage = sb.toString();
		
		if (mileage == null || mileage.isEmpty()) {
			res.sendError(400, "Parameter is null");
			return;
		}
		
		try {
			mileage = URLDecoder.decode(mileage, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			res.sendError(400, "Parameter is not encode by RFC-3986");
			e.printStackTrace();
          return;
		}

		Type type = new TypeToken<Mileage_VO>() {}.getType();
		Mileage_VO mileage_vo = gson.fromJson(mileage, type);
		if (mileage_vo.getType().equals("phoneNumber")) {
			if (member_mgr.checkPhone(mileage_vo.getValue())) {
				out.write(gson.toJson(mileage_vo));
			} else {
				out.write("{"
						+ "\"index\": 0,"
						+ "\"name\": \"x\","
						+ "\"mileage\": 0,"
						+ "\"value\": \"x\","
						+ "\"type\": \"x\""
						+ "}");
			}
		} else if (mileage_vo.getType().equals("cardNumber")) {
			if (member_mgr.checkCard(mileage_vo.getValue())) {
				out.write(gson.toJson(mileage_vo));
			} else {
				out.write("{"
						+ "\"index\": 0,"
						+ "\"name\": \"x\","
						+ "\"mileage\": 0,"
						+ "\"value\": \"x\","
						+ "\"type\": \"x\""
						+ "}");
			}
		}
    }

}
