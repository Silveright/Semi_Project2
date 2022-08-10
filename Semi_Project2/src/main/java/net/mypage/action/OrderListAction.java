package net.mypage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mypage.db.Order_infoDAO;
import net.mypage.db.Orderlist;


public class OrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		String id = request.getParameter("id");
		
		Order_infoDAO dao = new Order_infoDAO();
		
		List<Orderlist> list = null;
		list=dao.getList(id);
		
		List<Orderlist> cancel = null;
		cancel = dao.getCancel(id);

		if(list==null) {
			forward.setPath("error/error.jsp");
			forward.setRedirect(false);
			request.setAttribute("message", "주문 정보가 존재하지 않습니다.");
			return forward;
		}
		
		request.setAttribute("list", list);
		request.setAttribute("cancel", cancel);
		forward.setRedirect(false);
		forward.setPath("mypage/OrderList.jsp");
		return forward;
	}

}
