package smtp;

import java.util.Map;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

//확장 라이브러리 설치 후 Authenticator클래스를 상속한다.
public class SMTPAuth extends Authenticator {
	
	/*
	NAVER SMTP서버에 로그인하기 위해 아래 메소드를 오버라이딩한다.
	*/
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		
		return new PasswordAuthentication("11111", "1234");
	}
	
	//해당 메소드를 통해 이메일을 발송한다.
	public boolean emailSending(Map<String, String> map) {
		
		//메일발송 성공 플래그
		boolean sendOk = false;
		
		//정보를 담을 객체
		Properties p = new Properties();
		
		// SMTP 서버에 접속하기 위한 정보들
		p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP	 
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new SMTPAuth();
			Session ses = Session.getInstance(p, auth);
			
			ses.setDebug(true);
			
			//메일제목
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(map.get("subject"));
			
			//보내는사람
			Address fromAddr = new InternetAddress(map.get("from"));
			msg.setFrom(fromAddr);
			
			//받는사람
			Address toAddr = new InternetAddress(map.get("to"));
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			
			//메일내용
			msg.setContent(map.get("content"), "text/html;charset=UTF-8");
			
			//메일발송
			Transport.send(msg);
			sendOk = true;
		}
		catch(Exception e) {
			sendOk = false;
			e.printStackTrace();
		}
		return sendOk;
	}
	
}
