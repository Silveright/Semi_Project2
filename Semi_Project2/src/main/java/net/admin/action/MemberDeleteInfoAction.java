package net.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.Customer;
import net.admin.db.CustomerDAO;


public class MemberDeleteInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CustomerDAO customerdao = new CustomerDAO();
		Customer c = new Customer();
		String id = request.getParameter("id");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = customerdao.delete(id);
		if(result == 1) {
			out.println("<script>");
			out.println("alert('삭제 성공입니다.');");
			out.println("location.href='memberlist.com'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원 삭제 실패입니다.');");
			out.println("history.back();");
			out.println("</script>");
			
		}
		out.close();
		ActionForward forward = new ActionForward();
		forward.setPath("adminpage/MemberList.jsp");
		forward.setRedirect(false);
		request.setAttribute("customerinfo", c);
		return forward;
		
		
	}

}
