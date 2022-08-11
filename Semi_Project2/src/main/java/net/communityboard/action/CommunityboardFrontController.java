package net.communityboard.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mypage.action.Action;
import net.mypage.action.ActionForward;

@WebServlet("*.co")
public class CommunityboardFrontController extends javax.servlet.http.HttpServlet{
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
		case "/noticelist.co":
			action = new NoticeListAction();
			break;
		case "/noticeview.co":
			action = new NoticeViewAction();
			break;
		case "/faqlist.co":
			action = new FAQListAction();
			break;
		case "/qnalist.co":
			action = new QnaListAction();
			break;
	
		}
		
		forward = action.execute(request, response);

		if (forward != null) {
			if (forward.isRedirect()) {// 리다이렉트 됩니다.
				response.sendRedirect(forward.getPath());
			} else {// 포워딩됩니다.
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	
	}
	
	


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doProcess(request, response);
	}
}
		
