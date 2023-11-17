package payments;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/**
 * Servlet implementation class kakao_pay
 */
@WebServlet({"/kakao_pay", "/payment/success", "/payment/cancel", "/payment/fail" })
public class kakao_pay extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson();
	private Map<String, String> datas = new HashMap<String, String>();
	private Map<String, Object> pay_return = new HashMap<String, Object>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public kakao_pay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String endPoint = request.getServletPath();
		// TODO Auto-generated method stub
		
		if (endPoint.equals("/kakao_pay")) {
			String url = "https://open-api.kakaopay.com/online/v1/payment/ready";
			
			this.datas.put("cid", "TC0ONETIME"); //String
			this.datas.put("partner_order_id", "1"); //String
			this.datas.put("partner_user_id", "test"); //String
			this.datas.put("item_name", "데리버거"); //String
			this.datas.put("quantity", "12"); //Integer
			this.datas.put("total_amount", "60000"); //Integer
			this.datas.put("tax_free_amount", "500"); //Integer
			this.datas.put("approval_url", "https://nodove.duckdns.org/payment/success"); //String
			this.datas.put("cancel_url", "https://nodove.duckdns.org/payment/fail"); //String
			this.datas.put("fail_url", "https://nodove.duckdns.org/payment/cancel"); //String
			
			String data = "{";
			
			for(Map.Entry<String, String> entry : this.datas.entrySet()) {
				String Key = entry.getKey();
				String Value = entry.getValue();
				data += "\""+Key+"\" : \""+Value+"\",";
			}
			data = data.substring(0, data.length() - 1) + "}";
			
			
			Map<String, Object> returnData = gson.fromJson(HttpPost.httpPostBodyConnection(url, data), new TypeToken<HashMap<String, Object>>(){}.getType());
			this.pay_return = returnData;
		}
		
		if (endPoint.equals("/payment/success")) {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
