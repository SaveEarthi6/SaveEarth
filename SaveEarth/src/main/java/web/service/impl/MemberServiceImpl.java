package web.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import web.dao.face.MemberDao;
import web.dto.Mail;
import web.dto.Member;
import web.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired private MemberDao memberDao;
	//메일 autowired
	@Autowired private JavaMailSender mailSender;
	
	@Override
	public void join(Member memberParam) {
		
		memberDao.insert(memberParam);
		
	}

	@Override
	public boolean login(Member member) {
		
		int result = memberDao.selectCntByIdPw(member);
		
		if(result>0) {
			return true;
		} else {
		
		return false;
		 }
	}

	@Override
	public Member info(String loginid) {
		logger.info("loginid : {}", loginid);
		
		return memberDao.selectById(loginid);
	}
	
	@Override
	public boolean checkid(Member member) {
		
		int check = memberDao.checkid(member);
		
		if(check > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public Member findid(Member member) {
		
		return memberDao.selectIdByNameEmail(member);
			
	}

	@Override
	public void delete(String loginid) {
		logger.info("{}", loginid);
		memberDao.delete(loginid);
	}

	@Override
	public void update(Member member) { 
		logger.info("memberserviceimpl{}", member);

		
		
		memberDao.updateUser(member);
	}



	public int overlappedID(Member member) {
		
		int result = memberDao.overlappedID(member);
		return result;
	}
	
	@Override
	public int overlappedEmail(Member member) {
		
		return memberDao.overlappedEmail(member);
	}
	
	@Override
	public Member getUserInfo(String loginid) {
		
		return memberDao.selectInfoById(loginid);
	}

	@Override
	public int checkIdEmail(Member member) {
		
		int result = memberDao.existIdEmail(member);
		return result;
	}

	@Override
	public void temPw(Member member) {
		
		memberDao.updateTemPw(member);
	}

	@Override
	public void mailSend(Member member) {
		Mail mail = new Mail();
		mail.setAddress(member.getEmail());
		mail.setTitle("SaveEarth홈페이지 임시비밀번호 발송");
		mail.setContent(member.getId() + "님의 임시비밀번호는 "+member.getPw() + "입니다");
		
		SimpleMailMessage message = new SimpleMailMessage();
	    message.setTo(mail.getAddress());
	    message.setSubject(mail.getTitle());
	    message.setText(mail.getContent());
	    message.setFrom("saveearthtest@naver.com");
	    message.setReplyTo("saveearthtest@naver.com");
	    System.out.println("message"+message);
	    mailSender.send(message);	

		System.out.println("전송 완료!");
		
	}

	//access토큰 가져오기
	@Override
	public String getToken(String code) {

		 String access_Token="";
        String refresh_Token ="";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try{
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=afd568c5b46891ae3dde245d70d25e21"); // TODO REST_API_KEY 입력
            sb.append("&redirect_uri=http://localhost:8888/member/kakao"); // TODO 인가코드 받은 redirect_uri 입력
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            //결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        }catch (IOException e) {
            e.printStackTrace();
        }

        return access_Token;		
	}

	@Override
	public Member getKaKaoinfo(String access_token) {
		
		Member member = new Member();
        String reqURL = "https://kapi.kakao.com/v2/user/me";

        //access_token을 이용하여 사용자 정보 조회
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Authorization", "Bearer " + access_token); //전송할 header 작성, access_token전송

            //결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //Gson 라이브러리로 JSON파싱
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            Long id = element.getAsJsonObject().get("id").getAsLong();

            boolean hasEmail = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("has_email").getAsBoolean();
            String email = "";
            if (hasEmail) {
                email = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("email").getAsString();
            }

            System.out.println(id);
            System.out.println(email);
            
            String userid = String.valueOf(id);
            
            member.setId(userid);
            member.setEmail(email);
            
            br.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

        
        return  member;
        
	}

	
	

	







}
