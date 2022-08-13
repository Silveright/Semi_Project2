package net.main.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MemberResetAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		System.out.println("id는" + id);

		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);    
		forward.setPath("mainpage/resetpass.jsp");
		return forward; 
	}
}
