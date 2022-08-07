package net.main.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CustomerDAO {
	private DataSource ds;
	
	//생성자에서 JNDI에서 리소스를 참조하여 Connection 객체를 얻어옵니다.	
	public CustomerDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}
	
	public int isId(String id)	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1; //DB에 해당 id가 없습니다.
		try {
			con = ds.getConnection();
			
			String sql = "select id from  where id=?";			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { 
				result = 0;
			}
		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if (con != null)
					con.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
		}
	
	public int isId(String id, String pass)	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1; //아이디가 존재하지 않습니다.
		try {
			con = ds.getConnection();
			
			String sql = "select id,password from member where id=?";			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { 
				if(rs.getString(2).equals(pass)) {    //getString(2)는 password를 말함
					result = 1;	//아이디와 비밀번호 일치하는 경우
				} else {					
					result = 0; //비밀번호가 일치하지 않는 경우
				}
			}
		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			if (rs != null)
			  try {
				rs.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}			
			if (pstmt != null)
			  try {
				pstmt.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			if (con != null)
			  try {
				con.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
}
