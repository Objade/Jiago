package com.itbank.service;

import java.io.IOException;
import java.util.Properties;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailService {

	@Value("classpath:account.txt")
	private Resource account;
	
	
	
	public int sendMail(String email, String sendNumber) throws IOException {
		
		
		Scanner sc = new Scanner(account.getFile());
		String accountInfo = null;
		while(sc.hasNextLine()) {
			accountInfo = sc.nextLine();
		}
		sc.close();
		String host = "smtp.naver.com";
		int port = 465;
		final String serverId = accountInfo.split("/")[0];
		final String serverPw = accountInfo.split("/")[1];
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
			String un = serverId;
			String pw = serverPw;
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		mailSession.setDebug(true);		
		
		

		Message mimeMessage = new MimeMessage(mailSession);
		

		String body = "";
        body += "<div style=\"width: 500px; height: 550px; font-family: Dongle;\">";
        body += "<img src=\"/resources/img/로고.png\" style=\"display: flex; width: 300px; margin: 0 auto;\">";
        body += "<div style=\"text-align: center; background-color: lightyellow;\">";   
        body += "<h1 style=\"background-color: lightgreen; padding: 25px; font-size: 50px;\">지아고 인증코드</h3>";     
        body += "<div style=\"text-align: justify; font-size: 30px;\">";
        body += "Jiago 사용자님,<br>";
        body += "귀하의 이메일 주소를 통해 Jiago 계정에 대한 액세스가 요청되었습니다. Jiago 인증 코드는 다음과 같습니다.<br>";
        body += "<strong style=\"color: red; display: flex; justify-content: center;\">[%s]</strong><br>";
        body += "이 코드를 요청하지 않았다면 다른 사람이 당신의 계정에 액세스하려고 시도하는 것일 수 있습니다. <br>";
        body += "누구에게도 이 코드를 전달하거나 제공하면 안 됩니다.<br>";
        body += "본 메일은 이 이메일 주소가 Jiago 계정의 복구 이메일로 등록되었기 때문에 발송되었습니다. <br>";
        body += "복구 이메일이 아닌 경우 Jiago 고객센터 1592-1924로 문의 바랍니다. 감사합니다.<br>";
        body += "<br><br>";
        body += "<strong style=\"display: flex; justify-content: center;\">Jiago 계정팀</strong>";
        body += "</div>";           		
        body += "</div>";
        body += "</div>";
    
    
		
		try {
			mimeMessage.setFrom(new InternetAddress("checkmate147@naver.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
			mimeMessage.setSubject("[설문을 자연에 담다 Jiago인증 메일 입니다.]");
//			mimeMessage.setText(text);
			body = String.format(body, sendNumber);
			mimeMessage.setContent(body, "text/html; charset=utf-8;");
			Transport.send(mimeMessage);
			return 1;
		} catch (AddressException e) {
			e.printStackTrace();
			System.out.println("잘못된 주소 입니다");
			return -1;
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("메세지 전송에 문제가 발생했습니다");
			return -2;
		}		
		
	}
	
}
