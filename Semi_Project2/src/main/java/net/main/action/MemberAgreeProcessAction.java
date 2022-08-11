package net.main.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.main.db.Customer;
import net.main.db.CustomerDAO;


public class MemberAgreeProcessAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("pass");
		String name = request.getParameter("name");
		
		String jumin1 = request.getParameter("jumin1");
		String jumin2 = request.getParameter("jumin2");
		String jumin = jumin1 + "-" + jumin2;
		
		String gender = request.getParameter("gender");
		String post = request.getParameter("post");
		
		String address_front = request.getParameter("address");
		String adress_detail = request.getParameter("adress_detail");
		String address = address_front + adress_detail;
		
		String phone_back = request.getParameter("phone");
		String phone = "010" + phone_back;
		System.out.println(phone);
		
		String email_front = request.getParameter("email");
		String domain = request.getParameter("domain");
		String sel_domain = request.getParameter("sel_domain");
		String email = email_front + "@";
		if(sel_domain == "") {
			email += domain;
		} else {
			email += sel_domain;
		}
		
		Customer c = new Customer();
		c.setId(id);
		c.setPassword(password);
		c.setName(name);
		c.setJumin(jumin);
		c.setGender(gender);
		c.setPost(post);
		c.setAddress(address);
		c.setPhone(phone);
		c.setEmail(email);
		
		CustomerDAO dao = new CustomerDAO();
		int result = dao.insert(c);
		
		HttpSession session = request.getSession();
		session.setAttribute("join_result", c);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);    
		forward.setPath("mainpage/agree.jsp");
		return forward; 
	}
}
