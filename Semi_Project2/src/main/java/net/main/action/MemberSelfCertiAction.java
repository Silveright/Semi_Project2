package net.main.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.main.db.CustomerDAO;


public class MemberSelfCertiAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String certi_type = request.getParameter("certi");
		System.out.println("name=" + name);
		System.out.println("email=" + email);
		System.out.println("phone=" + phone);
		System.out.println("certi_type=" + certi_type);
		String password = "";
		
		CustomerDAO cdao = new CustomerDAO();

		if(certi_type.equals("e")) {
			password = cdao.passFindEmail(id,name,email);
			System.out.println("password=" + password);
		} else if(certi_type.equals("p")) {
			password = cdao.passFindPhone(id,name,phone);
			System.out.println("password=" + password);
		}
		
		if(password != "") {

			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("email", email);
			session.setAttribute("phone", phone);
			session.setAttribute("certi_type", certi_type);			
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);    
			forward.setPath("mainpage/selfCerti.jsp");
			return forward; 
		} else {
			String message = "해당하는 password를 찾을 수 없습니다. 다시 입력해주세요.";

			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("location.href='passFind.net';");
			out.println("</script>");
			out.close();
			return null;
		}
	}
}

