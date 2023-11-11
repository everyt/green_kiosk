package orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import DBconnector.DBConnectionMgr;
import orders.Orders_Bean;

public class Orders_Mgr {
	private DBConnectionMgr pool;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	public Orders_Mgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//초기화
	private void Initializer(String query) {
		try {
			this.conn = pool.getConnection();
			this.pst = conn.prepareStatement(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//커넥션 풀 해제
	private void Closer() {
		int flag = 0;
		if (this.conn != null) {
			flag += 1;
		}
		if (this.pst != null) {
			flag += 1;
		}
		if (flag == 1) {
			pool.freeConnection(this.conn);
		} else if (flag == 2) {
			pool.freeConnection(this.conn, this.pst);
		} else {
			pool.freeConnection(this.conn, this.pst, this.rs);
		}
	}
	
	public Vector<Orders_Bean> getAllOrders() {
		Vector<Orders_Bean> vector = new Vector<Orders_Bean>();
		try {
			this.Initializer("SELECT * FROM orders");
			this.rs = this.pst.executeQuery();
			while (this.rs.next()) {
				Orders_Bean bean = new Orders_Bean();
	            bean.setOrder_no(this.rs.getInt("order_no"));
	            bean.setOrder_time(this.rs.getTimestamp("order_time"));
	            bean.setOrder_foods(this.rs.getString("order_foods"));
	            bean.setOrder_price(this.rs.getInt("order_price"));
	            bean.setOrder_discount(this.rs.getInt("order_discount"));
	            bean.setOrder_coupon(this.rs.getString("order_coupon"));
	            bean.setOrder_type(this.rs.getString("order_type"));
	            bean.setOrder_use_mile(this.rs.getBoolean("order_use_mile"));
	            bean.setOrder_use_amount(this.rs.getInt("order_use_mile_amount"));
	            bean.setOrder_add_mile(this.rs.getBoolean("order_add_mile"));
	            bean.setOrder_add_amount(this.rs.getInt("order_add_mile_amount"));
	            bean.setOrder_is_maked(this.rs.getBoolean("order_is_maked"));
	            vector.add(bean);
	        }
		} catch (Exception error) {
			error.printStackTrace();
		} finally {
			this.Closer();
		}
		return vector;
	}
	
	public Vector<Orders_Bean> getOrderByNo(int no) {
		Vector<Orders_Bean> vector = new Vector<Orders_Bean>();
		try {
			this.Initializer("SELECT * FROM orders WHERE no = ?");
			this.pst.setInt(1, no);
			this.rs = this.pst.executeQuery();
			while (this.rs.next()) {
				Orders_Bean bean = new Orders_Bean();
	            bean.setOrder_no(this.rs.getInt("order_no"));
	            bean.setOrder_time(this.rs.getTimestamp("order_time"));
	            bean.setOrder_foods(this.rs.getString("order_foods"));
	            bean.setOrder_price(this.rs.getInt("order_price"));
	            bean.setOrder_discount(this.rs.getInt("order_discount"));
	            bean.setOrder_coupon(this.rs.getString("order_coupon"));
	            bean.setOrder_type(this.rs.getString("order_type"));
	            bean.setOrder_use_mile(this.rs.getBoolean("order_use_mile"));
	            bean.setOrder_use_amount(this.rs.getInt("order_use_mile_amount"));
	            bean.setOrder_add_mile(this.rs.getBoolean("order_add_mile"));
	            bean.setOrder_add_amount(this.rs.getInt("order_add_mile_amount"));
	            bean.setOrder_is_maked(this.rs.getBoolean("order_is_maked"));
	            vector.add(bean);
	        }
		} catch (Exception error) {
			error.printStackTrace();
		} finally {
			this.Closer();
		}
		return vector;
	}
	
	public boolean addOrder(Orders_Bean order) {
		boolean flag = false;
		try {
			this.Initializer("INSERT INTO `orders` (`order_time`, `order_foods`, `order_price`, `order_discount`, `order_coupon`, `order_type`, `order_use_mile`, `oeder_use_mile_amount`, `order_add_mile`, `order_add_mile_amount`, `order_is_maked`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			this.pst.setTimestamp(1, order.getOrder_time());
			this.pst.setString(2, order.getOrder_foods());
			this.pst.setInt(3, order.getOrder_price());
			this.pst.setInt(4, order.getOrder_discount());
			this.pst.setString(5, order.getOrder_coupon());
			this.pst.setString(6, order.getOrder_type());
			this.pst.setBoolean(7, order.isOrder_use_mile());
			this.pst.setInt(8, order.getOrder_use_amount());
			this.pst.setBoolean(9, order.isOrder_add_mile());
			this.pst.setInt(9, order.getOrder_add_amount());
			this.pst.setBoolean(10, order.isOrder_is_maked());
			if (this.pst.executeUpdate() == 1) {
				flag = true;
			};
		} catch (Exception error) {
			error.printStackTrace();
		} finally {
			this.Closer();
		}
		return flag;
	}
	
	public boolean updateOrder(Orders_Bean order, int order_no) {
		boolean flag = false;
		try {
			this.Initializer("UPDATE `orders` SET (`order_time` = ?, `order_foods` = ?, `order_price` = ?, `order_discount` = ?, `order_coupon` = ?, `order_type` = ?, `order_use_mile` = ?, `oeder_use_mile_amount` = ?, `order_add_mile` = ?, `order_add_mile_amount` = ?, `order_is_maked` = ?) WHERE `order_no` = ?");
			this.pst.setTimestamp(1, order.getOrder_time());
			this.pst.setString(2, order.getOrder_foods());
			this.pst.setInt(3, order.getOrder_price());
			this.pst.setInt(4, order.getOrder_discount());
			this.pst.setString(5, order.getOrder_coupon());
			this.pst.setString(6, order.getOrder_type());
			this.pst.setBoolean(7, order.isOrder_use_mile());
			this.pst.setInt(8, order.getOrder_use_amount());
			this.pst.setBoolean(9, order.isOrder_add_mile());
			this.pst.setInt(9, order.getOrder_add_amount());
			this.pst.setBoolean(10, order.isOrder_is_maked());
			this.pst.setInt(11, order_no);
			if (this.pst.executeUpdate() == 1) {
				flag = true;
			};
		} catch (Exception error) {
			error.printStackTrace();
		} finally {
			this.Closer();
		}
		return flag;
	}
	
	public boolean deleteOrderByNo(int no) {
		boolean flag = false;
		try {
			this.Initializer("DELETE FROM `orders` WHERE `order_no` = ?");
			this.pst.setInt(1, no);
			if (this.pst.executeUpdate() == 1) {
				flag = true;
			};
		} catch (Exception error) {
			error.printStackTrace();
		} finally {
			this.Closer();
		}
		return flag;
	}
}
