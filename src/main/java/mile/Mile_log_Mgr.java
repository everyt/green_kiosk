package mile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import DBconnector.DBConnectionMgr;
import mile.Mile_log_Bean;

public class Mile_log_Mgr {
	private DBConnectionMgr pool;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	public Mile_log_Mgr() {
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
	
	public Vector<Mile_log_Bean> getAllMileLogs() {
		Vector<Mile_log_Bean> vector = new Vector<Mile_log_Bean>();
		try {
			this.Initializer("SELECT * FROM orders");
			this.rs = this.pst.executeQuery();
			while (this.rs.next()) {
				Mile_log_Bean bean = new Mile_log_Bean();
	            bean.setMile_no(this.rs.getInt("mile_no"));
	            bean.set_timestamp(this.rs.getTimestamp("mile_timestamp"));
	            bean.setMile_uid(this.rs.getString("mile_uid"));
	            bean.setMile_type(this.rs.getString("mile_type"));
	            bean.setMile_reason(this.rs.getString("mile_reason"));
	            bean.setMile_deff(this.rs.getInt("mile_diff"));
	            bean.setMile_order_no(this.rs.getInt("mile_order_no"));
	            vector.add(bean);
	        }
		} catch (Exception error) {
			error.printStackTrace();
		} finally {
			this.Closer();
		}
		return vector;
	}

	public Vector<Mile_log_Bean> getMileLogsByUid(String uid) {
		Vector<Mile_log_Bean> vector = new Vector<Mile_log_Bean>();
		try {
			this.Initializer("SELECT * FROM orders WHERE `mile_uid` = ?");
			this.pst.setString(1, uid);
			this.rs = this.pst.executeQuery();
			while (this.rs.next()) {
				Mile_log_Bean bean = new Mile_log_Bean();
	            bean.setMile_no(this.rs.getInt("mile_no"));
	            bean.set_timestamp(this.rs.getTimestamp("mile_timestamp"));
	            bean.setMile_uid(this.rs.getString("mile_uid"));
	            bean.setMile_type(this.rs.getString("mile_type"));
	            bean.setMile_reason(this.rs.getString("mile_reason"));
	            bean.setMile_deff(this.rs.getInt("mile_diff"));
	            bean.setMile_order_no(this.rs.getInt("mile_order_no"));
	            vector.add(bean);
	        }
		} catch (Exception error) {
			error.printStackTrace();
		} finally {
			this.Closer();
		}
		return vector;
	}
	
	public Vector<Mile_log_Bean> getMileLogByNo(Integer no) {
		Vector<Mile_log_Bean> vector = new Vector<Mile_log_Bean>();
		try {
			this.Initializer("SELECT * FROM `orders` WHERE `mile_no` = ?");
			this.pst.setInt(1, no);
			this.rs = this.pst.executeQuery();
			while (this.rs.next()) {
				Mile_log_Bean bean = new Mile_log_Bean();
	            bean.setMile_no(this.rs.getInt("mile_no"));
	            bean.set_timestamp(this.rs.getTimestamp("mile_timestamp"));
	            bean.setMile_uid(this.rs.getString("mile_uid"));
	            bean.setMile_type(this.rs.getString("mile_type"));
	            bean.setMile_reason(this.rs.getString("mile_reason"));
	            bean.setMile_deff(this.rs.getInt("mile_diff"));
	            bean.setMile_order_no(this.rs.getInt("mile_order_no"));
	            vector.add(bean);
	        }
		} catch (Exception error) {
			error.printStackTrace();
		} finally {
			this.Closer();
		}
		return vector;
	}
	
	public boolean addMileLog(Mile_log_Bean bean) {
		boolean flag = false;
		try {
			this.Initializer("INSERT INTO `orders` (`mile_uid`, `mine_type`, `mile_reason`, `mile_deff`, `mile_order_no`, `mile_timestamp`) VALUES (?, ?, ?, ?, ?, ?)");
			this.pst.setString(1, bean.getMile_uid());
			this.pst.setString(2, bean.getMile_type());
			this.pst.setString(3, bean.getMile_reason());
			this.pst.setInt(4, bean.getMile_deff());
			this.pst.setInt(5, bean.getMile_order_no());
			this.pst.setTimestamp(6, bean.get_timestamp());
			if (this.pst.executeUpdate() == 1) {
				flag = true;
			};
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.Closer();
		}
		return flag;
	}
	
	public boolean updateMileLog(Mile_log_Bean bean) {
		boolean flag = false;
		try {
			this.Initializer("UPDATE `orders` SET `mile_uid` = ?, `mine_type` = ?, `mile_reason` = ?, `mile_deff` = ?, `mile_order_no` = ?, `mile_timestamp` = ? WHERE `mile_no` = ?");
			
			this.pst.setString(1, bean.getMile_uid());
			this.pst.setString(2, bean.getMile_type());
			this.pst.setString(3, bean.getMile_reason());
			this.pst.setInt(4, bean.getMile_deff());
			this.pst.setInt(5, bean.getMile_order_no());
			this.pst.setTimestamp(6, bean.get_timestamp());
			this.pst.setInt(7, bean.getMile_no());
			if (this.pst.executeUpdate() == 1) {
				flag = true;
			};
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.Closer();
		}
		return flag;
	}
	
	public boolean deleteMileLogByNo(int no) {
		boolean flag = false;
		try {
			this.Initializer("DELETE FROM `orders` WHERE `mile_no`=?");
			this.pst.setInt(1, no);
			if (this.pst.executeUpdate() == 1) {
				flag = true;
			};
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.Closer();
		}
		return flag;
	}
}
