package net.payment.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.payment.db.InterMemberDAO_SM;
import net.payment.db.MemberDAO_SM;
import net.payment.db.MemberVO_SM;

public class PaymentAction implements Action {

		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			/*
			// 아임포트 결제창을 사용하기 위한 전제조건은 먼저 로그인을 해야 하는 것이다.
			if( super.checkLogin(request) ) {
				// 로그인을 했으면
			*/	
//				String id = request.getParameter("id"); // 주소창에 넘어온 id
				
				HttpSession session = request.getSession();
				MemberVO_SM loginuser = (MemberVO_SM)session.getAttribute("loginuser");
				String id = loginuser.getId();
			/*	if(loginuser.getUserid().equals(id)) { // 로그인을 했으니 MemberVO는 null이 아님
					// 로그인한 사용자가 자신의 코인을 결제하는 경우
			*/		
					String coinmoney = request.getParameter("coinmoney");
					
					// 회원정보를 조회해서 뷰단에 보낸다.(getParameter로 넘어온 id를 이용)
					InterMemberDAO_SM mdao = new MemberDAO_SM();
					MemberVO_SM member = mdao.showMemberInfo(id); 
					

					request.setAttribute("email", member.getEmail()); 
					request.setAttribute("name", member.getName());
					request.setAttribute("mobile", member.getTel());
				
				//	super.setRedirect(false);
					super.setViewPage("/payment/payment.jsp");

	
				}else {
				// 로그인을 안 했으면
				String message = "결제를 하기 위해서는 먼저 로그인을 하세요!!";
				String loc = "javascript:history.back()";
				 
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				     
				super.setRedirect(false);
	
			}
	
		}

	}