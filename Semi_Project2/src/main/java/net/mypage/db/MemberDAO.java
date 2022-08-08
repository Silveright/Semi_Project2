package net.mypage.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
private DataSource ds;
	
	//생성자에서 JNDI 리소스를 참조하여 Connection 객체를 얻어온다.
	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception ex) {
			System.out.println("DB 연결 실패 : " +ex);
		}
	}

	public MemberBean member_info(String id) {
		MemberBean m = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			/*context.xml에 생성해 놓은 (JNDI에 설정해 놓은) 리소스 jdbc/OracleDB를
			  참조하여 Connection 객체를 얻어온다.*/
			conn = ds.getConnection();
			
			String select_sql = "select * from member where id=?";
			
			//PreparedStatement 객체 얻기
			pstmt = conn.prepareStatement(select_sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {//더이상 읽을 데이터가 없을 때까지 반복
				m = new MemberBean();
				m.setId(rs.getString("id"));
				m.setPassword(rs.getString("password"));
				m.setName(rs.getString("name"));
				m.setJumin(rs.getString("jumin"));
				m.setGender(rs.getString("gender"));
				m.setAddress1(rs.getString("address1"));
				m.setAddress2(rs.getString("address2"));
				m.setTel_cell(rs.getString("tel_cell"));
				m.setEmail(rs.getString("email"));
			}
		}catch(Exception se) {
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
				System.out.println(e.getMessage());
			}
			if(conn!=null)
			try {
					conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}//finally end
		return m;
	}

	public int update(MemberBean m) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result =0;
		
		try {
			conn = ds.getConnection();
			
			String select_sql = "update member set "
					+ "name =?, "
					+ "age = ?, "
					+ "gender = ?, "
					+ "email = ?, "
					+ "memberfile = ?"
					+ "where id = ? ";
			//PreparedStatement 객체 얻기
			pstmt = conn.prepareStatement(select_sql.toString());
			pstmt.setString(1, m.getName());
			pstmt.setInt(2, m.getAge());
			pstmt.setString(3, m.getGender());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getMemberfile());
			pstmt.setString(6, m.getId());
			
			result = pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt !=null)
			try {
					pstmt.close();
			} catch (SQLException ex) {
				System.out.println(ex.getMessage());
				ex.printStackTrace();
			}
			if(conn != null)
			try {
					conn.close();//DB연결을 끊는다.
			}catch (Exception ex) {
				System.out.println(ex.getMessage());
				ex.printStackTrace();
			}
		}//finally end
		return result;
	}

}
