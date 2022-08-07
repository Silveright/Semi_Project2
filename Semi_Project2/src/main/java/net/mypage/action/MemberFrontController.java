package net.mypage.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.pg")
public class MemberFrontController extends javax.servlet.http.HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " + RequestURI);
		
		
		String contextPath = request.getContextPath();
		System.out.println("contextPath = " + contextPath);
		
		String command = RequestURI.substring(contextPath.length());
		System.out.println("command = " + command);
		
		ActionForward forward = null;
		Action action = null;
		
		switch(command) {
		case "/mypage.pg":
			action = new MyPageAction();
			break;
			
		case "/reviewlist.pg":
			action = new ReviewListAction(); 
			break;
			
		/*
		 * case "/reviewaddaction.pg": action = new ReviewAddAction(); break;
		 * 
		 * case "/memberrivewlist.pg": action = new MemberReviewListAction(); break;
		 * 
		 * case "/rivewlist.pg": action = new ReviewListAction(); break;
		 */
		}
		
		forward = action.execute(request, response);
		
		
		if(forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher =
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request,response);
			}
		}
	
	
	}
			
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		doProcess(request, response);
	}
}
