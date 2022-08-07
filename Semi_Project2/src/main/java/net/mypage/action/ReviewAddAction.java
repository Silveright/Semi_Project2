package net.mypage.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.action.ActionForward;
import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class ReviewAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		ActionForward forward = new ActionForward();
		
		String realFolder ="";
		
		String saveFolder="boardupload";// webapp/boardupload
		
		int fileSize= 5*1024*1024;//파일 최대 크기 5MB
		
		//실제 저장경로 지정
		ServletContext sc = request.getServletContext();
		realFolder = sc.getRealPath(saveFolder);
		System.out.println("realFolder=" + realFolder);
		boolean result=false;
		try{
			MultipartRequest multi = new MultipartRequest(request, 
										realFolder,
										fileSize,
										"utf-8",
								new DefaultFileRenamePolicy());
			
			//BoardBean 객체에 글 등록 폼에서 입력받은 정보들을 저장한다.
			boarddata.setBoard_name(multi.getParameter("board_name"));
			boarddata.setBoard_pass(multi.getParameter("board_pass"));
			boarddata.setBoard_subject(multi.getParameter("board_subject"));
			boarddata.setBoard_content(multi.getParameter("board_content"));
			
			//시스템 상에 업로드된 실제 파일명
			String filename =multi.getFilesystemName("board_file");
			boarddata.setBoard_file(filename);
			
			//글 등록 처리를 위해 DAO의 boardInsert메서드 호출
			//글 등록 폼에서 입력한 정보가 저장되어있는 boarddata객체를 전달한다.
			result=boarddao.boardInsert(boarddata);
			
			//글 등록에 실패할 경우 false 반환
			if(result==false) {
				System.out.println("게시판 등록 실패");
				forward.setPath("error/error.jsp");
				request.setAttribute("message", "게시판 등록 실패입니다.");
				forward.setRedirect(false);
				return forward;
			}
			System.out.println("게시판 등록 완료");
			
			//글 등록이 완료되면 글 목록을 보여주기 위해 :BoardList.bo로 이동한다.
			//Redirect여부를 true로 설정
			forward.setRedirect(true);
			forward.setPath("BoardList.bo");//이동할 경로 지정
			return forward;
			
			
		}catch(IOException e){
			forward.setPath("error/error.jsp");
			request.setAttribute("message", "게시판 업로드 실패입니다.");
			forward.setRedirect(false);
			return forward;
		}
	}

}
