package net.mypage.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class MyPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();

		String id= "id";//request.getParameter("id");
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		
		if(id==null) {
			String message="로그인이 필요한 기능입니다.";
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('"+message+"');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}else {
			forward.setRedirect(false);//주소변경없이 jsp페이지의 내용을 보여준다.
			forward.setPath("mypage/Mypage.jsp");
			return forward;
		}
	}

}
