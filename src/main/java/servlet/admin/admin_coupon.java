package servlet.admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import coupon.Coupon_kind_Bean;
import coupon.Coupon_kind_Mgr;

/**
 * Servlet implementation class admin_coupon
 */
@WebServlet({ "/admin_coupon", "/api/admin/coupon/add", "/api/admin/coupon/search", "/api/admin/coupon/update", "/api/admin/coupon/delete"  })
public class admin_coupon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson();
	
	private Coupon_kind_Bean bean = new Coupon_kind_Bean();
	private Coupon_kind_Mgr mgr = new Coupon_kind_Mgr();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_coupon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String endPoint = request.getServletPath();
		
		if (endPoint.equals("/api/admin/coupon")) {
			mgr.readAllKind();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String endPoint = request.getServletPath();
		
		if (endPoint.equals("/api/admin/coupon/add")) {
	        String body = null;
	        StringBuilder stringBuilder = new StringBuilder();
	        BufferedReader bufferedReader = null;
	 
	        try {
	            ServletInputStream inputStream = request.getInputStream();
	            if (inputStream != null) {
	                bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
	                char[] charBuffer = new char[128];
	                int bytesRead = -1;
	                while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
	                    stringBuilder.append(charBuffer, 0, bytesRead);
	                }
	            }
	        } catch (IOException ex) {
	            throw ex;
	        } finally {
	            if (bufferedReader != null) {
	                try {
	                    bufferedReader.close();
	                } catch (IOException ex) {
	                    throw ex;
	                }
	            }
	        }
	 
	        body = stringBuilder.toString();
			Map<String, String> data = gson.fromJson(body, new TypeToken<Map<String, String>>(){}.getType());
			
			String name = data.get("name");
			String desc = data.get("desc");
			Integer discount_per = Integer.parseInt(data.get("discount_per"));
			String enable = data.get("enable");
			Integer vaild_date = Integer.parseInt(data.get("vaild_date"));
			PrintWriter out = response.getWriter();
			List<String> categorys = gson.fromJson(data.get("category"), new TypeToken<List<String>>(){}.getType());
			this.bean.setCategory(categorys);
			this.bean.setName(name);
			this.bean.setDesc(desc);
			this.bean.setDiscount_per(discount_per);
			this.bean.setVaild_date(vaild_date);
			if (enable.equals("true")) {
				this.bean.setEnable(true);
			} else {
				this.bean.setEnable(false);
			}
			this.bean.setDefault_coupon(false);
			Map<String, String> res = this.mgr.addKind(bean);
			if (res.get("result").equals("success")) {
				out.write("{\"result\":\"success\"}");
			} else {
				if (res.get("reason").contains("Duplicate entry ")) {
					out.write("{\"result\":\"failed\",\"reason\":\"already using name\"}");
				} else {
					out.write("{\"result\":\"failed\",\"reason\":\"unknown error\"}");
				}
			};
		}
		
		if (endPoint.equals("/api/admin/coupon/update")) {
	        String body = null;
	        StringBuilder stringBuilder = new StringBuilder();
	        BufferedReader bufferedReader = null;
	 
	        try {
	            ServletInputStream inputStream = request.getInputStream();
	            if (inputStream != null) {
	                bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
	                char[] charBuffer = new char[128];
	                int bytesRead = -1;
	                while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
	                    stringBuilder.append(charBuffer, 0, bytesRead);
	                }
	            }
	        } catch (IOException ex) {
	            throw ex;
	        } finally {
	            if (bufferedReader != null) {
	                try {
	                    bufferedReader.close();
	                } catch (IOException ex) {
	                    throw ex;
	                }
	            }
	        }
	 
	        body = stringBuilder.toString();
			Map<String, String> data = gson.fromJson(body, new TypeToken<Map<String, String>>(){}.getType());
			
			Integer numb = Integer.parseInt(data.get("numb"));
			String name = data.get("name");
			String desc = data.get("desc");
			Integer discount_per = Integer.parseInt(data.get("discount_per"));
			String enable = data.get("enable");
			Integer vaild_date = Integer.parseInt(data.get("vaild_date"));
			PrintWriter out = response.getWriter();
			List<String> categorys = gson.fromJson(data.get("category"), new TypeToken<List<String>>(){}.getType());
			this.bean.setNumb(numb);
			this.bean.setCategory(categorys);
			this.bean.setName(name);
			this.bean.setDesc(desc);
			this.bean.setDiscount_per(discount_per);
			this.bean.setVaild_date(vaild_date);
			if (enable.equals("true")) {
				this.bean.setEnable(true);
			} else {
				this.bean.setEnable(false);
			}
			this.bean.setDefault_coupon(false);
			boolean res = this.mgr.updateKind(bean);
			if (res) {
				out.write("{\"result\":\"success\"}");
			} else {
				out.write("{\"result\":\"failed\",\"reason\":\"unknown error\"}");
			};
		}
		
		if (endPoint.equals("/api/admin/coupon/delete")) {
			PrintWriter out = response.getWriter();
	        String body = null;
	        StringBuilder stringBuilder = new StringBuilder();
	        BufferedReader bufferedReader = null;
	 
	        try {
	            ServletInputStream inputStream = request.getInputStream();
	            if (inputStream != null) {
	                bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
	                char[] charBuffer = new char[128];
	                int bytesRead = -1;
	                while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
	                    stringBuilder.append(charBuffer, 0, bytesRead);
	                }
	            }
	        } catch (IOException ex) {
	            throw ex;
	        } finally {
	            if (bufferedReader != null) {
	                try {
	                    bufferedReader.close();
	                } catch (IOException ex) {
	                    throw ex;
	                }
	            }
	        }
	 
	        body = stringBuilder.toString();
			Map<String, String> data = gson.fromJson(body, new TypeToken<Map<String, String>>(){}.getType());
			
			Integer numb = Integer.parseInt(data.get("numb"));
			boolean res = this.mgr.deleteKind(numb);
			if (res) {
				out.write("{\"result\":\"success\"}");
			} else {
				out.write("{\"result\":\"failed\",\"reason\":\"unknown error\"}");
			};
		}
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String endPoint = request.getServletPath();
		
		if (endPoint.equals("/api/admin/coupon")) {
			
		}
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String endPoint = request.getServletPath();
		
		if (endPoint.equals("/api/admin/coupon")) {
			
		}
	}

}
