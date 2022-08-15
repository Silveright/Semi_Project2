package net.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.db.Customer;
import net.admin.db.CustomerDAO;


//public class MemberUpdateAction implements Action {
//
//	@Override
//	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		ActionForward forward = new ActionForward();
//		HttpSession session = request.getSession(); //로그인 정보를 세션에 담아야 한다.
//		String id = (String) session.getAttribute("id");
//			
//		CustomerDAO customerdao = new CustomerDAO();
//		Customer c = customerdao.member_info(id);
//		
//		forward.setPath("adminpage/memberinfo");
//		forward.setRedirect(false);
//		request.setAttribute("customerinfo", c);
//		return forward;
//			
//			
//	}
//
//
//}
