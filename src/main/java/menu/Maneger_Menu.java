package menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import all.DBConnectionMgr;


public class Maneger_Menu {
	
	private DBConnectionMgr pool;

	public void Manager_Menu() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 1.메뉴 관리 페이지 - 메뉴 추가
		public boolean insertMenu(Menu_menu_Bean bean) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "insert menu_menu(menu_name, menu_gubn, menu_isSale, menu_imgPath, menu_component,"
						+ "menu_price, menu_sell_amount, menu_recommend) values(?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getMenu_name());
				pstmt.setString(2, bean.getMenu_gubn());
				pstmt.setInt(3, bean.getMenu_isSale());
				pstmt.setString(4, bean.getMenu_imgPath());
				pstmt.setString(5, bean.getMenu_component());
				pstmt.setInt(6, bean.getMenu_price());
				pstmt.setInt(7, bean.getMenu_sell_amount());
				pstmt.setInt(8, bean.getMenu_recommend());
						
				if (pstmt.executeUpdate() == 1)
					flag = true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}
		
		// 1. 메뉴 관리 페이지 - 메뉴 수정
		public boolean updateMenu(Menu_menu_Bean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "update menu_menu set menu_name=?, menu_gubn=?, menu_isSale=?, menu_component=?,"
						+ "menu_price=?, menu_sell_amount=?, menu_recommend=? ";
				pstmt.setString(1, bean.getMenu_name());
				pstmt.setString(2, bean.getMenu_gubn());
				pstmt.setInt(3, bean.getMenu_isSale());
				pstmt.setString(4, bean.getMenu_imgPath());
				pstmt.setString(5, bean.getMenu_component());
				pstmt.setInt(6, bean.getMenu_price());
				pstmt.setInt(7, bean.getMenu_sell_amount());
				pstmt.setInt(8, bean.getMenu_recommend());
				int count = pstmt.executeUpdate();
				if (count > 0)
					flag = true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}
	
	
	// 4. 주문내역페이지 - 현황 노출 
	public Menu_component_Bean getMenu(int numb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Menu_component_Bean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from menu_component where numb = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, numb);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new Menu_component_Bean();
				bean.setComponent_no(rs.getInt("component_no"));
				bean.setComponent_name(rs.getString("component_name"));
				bean.setComponent_price(rs.getInt("component_price"));
				bean.setComponent_amount(rs.getInt("component_amount"));
				bean.setComponent_imgPath(rs.getString("component_imgPath"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	
	// 4.재고 관리 페이지 - 재료 입고
	public boolean insertComponent(Menu_component_Bean bean) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert menu_component(component_name,component_price,component_amount,component_imgpath)values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getComponent_name());
			pstmt.setInt(2, bean.getComponent_price());
			pstmt.setInt(3, bean.getComponent_amount());
			pstmt.setString(4, bean.getComponent_imgPath());
					
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	
	// 4.재고 관리 페이지 - 재료 수정
	public boolean updateComponent(Menu_component_Bean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update menu_component set component_name=?, component_price=?, component_amount=?, component_imgpath=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getComponent_name());
			pstmt.setInt(2, bean.getComponent_price());
			pstmt.setInt(3, bean.getComponent_amount());
			pstmt.setString(4, bean.getComponent_imgPath());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	
	// 4.재고 관리 페이지 - 재료 삭제
	public void deleteComponent(int numb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "delete from menu_component where numb=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, numb);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	
	//재고 관리 페이지 - 재료 현황
	public Menu_component_Bean getComponenct(int numb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Menu_component_Bean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from menu_component where numb = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, numb);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new Menu_component_Bean();
				bean.setComponent_no(rs.getInt("component_no"));
				bean.setComponent_name(rs.getString("component_name"));
				bean.setComponent_price(rs.getInt("component_price"));
				bean.setComponent_amount(rs.getInt("component_amount"));
				bean.setComponent_imgPath(rs.getString("component_imgPath"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}

}
