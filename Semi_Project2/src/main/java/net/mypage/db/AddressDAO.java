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


public class AddressDAO {
	private DataSource ds;
	public AddressDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception ex) {
			System.out.println("DB 연결 실패 : " +ex);
			return;
		}
	}
	
	public List<AddressBean> getList(String id) {
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		String board_list_sql = "select *"
				+"from addresslist where id=?";
		
		List<AddressBean> list = new ArrayList<AddressBean>();
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(board_list_sql.toString());//toStrin()없애도 내부적으로 메서드를 사용해준다.
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			//DB에서 가져온 데이터를 VO객체에 담는다.
			while(rs.next()) {//더이상 읽을 데이터가 없을때까지 반복
				AddressBean address = new AddressBean();
				address.setAddress_name(rs.getString("address_name"));
				address.setAddress_receiver(rs.getString("address_receiver"));
				address.setAddress_phone(rs.getString("address_phone"));
				address.setAddress(rs.getString("address"));
				list.add(address);//값을 담은 객체를 리스트에 저장
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

	public int insert(AddressBean address) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result =0;
		try {
			conn = ds.getConnection();
			
			String sql = "insert into addresslist (address_id, address_name, address_receiver, address_phone, address, address_post)"
					+ "  values(?,?,?,?,?,?)";
			//id의 최대값을 구하는데 데이터가 존재하지 않아 Null
			//>nvl(max(id),0)+1 : id의 최대값이 존재하지 않는 경우 0을 넣고, 1씩 증가 
			//id 프라이머리키에 해당 > 값을 하나씩 증가시키는 방법 : 시퀀스 이용 또는 최대값을 이용해 값을 하나씩 증가시킨다.
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, address.getAddress_id());
				pstmt.setString(2, address.getAddress_name());
				pstmt.setString(3, address.getAddress_receiver());
				pstmt.setString(4, address.getAddress_phone());
				pstmt.setString(5, address.getAddress());
				pstmt.setInt(6, address.getAddress_post());
				
				result = pstmt.executeUpdate();
		//primary key 제약조건 위반 경우 발생 에러
		}catch(Exception ex) {
			ex.printStackTrace();
		} finally {
				if(pstmt !=null)
					try{
						pstmt.close();
					} catch(SQLException ex) {
						
						ex.printStackTrace();
					}
				if(conn != null)
			try {
					conn.close();//DB연결을 끊는다.
			}catch (SQLException ex) {
			}
		}//finally
		return result;
	}

}
