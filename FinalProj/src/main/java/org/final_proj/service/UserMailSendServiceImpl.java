package org.final_proj.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.final_proj.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


@Service
public class UserMailSendServiceImpl implements UserMailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	//이메일 난수 만들기
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		
		do {
			num = ran.nextInt(75)+48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90)|| (num >= 97 && num <= 122)) {
				sb.append((char) num);
			}else {
				continue;
			}
			
			
		}while(sb.length() < size);
		if(lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	private boolean lowerCheck;
	private int size;
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	
	public void findPwd(String findid, String findname, String findmail, String key) {
		
		String key1 = getKey(false, 6);

		MimeMessage mail = mailSender.createMimeMessage();
		
		String htmlStr = "임시비밀번호는 "+key1+" 입니다";
		
		try {
			 mail.setSubject("[레시피슈퍼:p]고객님의 임시비밀번호가 발급되었습니다","utf-8");
			 mail.setText(htmlStr,"utf-8","html");
			 mail.addRecipient(RecipientType.TO, new InternetAddress(findmail));
			 mailSender.send(mail);
		} catch(MessagingException e) {
			e.printStackTrace();
		}
		
		//pwd 암호화
		System.out.println("Before Encoder : "+key1);
		key1 = bcryptPasswordEncoder.encode(key1);
		System.out.println("After Encoder : "+key1);
		//DB insert
		System.out.println("findID>> "+findid+" findName>>"+findname+" findMail>> "+findmail+" Key >> "+key1);
		
		memberMapper.findPwd(findid, findname, findmail, key1);
		System.out.println("메일 보내기 완료");
	}

}
