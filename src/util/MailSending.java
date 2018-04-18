package util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSending {

	private MailSending() {

	}

	private static MailSending instance = new MailSending();

	public static MailSending getInstance() {
		return instance;
	}

	public void sendMail(String mailTitle, String mailContents, String toName, String toEmail) {
		String mailProtocol = "smtp";
		String mailHost = "smtp.gmail.com";
		String mailPort = "587";
		String mailId = "kkyzzang1993@gmail.com"; // 구글계정
		String mailPassword = "pslpyqviufmbkmxw"; // 구글계정 비밀번호
		String fromName = "RnbTeam2";
		String fromEmail = "-----"; // 보내는 사람 메일
		/*
		String mailTitle ="메일제목";
		String mailContents = "메일 내용";
		String toName = "---";
		String toEmail = "kwangyong_kang@rnbsoft.com"; // 받는사람메일*/
		String debugMode = "false";
		String authMode = "true";

		try {

			boolean debug = Boolean.valueOf(debugMode).booleanValue();

			Properties mailProps = new Properties();
			mailProps.put("mail.smtp.starttls.enable", "true");
			mailProps.setProperty("mail.transport.protocol", mailProtocol);
			mailProps.put("mail.debug", debugMode);
			mailProps.put("mail.smtp.host", mailHost);
			mailProps.put("mail.smtp.port", mailPort);
			mailProps.put("mail.smtp.connectiontimeout", "5000");
			mailProps.put("mail.smtp.timeout", "5000");
			mailProps.put("mail.smtp.auth", authMode);
			mailProps.put("mail.smtp.ssl.trust", "smtp.gmail.com");

			Session msgSession = null;

			if (authMode.equals("true")) {
				Authenticator auth = new MyAuthentication(mailId, mailPassword);
				msgSession = Session.getInstance(mailProps, auth);

			} else {
				msgSession = Session.getInstance(mailProps, null);
			}

			msgSession.setDebug(debug);

			MimeMessage msg = new MimeMessage(msgSession);
			msg.setFrom(new InternetAddress(fromEmail, fromName));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail, toName));
			msg.setSubject(mailTitle);
			msg.setContent(mailContents, "text/html; charset=utf-8");

			// 스태틱함수로 직접 보내지 않고 객체를 이용해서 보내고 객체를 닫아준다.
			Transport t = msgSession.getTransport(mailProtocol);

			try {
				t.connect();
				t.sendMessage(msg, msg.getAllRecipients());
			} finally {
				t.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

class MyAuthentication extends Authenticator {

	PasswordAuthentication pa;

	public MyAuthentication(String mailId, String mailPass) {
		pa = new PasswordAuthentication(mailId, mailPass);
	}

	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}