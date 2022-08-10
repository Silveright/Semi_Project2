package net.communityboard.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDAO {

	
	private DataSource ds;
	
	//생성자에서 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.
	public BoardDAO() {
	try {
		Context init = new InitialContext();
		ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	} catch (Exception ex) {
		System.out.println("DB 연결 실패 : " + ex);
	}
}

	
	
	//글 갯수 구하기
	public int getListCount() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int n = 0; 
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				n = rs.getInt(1);
			}
		
		}catch (Exception e) {
			e.printStackTrace();
			} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				}catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}//finally
		return n;
		}

	
	
	public List<NoticeBean> getNoticeList(int page, int limit) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// page : 페이지
		// limit : 페이지 당 목록의 수
		// board_re_ref desc, board_re_seq asc에 의해 정렬한 것을
		// 조건절에 맞는 rnum의 범위 만큼 가져오는 쿼리문입니다.
		
		String board_list_sql = "select *"
				+ " from (select rownum rnum, j.*"
				+ "		from ("
				+ "			  select board.*, nvl(cnt,0) as cnt"
				+ "			  from board left outer join (select comment_board_num,count(*) cnt"
				+ "                             			 from comm"
				+ "                            			 group by comment_board_num)"
				+ "			  on board_num=comment_board_num"
				+ "			  order by BOARD_RE_REF desc,"
				+ "			  BOARD_RE_SEQ asc"
				+ "			) j"
				+ "		where rownum<= ?"
				+ "		)"
				+ " where rnum>=? and rnum<=?";
		
		List<NoticeBean> list = new ArrayList<NoticeBean>();
		//한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지 ...
		int startrow = (page -1) * limit + 1; //읽기 시작할 row 번호(1 11 21 31 ...
		int endrow = startrow + limit -1;    //읽을 마지막 row 번호 (10 20 30 40 ...
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, endrow);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			
			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while (rs.next()) {
				NoticeBean notice = new NoticeBean();
				notice.setNotice_num(rs.getInt("notice_num"));
				notice.setNotice_id(rs.getString("notice_id"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_file(rs.getString("notice_file"));
				notice.setNotice_date(rs.getString("notice_date"));
				notice.setNotice_content(rs.getString("notice_content"));
				list.add(notice);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
			}finally {
				if (rs != null)
					try {
						rs.close();
					}catch (SQLException ex) {
						ex.printStackTrace();
					}
				if (pstmt != null)
					try {
						pstmt.close();
					}catch (SQLException e) {
						System.out.println(e.getMessage());
					}
				if (con != null)
					try {
						con.close();
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
				}//finally
			
		return list;
	}	//getNoticelist() 메서드 end



	


}
