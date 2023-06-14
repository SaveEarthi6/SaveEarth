package web.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import web.dao.face.MemberDao;
import web.dto.Mail;
import web.dto.Member;
import web.dto.Naver;
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
	public Member info(String loginId) {
		logger.info("loginid : {}", loginId);
		
		return memberDao.selectById(loginId);
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
	public void delete(String loginId) {
		logger.info("{}", loginId);
		memberDao.delete(loginId);
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
	public Member getUserInfo(String loginId) {
		
		return memberDao.selectInfoById(loginId);
	}

	@Override
	public int checkIdEmail(Member member) {
		
		int result = memberDao.existIdEmail(member);
		return result;
	}

	@Override
	public void temPwSha(Member member) {
		
		memberDao.updateTemPwSha(member);
	}

	@Override
	public void mailSend(Member member) {
		Mail mail = new Mail();
		mail.setAddress(member.getUserEmail());
		mail.setTitle("SaveEarth홈페이지 임시비밀번호 발송");
		mail.setContent(member.getUserId() + "님의 임시비밀번호는 "+member.getUserPw() + "입니다"+ "로그인하고 비밀번호바꿔");
		
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

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            
            Long id = element.getAsJsonObject().get("id").getAsLong();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            
            boolean hasEmail = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("has_email").getAsBoolean();
            String email = "";
            if (hasEmail) {
                email = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("email").getAsString();
            }

            System.out.println(id);
            System.out.println(email);
            System.out.println(nickname);
            
            String userid = String.valueOf(id);
            
            member.setUserId(email);
            member.setUserEmail(email);
            member.setUserNick(nickname);
            member.setUserName(nickname);
            
            br.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

        
        return  member;
        
	}

	@Override
	public boolean kakaoExist(Member member) {
		
		int kakaoemail = memberDao.kakaoExist(member);
		
		System.out.println(kakaoemail);
		
		if(kakaoemail<1) {
			//없을경우
			return true;
		} else {
			//있을경우
			return false;
		}
		
		
		
		
	}

	@Override
	public String getType(Member member) {
		
		String loginType = memberDao.getType(member);
		return loginType;
	}

	@Override
	public String getnaverToken(String code, String state)  {
		String clientId = "GHbqes62pzw1QpLMxiNo";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "RmazoV_MRN";// 애플리케이션 클라이언트 시크릿값";
		String redirectURI = null;
		try {
			redirectURI = URLEncoder.encode("http://localhost:8888/member/naver", "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code" + "&client_id=" + clientId
				+ "&client_secret=" + clientSecret + "&redirect_uri=" + redirectURI + "&code=" + code + "&state="
				+ state;
		String access_Token = "";
		String refresh_token = "";
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuilder res = new StringBuilder();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
				
				  System.out.println(res.toString());
				  
				  JsonParser parser = new JsonParser();
				  JsonObject jsonObject = parser.parse(res.toString()).getAsJsonObject();
				  access_Token = jsonObject.get("access_token").getAsString();
				  refresh_token = jsonObject.get("refresh_token").getAsString();
				  
				  System.out.println("엑세스 토큰" +access_Token);

			}
		} catch (Exception e) {
			// Exception 로깅
		}
		return access_Token;
	}

	@Override
	public Naver getnaverInfo(String access_token) {
		
		
		Naver naverinfo = new Naver();
		// 네이버 API 엔드포인트 URL
		String apiUrl = "https://openapi.naver.com/v1/nid/me";
		
		try {
		    URL url = new URL(apiUrl);
		    HttpURLConnection con = (HttpURLConnection) url.openConnection();
		    con.setRequestMethod("GET");
		    con.setRequestProperty("Authorization", "Bearer " + access_token);
		    int responseCode = con.getResponseCode();
		    
		    BufferedReader br;
		    if (responseCode == 200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		    } else { // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		    }
		    
		    StringBuilder response = new StringBuilder();
		    String line;
		    while ((line = br.readLine()) != null) {
		        response.append(line);
		    }
		    br.close();
		    
		    // API 응답 결과를 파싱하여 원하는 정보를 추출
		    JsonParser parser = new JsonParser();
		    JsonObject profileObject = parser.parse(response.toString()).getAsJsonObject();
		    JsonObject responseObject = profileObject.getAsJsonObject("response");
		    
		    System.out.println("리스폰스확인"+response);
		    
		    String naverId = responseObject.get("id").getAsString();
		    String naverName = responseObject.get("name").getAsString();
		    String naverEmail = responseObject.get("email").getAsString();
		    
		    
		    System.out.println(naverId);
		    System.out.println(naverName);
		    System.out.println(naverEmail);
		    
		    naverinfo.setNaverId(naverId);
		    naverinfo.setNaverName(naverName);
		    naverinfo.setNaverEmail(naverEmail);
		    
		} catch (Exception e) {
		    // Exception 처리
		}		
		return naverinfo;
	}

	
	

	







}
