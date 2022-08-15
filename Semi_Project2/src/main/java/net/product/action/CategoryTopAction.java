package net.product.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.product.db.ProductBean;
import net.product.db.ProductDAO;

public class CategoryTopAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        ActionForward forward = new ActionForward();
		
		ProductDAO dao = new ProductDAO();
		List<ProductBean> toplist = new ArrayList<ProductBean>();
		
		toplist = dao.getTopList();
		request.setAttribute("toplist", toplist); 
	
		forward.setPath("product/category-Top.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
