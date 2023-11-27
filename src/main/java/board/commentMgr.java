package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import DBconnector.DBConnectionMgr;

public class commentMgr {

	
	private DBConnectionMgr pool;
	private static final String ENCTYPE = "UTF-8";
 
	public commentMgr()	{
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//post_no에 맞는 댓글 리스트 가지고 오기
	public List<commentBean> getComment(Long comment_post_no) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = null;
	    List<commentBean> list = new ArrayList<>();
	    String commentWriterId = null;
	    try {
	        	con = pool.getConnection();
	            sql = "SELECT * FROM comment WHERE comment_post_no = ? ORDER BY comment_no ASC";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setLong(1, comment_post_no);
	            rs = pstmt.executeQuery();

	            while (rs.next()) {
	                commentBean bean = new commentBean();
	                commentWriterId = findUser(rs.getLong("comment_writer"));
	                bean.setComment_no(rs.getLong("comment_no"));
	                bean.setComment_content(rs.getString("comment_content"));
	                bean.setComment_time(rs.getString("comment_time"));
	                bean.setComment_writer_id(commentWriterId);
	                bean.setComment_writer(rs.getLong("comment_writer"));
	                bean.setComment_post_no(rs.getLong("comment_post_no"));
	                list.add(bean);
	            }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt, rs);
	    }
	    return list;
	}

	public String findUser(Long comment_writer)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String result = null;
		try {
			con = pool.getConnection();
			sql = "SELECT member.mem_id AS writer_id FROM comment "
					+ "JOIN member ON comment.comment_writer = member.mem_no "
					+ "WHERE comment.comment_writer = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, comment_writer);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getString("writer_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return result;
	}

	
	/*
	 * public Long member_no(String mem_id) { Connection con = null;
	 * PreparedStatement pstmt = null; String sql = null; ResultSet rs = null; Long
	 * result = 0L; try { con = pool.getConnection(); sql =
	 * "SELECT distinct member.mem_no FROM member JOIN comment ON member.mem_id = ?"
	 * ; pstmt = con.prepareStatement(sql); pstmt.setString(1 , mem_id); rs =
	 * pstmt.executeQuery(); if (rs.next()) { result = rs.getLong("mem_no"); } }
	 * catch (Exception e) { e.printStackTrace(); } finally {
	 * pool.freeConnection(con, pstmt, rs); } return result; }
	 */
	
	// 댓글 입력 처리
	public boolean insertComment(HttpServletRequest req)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		int result = 0;
		Long comment_writer = 0L;
		try {
			con = pool.getConnection();
			sql = "SELECT distinct member.mem_no FROM member JOIN comment ON member.mem_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("comment_writer"));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				comment_writer = rs.getLong("mem_no");
				result = 1;
			}
			if (result == 1)
			{
			pool.freeConnection(con, pstmt, rs);
			con = pool.getConnection();
			sql = "INSERT INTO comment(comment_content, comment_time, comment_writer, comment_post_no)"
					+ "VALUES (?, now(), ?, ?)";
			pstmt = con.prepareStatement(sql);
			System.out.println("comment_content" + req.getParameter("comment_content"));
			System.out.println("comment_writer" + comment_writer);
			System.out.println("comment_post_no" + req.getParameter("comment_post_no"));
			pstmt.setString(1, req.getParameter("comment_content"));
			pstmt.setLong(2, comment_writer);
			pstmt.setLong(3, Long.parseLong(req.getParameter("comment_post_no")));
			if (pstmt.executeUpdate() == 1)
			{ flag = true; } 
		} else {
			flag = false;
		}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	
}
