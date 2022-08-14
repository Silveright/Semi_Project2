package net.main.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberSendPhoneAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Naver_Sens message = new Naver_Sens();
		String tel = "01099863158";
		String rand = "11111";
		message.send_msg(tel, rand);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);    
		forward.setPath("mainpage/selfCerti.jsp");

		return forward; 		
	}
}
