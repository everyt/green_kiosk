package servlet.kiosk;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mile.Mile_log_Bean;
import mile.Mile_log_Mgr;

/**
 * Servlet implementation class milelogs
 */
@WebServlet("/api/kiosk/milelogs")
public class milelogs extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Mile_log_Bean bean = new Mile_log_Bean();
	private Mile_log_Mgr mgr = new Mile_log_Mgr();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public milelogs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		PrintWriter out = response.getWriter();
		if (uid == null) {
			out.write("{\"result\":\"failed\",\"reason\":\"no parameter\"}");
		} else {
			Vector<Mile_log_Bean> v_bean = this.mgr.getMileLogsByUid(uid);
			out.print(v_bean);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("bean");
		
		PrintWriter out = response.getWriter();
		if (param == null) {
			out.write("{\"result\":\"failed\",\"reason\":\"no parameter\"}");
		} else {
			Mile_log_Bean bean = new Gson().fromJson(param, Mile_log_Bean.class); ;
			boolean res = this.mgr.addMileLog(bean);
			if (res) {
				out.write("{\"result\":\"success\"}");
			} else {
				out.write("{\"result\":\"failed\"}");
			}
		}
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("bean");
		PrintWriter out = response.getWriter();
		if (param == null) {
			out.write("{\"result\":\"failed\",\"reason\":\"no parameter\"}");
		} else {
			Mile_log_Bean bean = new Gson().fromJson(param, Mile_log_Bean.class); ;
			boolean res = this.mgr.updateMileLog(bean);
			if (res) {
				out.write("{\"result\":\"success\"}");
			} else {
				out.write("{\"result\":\"failed\"}");
			}
		}
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("no");
		PrintWriter out = response.getWriter();
		if (param == null) {
			out.write("{\"result\":\"failed\",\"reason\":\"no parameter\"}");
		} else {
			Integer no = Integer.parseInt(param);
			boolean res = this.mgr.deleteMileLogByNo(no);
			if (res) {
				out.write("{\"result\":\"success\"}");
			} else {
				out.write("{\"result\":\"failed\"}");
			}
		}
	}

}
