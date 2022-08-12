package net.communityboard.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.communityboard.db.FAQDAO;
import net.communityboard.db.FAQBean;

public class FAQListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		FAQDAO boarddao = new FAQDAO();
//		List<FaqBean> faqlist = new ArrayList();
//		//DB에서 List 조회 후 faqlist에 저장
//		
//		return faqlist;
		
		
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("community_board/FAQList.jsp");
		
		
		return forward;
	}

}
