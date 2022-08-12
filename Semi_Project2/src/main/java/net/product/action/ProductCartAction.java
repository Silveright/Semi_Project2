package net.product.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.product.db.CartDAO;
import net.product.db.ProductBean;
import net.product.db.ProductDAO;

public class ProductCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		session.setAttribute("id", "id");
		
		String id = (String)session.getAttribute("id");
		
		if(id!=null) {
			//카트에 담기
			CartDAO dao = new CartDAO();
			CartDTO dto
			//product_code=1&size=xs&size=black&p_num1=1&tabs=on&num=1&id=
			dto.setProduct_code(request.getParameter("product_code"));
			
			
		}else {
			
			//로그인 페이지로 이동해라
		}
		
		
		return null;
		
		
		
	}

}
