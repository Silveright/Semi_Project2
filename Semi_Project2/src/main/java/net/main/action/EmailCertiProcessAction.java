package net.main.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class EmailCertiProcessAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String code_input = request.getParameter("code_input");
		String code_send = String.valueOf(session.getAttribute("certification"));

		System.out.println("code_input=" + code_input);
		System.out.println("code_send=" + code_send);
		
		PrintWriter out = response.getWriter();

		if(code_input.equals(code_send)) {
			out.print(1);
		} else {
			out.print(-1);
		}
		
		session.invalidate();
		return null; 
	}
}
