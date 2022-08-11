package net.main.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import org.apache.commons.lang3.RandomUtils;


public class MemberSendEmailAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String email = request.getParameter("email");
		String receiver = "";
		
		if(email.contains("@")) {
			receiver = email;
		} else {
			String domain = request.getParameter("domain");
			String sel_domain = request.getParameter("sel_domain");
			System.out.println(email);
			System.out.println(domain);
			System.out.println(sel_domain);
			
			if(sel_domain == "") {
				receiver = email + "@" + domain;
			} else {
				receiver = email + "@" + sel_domain;
			}
		}		
		System.out.println("받는 사람 = " + receiver);		
		
		String sender = "bullard90@naver.com";
		String subject = "안녕하세요 Online Shop입니다";
		int certification = RandomUtils.nextInt(100000, 1000000);
		String content = "<h1>Code : <h1>" + "<strong>" + certification + "</strong>";  
				
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();				


	
		
		/* JavaMail을 사용하여 이메일을 전송하기 위한 3가지 절차는 다음과 같습니다.
			1. 호스트이름, 사용자명, 비밀번호 등과 같은 호스트의 모든 정보를 저장하는 Session객체를 얻습니다.
			2. 메시지를 구성합니다.
			3. 메시지를 보냅니다
		*/
		//SMTP 서버 주소를 지정합니다.
		String server = "smtp.naver.com";
		int port=587;
		try{
			//서버 정보를 Properties 객체에 저장합니다.
			Properties properties = new Properties();
			
			//SMTP 서버 정보 설정
			//네이버일 경우 smtp.naver.com
			properties.put("mail.smtp.host", server);
			properties.put("mail.smtp.port", port);
			
			//SSL(Secure Sockets Layer)과 같은 TLS(전송 계층 보안-Transport Layer Security)는
			//네트워크를 통해 전송될때 데이터의 보안을 유지하기 위한 암호화 프로토콜입니다.
			//메일 전송에 사용되는 프로토콜을 TLSv1.2로 지정합니다.
			properties.put("mail.smtp.ssl.protocols","TLSv1.2");
			
			//저장한 Properties객체의 값으로 세션의 인스턴스를 생성합니다.
			//public static Session getInstance(Properties props)
			//Session클래스는 사용자의 이름, 암호, 메일 서버와 같이
			//메일 서버를 이용하는데 필요한 이메일 계정 정보를 관리합니다.
			Session s = Session.getInstance(properties);
			
			Address sender_address=new InternetAddress(sender);
			Address receiver_address=new InternetAddress(receiver);
			
			Message message = new MimeMessage(s);
			
			message.setHeader("content-type", "text/html;charset=euc-kr");
			
			message.setFrom(sender_address);
			
			message.addRecipient(Message.RecipientType.TO, receiver_address);
			
			message.setSubject(subject);
			
			message.setContent(content, "text/html; charser=euc-kr");
			
			message.setSentDate(new java.util.Date());
			
			Transport transport = s.getTransport("smtp");
			
			transport.connect(server, MyEmailInfo.naverid, MyEmailInfo.naverpass);
			
			transport.sendMessage(message, message.getAllRecipients());
			
			transport.close();
			
			HttpSession session = request.getSession();		
			session.setAttribute("certification", certification);
			writer.println("<script>alert('인증메일이 정상적으로 전송되었습니다'); history.back(); </script>"); 
		}catch(Exception e) {
			writer.println("<script>alert('전송할 수 없는 이메일입니다.'); location.href='mainpage/joinForm.jsp';</script>"); 
			e.printStackTrace();
		} finally {
			writer.close();
		}
		return null;
	}
}