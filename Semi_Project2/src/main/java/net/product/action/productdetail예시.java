package net.product.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.product.db.ProductBean예시;
import net.product.db.ProductDAO예시;

public class productdetail예시 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDAO예시 dao = new ProductDAO예시();
		ProductBean예시 product = new ProductBean예시();
		
		int num = Integer.parseInt(request.getParameter("product_code"));
		
		product = dao.getDetail(num);
		
		if(product==null) {
			System.out.println("제품 상세보기 실패");
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			request.setAttribute("message", "상품 데이터를 읽지 못했습니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		System.out.println("상세보기 성공");
		
		request.setAttribute("product", product);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("product/detail.jsp");
		return forward;
	}

}
