package net.mypage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mypage.db.AddressBean;
import net.mypage.db.AddressDAO;

public class addresslistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		AddressDAO dao = new AddressDAO();
		
		
		List<AddressBean> list = null;
		String id = request.getParameter("id");
		
		list=dao.getList(id);
	
		
		if(list != null) {
			
			forward.setRedirect(false);
			forward.setPath("mypage/AddressList.jsp");
			return forward;// BoardFrontController.java로 리턴된다.
		}
		return null;
	}

}
