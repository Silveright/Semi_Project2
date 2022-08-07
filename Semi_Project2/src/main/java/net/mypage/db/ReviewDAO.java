package net.mypage.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class ReviewDAO {
	private DataSource ds;
	public ReviewDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception ex) {
			System.out.println("DB 연결 실패 : " +ex);
			return;
		}
	}

	public int getListCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x =0;//db에 해당 아이디가 존재하지 않는 경우
		
		try {
			conn = ds.getConnection();
			String select_sql = "select count(*) from review";
			//PreparedStatement 객체 얻기
			pstmt = conn.prepareStatement(select_sql.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
					x=rs.getInt(1);
			}
		}catch(Exception se) {
			System.out.println("getListCount()에러:" +se);
			se.printStackTrace();
		} finally {
			if (rs!=null)
			try {
					rs.close();
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
			if(pstmt != null)
			try {
					pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
			if(conn!=null)
			try {
					conn.close();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
		}//finally end
		return x;
	}

	public List<ReviewBean> getList(int page, int limit) {
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		//page:페이지 limit: 페이지 당 목록 수 board_re_ref desc, board_re_seq asc에 의해 정렬한것을
		//조건절에 맞는 rnum의 범위만큼 가져오는 쿼리문
		String board_list_sql = "select * "
				+ "from "
				+ " (select rownum rnum, review_num, review_name, "
				+ " review_pass, review_subject,review_content, "
				+ " review_file, review_re_ref, review_re_lev,  review_re_seq, "
				+ " review_readcount, review_date from "
				+ " (SELECT * FROM review"
				+ " ORDER BY review_re_ref DESC, "
				+ " review_re_seq ASC)"
				+ " where rownum<=?) "
				+ " where rnum>=? and rnum<=?";
		
		List<ReviewBean> list = new ArrayList<ReviewBean>();
		//한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지...
		int startrow = (page -1) * limit +1; //읽기 시작할 row번호 (1	11	   21	  31...
		int endrow = startrow + limit -1;//읽을 마지막 row번호     (10	20	   30	  40...
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(board_list_sql.toString());//toStrin()없애도 내부적으로 메서드를 사용해준다.
			pstmt.setInt(1, endrow);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			
			//DB에서 가져온 데이터를 VO객체에 담는다.
			while(rs.next()) {//더이상 읽을 데이터가 없을때까지 반복
				ReviewBean r = new ReviewBean();
				r.setReview_num(rs.getInt("review_num"));
				r.setReview_name(rs.getString("review_name"));
				r.setReview_pass(rs.getString("review_pass"));
				r.setReview_subject(rs.getString("review_subject"));
				r.setReview_content(rs.getString("review_content"));
				r.setReview_file(rs.getString("review_file"));
				r.setReview_re_ref(rs.getInt("review_re_ref"));
				r.setReview_re_lev(rs.getInt("review_re_lev"));
				r.setReview_re_seq(rs.getInt("review_re_seq"));
				r.setReview_readcount(rs.getInt("review_readcount"));
				r.setReview_date(rs.getString("review_date"));
				list.add(r);//값을 담은 객체를 리스트에 저장
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getBoardList() 에러: " +e);
		} finally {
			if(rs!=null)
			try {
					rs.close(); 
			} catch(SQLException e) {
				e.printStackTrace();
			}
			if(pstmt !=null)
			try {
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(conn != null)
			try {
					conn.close();//DB연결을 끊는다.
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		return list;
	}

	public int getListCount(String field, String value) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x =0;
		
		try {
			conn = ds.getConnection();
			String sql = "select count(*) from review "
					+ "where " + field + " like ?";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+value+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("getListCount() 에러: " +ex);
		} finally {
			if(rs !=null)
			try {
					rs.close();
			} catch (SQLException ex) {
				System.out.println(ex.getMessage());
				ex.printStackTrace();
			}
			if(pstmt != null)
			try {
				pstmt.close();//DB연결을 끊는다.
			}catch (Exception ex) {
				System.out.println(ex.getMessage());
				ex.printStackTrace();
			}
		}//finally end
		return x;
	}

	public List<ReviewBean> getList(String field, String value, int page, int limit) {
		List<ReviewBean> list = new ArrayList<ReviewBean>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "select * "
					+ "from  (select rownum rnum, review_num, review_name, "
					+ " 	  review_pass, review_subject,review_content, "
					+ "  	  review_file, review_re_ref, review_re_lev,  review_re_seq, "
					+ "   	  review_readcount, review_date"
					+ "    	  from (SELECT * FROM review "
					+ "				where " + field + " like ?"
					+ " 			ORDER BY review_re_ref DESC, "
					+ " 			review_re_seq ASC)"
					+ " 			where rownum<=?) "
					+ " 			where rnum>=? and rnum<=?";
			
			
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+value+"%");
			//한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지...
			int startrow = (page -1) * limit +1; 
						//읽기 시작할 row번호 (1	11	   21	  31...
			int endrow = startrow + limit -1;
						//읽을 마지막 row번호     (10	20	   30	  40...
			pstmt.setInt(2, endrow);
			pstmt.setInt(3, startrow);
			pstmt.setInt(4, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewBean r = new ReviewBean();
				r.setReview_num(rs.getInt("review_num"));
				r.setReview_name(rs.getString("review_name"));
				r.setReview_pass(rs.getString("review_pass"));
				r.setReview_subject(rs.getString("review_subject"));
				r.setReview_content(rs.getString("review_content"));
				r.setReview_file(rs.getString("review_file"));
				r.setReview_re_ref(rs.getInt("review_re_ref"));
				r.setReview_re_lev(rs.getInt("review_re_lev"));
				r.setReview_re_seq(rs.getInt("review_re_seq"));
				r.setReview_readcount(rs.getInt("review_readcount"));
				r.setReview_date(rs.getString("review_date"));
				list.add(r);//값을 담은 객체를 리스트에 저장
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("getList() 에러: " +ex);
		} finally {
			if(rs !=null)
			try {
					rs.close();
			} catch (SQLException ex) {
				System.out.println(ex.getMessage());
				ex.printStackTrace();
			}
			if(pstmt != null)
			try {
				pstmt.close();//DB연결을 끊는다.
			}catch (Exception ex) {
				System.out.println(ex.getMessage());
				ex.printStackTrace();
			}
		}//finally end
		return list;
	}
	
}