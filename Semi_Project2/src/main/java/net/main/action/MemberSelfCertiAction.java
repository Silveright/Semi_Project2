package net.main.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MemberSelfCertiAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String certi = request.getParameter("certi");
		System.out.println(certi);
		request.setAttribute("certi", certi);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);    
		forward.setPath("mainpage/selfCerti.jsp");
		return forward; 
	}
}
