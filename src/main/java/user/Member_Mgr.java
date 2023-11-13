package user;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Vector;


import all.DBConnectionMgr;

/**
 * 
 * 
 * @author 재운
 * @param <Bean_Membe>
 * @param <BeanMember>
 *
 */
public class Member_Mgr {
	
	
	private DBConnectionMgr pool;
	private Object bean;
	
	// 회원 정보 ===============================================================================
	// ID 중복 체크
	public boolean checkId(String usid) {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select mem_id from member where mem_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, usid);
			flag = pstmt.executeQuery().next();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	// 로그인
	public boolean loginMember(String usid, String uspw) {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select mem_id from member where mem_id=? and mem_pw=SHA2('xq" + uspw + "q43',256)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, usid);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	// 회원 조회 (usid)
	public Member_Bean getMember(String usid) {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member_Bean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from member where mem_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, usid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new Member_Bean();
				bean.setMem_no(rs.getInt("mem_no"));
				bean.setMem_id(rs.getString("mem_id"));
				bean.setMem_pw(rs.getString("mem_pw"));
				bean.setMem_name(rs.getString("mem_name"));
				bean.setMem_phone(rs.getString("mem_phone"));
				bean.setMem_ac(rs.getString("mem_ac"));
				bean.setMem_mile(rs.getInt("mem_mile"));
				bean.setMem_coupon(rs.getString("mem_coupon"));
				bean.set_card(rs.getString("mem_card"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}

	// 회원 정보 수정
	public boolean updateMember(String mem_id, String name, String phone) {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			String sql = "UPDATE `member` SET `mem_name` = ?, `mem_phone`= ? WHERE `mem_id` = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			pstmt.setString(3, mem_id);
			if (pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	

	// 회원 정보 삭제
	public void deleteMember(int numb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "delete from member_admin where numb=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, numb);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	public String register_Member(String mem_id, String mem_pw, String name, String phone) { //함수제작 나경원
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		boolean id_check = checkId(mem_id);
		
		
		if (id_check) {
			return "400/이미 사용중인 아이디입니다.";
		} else {
	    	Random random = new Random();		//랜덤 함수 선언
			int createNum = 0;  			//1자리 난수
			String ranNum = ""; 			//1자리 난수 형변환 변수
		    	int letter    = 16;			//난수 자릿수:6
			String User_member = "";  		//결과 난수
			boolean creating = true;
			
			while (creating) {
				for (int i=0; i<letter; i++) { 
			        		
					createNum = random.nextInt(9);		//0부터 9까지 올 수 있는 1자리 난수 생성
					ranNum =  Integer.toString(createNum);  //1자리 난수를 String으로 형변환
					User_member += ranNum;			//생성된 난수(문자열)을 원하는 수(letter)만큼 더하며 나열
				}	
				
				
				try {
					con = pool.getConnection();
					sql = "select * from member where mem_card = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, User_member);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						User_member = "";
					} else {
						creating = false;
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con);
				}
			}
			
			try {
				con = pool.getConnection();
				sql = "INSERT INTO member (`mem_id`, `mem_pw`, `mem_name`, `mem_phone`, `mem_ac`, `mem_coupon`, `mem_card`) VALUES (?, SHA2('xq" + mem_pw + "q43',256), ?, ?, \"user\", \"\", ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mem_id);
				pstmt.setString(2, name);
				pstmt.setString(3, phone);
				pstmt.setString(4, User_member);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			
			return "200/회원가입에 성공했습니다.";
		}
	}

	public boolean checkphone(String phone) {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select phone from member where phone = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, phone);
			flag = pstmt.executeQuery().next();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	public boolean checkmem_name(String mem_name) {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select mem_name from member where mem_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_name);
			flag = pstmt.executeQuery().next();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	public Member_Bean get_user_with_phone(String p_num) {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member_Bean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from member where mem_phone = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new Member_Bean();
				bean.setMem_no(rs.getInt("mem_no"));
				bean.setMem_id(rs.getString("mem_id"));
				bean.setMem_pw(rs.getString("mem_pw"));
				bean.setMem_name(rs.getString("mem_name"));
				bean.setMem_phone(rs.getString("mem_phone"));
				bean.setMem_ac(rs.getString("mem_ac"));
				bean.setMem_mile(rs.getInt("mem_mile"));
				bean.setMem_coupon(rs.getString("mem_coupon"));
				bean.set_card(rs.getString("mem_card"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	public List<String> findId(String name, String p_num) {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<String> res = new ArrayList<String>();
		try {
			con = pool.getConnection();
			sql = "select mem_id from member where mem_name = ? AND mem_phone = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, p_num);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				res.add(rs.getString("mem_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return res;
	}
	
	public boolean findpw(String id, String name , String phone ) {
		DBConnectionMgr pool = new DBConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean res = false;
		try {
			con = pool.getConnection();
			sql = "select mem_id from member where mem_id = ? AND mem_name = ? AND mem_phone = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				res = true;
			} else {
				res = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return res;
	}
	

}

