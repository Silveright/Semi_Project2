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
			
			String sql = "select id from customer where id=?";			
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
		int result = -1; 
		try {
			con = ds.getConnection();
			
			String sql = "select id,password from customer where id=?";			
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

	public int insert(Customer c) {
		Connection con = null;
		PreparedStatement pstmt = null;		
		int result = 0;
		
		try {
			con = ds.getConnection();
			System.out.println("getConnection : insert()");
			
			String sql = "INSERT INTO customer "
					   + "(id, password, name, jumin, gender, post, address, phone, address_detail, email) "
					   + " VALUES (?,?,?,?,?,?,?,?,?,?) ";
							
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c.getId());
			pstmt.setString(2, c.getPassword());
			pstmt.setString(3, c.getName());
			pstmt.setString(4, c.getJumin());
			pstmt.setString(5, c.getGender());
			pstmt.setString(6, c.getPost());
			pstmt.setString(7, c.getAddress());
			pstmt.setString(8, c.getPhone());
			pstmt.setString(9, c.getAddress_detail());
			pstmt.setString(10, c.getEmail());
			result = pstmt.executeUpdate(); 
			
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {			
			result = -1;
			System.out.println("멤버 아이디 중복 에러입니다.");
		} catch (Exception e) {
			e.printStackTrace();			
		} finally {
			if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public String idFindEmail(String name, String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = ""; 
		try {
			con = ds.getConnection();
			
			String sql = "select id from customer where name=? and email=?";			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { 
				result = rs.getString("id");
				System.out.println("result=" + result);
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
	
	public String idFindPhone(String name, String phone) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = ""; 
		try {
			con = ds.getConnection();
			
			String sql = "select id from customer where name=? and phone=?";			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { 
				result = rs.getString("id");
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

	public String dateFind(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = ""; 
		try {
			con = ds.getConnection();
			
			String sql = "select register_date from customer where id=?";			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { 
				result = rs.getString("register_date");
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

	public String passFindEmail(String id, String name, String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = ""; 
		try {
			con = ds.getConnection();
			
			String sql = "select password from customer where id=? and name=? and email=?";			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { 
				result = rs.getString("password");
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

	public String passFindPhone(String id, String name, String phone) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = ""; 
		try {
			con = ds.getConnection();
			
			String sql = "select password from customer where id=? and name=? and phone=?";			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { 
				result = rs.getString("password");
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

	public int reset(String id, String newpass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = ds.getConnection();
		
			String sql = "update customer set password=? where id=? ";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, newpass);
			pstmt.setString(2, id);	
			result = pstmt.executeUpdate();
			System.out.println("result는" + result);

			} catch (Exception ex) {
				System.out.println("reset() 에러: " + ex);
				ex.printStackTrace();
			} finally {		
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
