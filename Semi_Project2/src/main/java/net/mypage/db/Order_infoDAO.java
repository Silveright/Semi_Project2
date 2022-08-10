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



public class Order_infoDAO {
	private DataSource ds;
	public Order_infoDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception ex) {
			System.out.println("DB 연결 실패 : " +ex);
			return;
		}
	}
	
	public List<Orderlist> getList(String id) {
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		String board_list_sql = "select o.id, o.order_date, p.product_image, p.product_name, "
				+ "oit.product_count, oit.product_price, oit.orderitem_code, oit.orderstate "
				+ "from product p, order_info o, order_item oit"
				+ " where p.product_code=oit.product_code"
				+ " and o.order_code=oit.order_code"
				+ " and o.id=?"
				+ "	and oit.orderstate='배송 전'";
		
		List<Orderlist> list = new ArrayList<Orderlist>();
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(board_list_sql.toString());//toStrin()없애도 내부적으로 메서드를 사용해준다.
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); 
			
			//DB에서 가져온 데이터를 VO객체에 담는다.
			while(rs.next()) {//더이상 읽을 데이터가 없을때까지 반복
				Orderlist orderlist = new Orderlist();
				orderlist.setOrder_date(rs.getString("order_date"));
				orderlist.setProduct_image(rs.getString("product_image"));
				orderlist.setProduct_name(rs.getString("product_name"));
				orderlist.setProduct_count(rs.getInt("product_count"));
				orderlist.setOrderstate(rs.getString("orderstate"));
				orderlist.setId(rs.getString("id"));
				orderlist.setOrderitem_code(rs.getInt("orderitem_code"));
				orderlist.setProduct_price(rs.getInt("product_price"));
				list.add(orderlist);//값을 담은 객체를 리스트에 저장
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("orderlist() 에러: " +e);
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

	public List<Orderlist> getCancel(String id) {
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		String board_list_sql = "select o.id, o.order_date, p.product_image, p.product_name, "
				+ "oit.product_count, oit.product_price, oit.orderstate, oit.orderitem_code "
				+ "from product p, order_info o, order_item oit"
				+ " where p.product_code=oit.product_code"
				+ " and o.order_code=oit.order_code"
				+ " and o.id=?"
				+ "	and oit.orderstate='배송 취소'";
		
		List<Orderlist> list = new ArrayList<Orderlist>();
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(board_list_sql.toString());//toStrin()없애도 내부적으로 메서드를 사용해준다.
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			//DB에서 가져온 데이터를 VO객체에 담는다.
			while(rs.next()) {//더이상 읽을 데이터가 없을때까지 반복
				Orderlist orderlist = new Orderlist();
				orderlist.setOrder_date(rs.getString("order_date"));
				orderlist.setProduct_image(rs.getString("product_image"));
				orderlist.setProduct_name(rs.getString("product_name"));
				orderlist.setProduct_count(rs.getInt("product_count"));
				orderlist.setOrderstate(rs.getString("orderstate"));
				orderlist.setOrderitem_code(rs.getInt("orderitem_code" ));
				orderlist.setId(rs.getString("id"));
				orderlist.setProduct_price(rs.getInt("product_price"));
				list.add(orderlist);//값을 담은 객체를 리스트에 저장
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("orderlist() 에러: " +e);
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

	public int update(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result =0;
		
		try {
			conn = ds.getConnection();
			
			String select_sql = "update order_item set "
					+ "orderstate='배송 취소'"
					+ "where orderitem_code = ? ";
			//PreparedStatement 객체 얻기
			pstmt = conn.prepareStatement(select_sql.toString());
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			if(result==1) {
				System.out.println("주문 취소 완료");
			}
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
