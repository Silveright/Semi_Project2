package net.main.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberIdFindSuccessAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ActionForward forward = new ActionForward();
		forward.setPath("mainpage/idFindSuccess.jsp");
		forward.setRedirect(false); 
		return forward;
	}
}
