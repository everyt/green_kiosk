package servlet.kiosk.purchase;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import event.Event_Bean;
import event.Event_Mgr;
import eventMenu.Eventmenu_Bean;
import eventMenu.Eventmenu_Mgr;
import orders.Orders_VO;

@WebServlet({ "/api/kiosk/purchase/event", "/api/kiosk/purchase/eventMenu" })
public class Event_Servlet extends HttpServlet {
	private static final long serialVersionUID = 822377164049874508L;

	private Gson gson;
	private Event_Mgr event_mgr;
	private Eventmenu_Mgr eventmenu_mgr;

	public Event_Servlet() {
        super();
	}
	
    @Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.gson = new Gson();
		this.event_mgr = new Event_Mgr();
		this.eventmenu_mgr = new Eventmenu_Mgr();
    }
    
    @Override
	public void destroy() {
		super.destroy();
		this.gson = null;
		this.event_mgr = null;
		this.eventmenu_mgr = null;
    }
    
    @Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			super.service(req, res);
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();

		String endPoint = req.getServletPath();
		
		if (endPoint.equals("/api/kiosk/purchase/event")) {
			Vector<Event_Bean> vector = event_mgr.readAllActiveEvent();
			
			String result = "[";
			
			for (int i = 0; i < vector.size(); i++) {
				Event_Bean event_bean = vector.get(i);
				
				result += "{\"no\":" + event_bean.getEvent_no() + "";
				result += "\"name\":\"" + event_bean.getEvent_name() + "\"";
				result += "\"desc\":\"" + event_bean.getEvent_desc() + "\"";
				result += "\"image\":\"" + event_bean.getEvent_image() + "\"}";
				
				if (i != vector.size() - 1) {
					result += ",";
				}
			}
			
			result += "]";
			
			out.write(result);
			
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
		String eventNo = sb.toString();
		
		if (eventNo == null || eventNo.isEmpty()) {
			res.sendError(400, "Parameter is null");
			return;
		}
		
		try {
			eventNo = URLDecoder.decode(eventNo, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			res.sendError(400, "Parameter is not encode by RFC-3986");
			e.printStackTrace();
          return;
		}

		String endPoint = req.getServletPath();
		
	    if (endPoint.equals("/api/kiosk/purchase/eventMenu")) {
	    	List<Map<String, Integer>> list = this.gson.fromJson(
	    			eventNo, new TypeToken<ArrayList<Map<String, Integer>>>() {}.getType());
	    	
			String result = "[";
	    	
	    	for (Map<String, Integer> map: list) {
				Vector<Eventmenu_Bean> vector = eventmenu_mgr.readAllEventmenuByEventNo(map.get("no"));
				for (int i = 0; i < vector.size(); i++) {
					Eventmenu_Bean eventmenu_bean = vector.get(i);
					
					result += "{\"eventNo\":" + map.get("no") + "";
					result += "\"menuNo\":" + eventmenu_bean.getEventMenu_menuNo() + "";
					result += "\"discount\":" + eventmenu_bean.getEventMenu_discount() + "}";
				    result += ",";
				}
	    	}
	    	
	    	result.substring(0, result.length() - 1);
	    	
			result += "]";
			
			out.write(result);
	    }
	}
}
