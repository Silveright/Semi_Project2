package net.communityboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mypage.action.Action;
import net.mypage.action.ActionForward;

public class NoticeViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("community_board/noticeview.jsp"); //글 내용 보기 페이지로 이동하기 위해 경로를 설정합니다.
		return forward;
	}

}
