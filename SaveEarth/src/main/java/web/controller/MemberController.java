package web.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import web.dto.Member;
import web.service.face.MemberService;



@Controller
@RequestMapping("member")
public class MemberController {
	
	private final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired MemberService memberService;
	
	@GetMapping("/login")
	public void loginpage() {
		
	}
	
	@PostMapping("/login")
	
	public String login(Member member, HttpSession session) {

		logger.info("/member/login");
		logger.info("{}", member);
		boolean isLogin = memberService.login(member);
		
		
//  2023-05-29 세션에  userno 추가		---------!!
		member = memberService.info(member.getId());
		System.out.println(member);
		System.out.println("유저번호" +member.getUserno());
		
		if( isLogin) {
			session.setAttribute("isLogin", isLogin);
			session.setAttribute("loginid", member.getId());
			session.setAttribute("loginNO", member.getUserno());
			
//  2023-05-29 세션에  userno 추가		---------!!		
			
			
		} else {
			session.invalidate();
		}
		
		return "redirect:/saveearth/main";		
	}
	
	@GetMapping("/join")
	public void joinpage() {
		
	}
	
	@PostMapping("/join")
	public String join(
			Member memberParam
			) {
		memberService.join(memberParam);

		return "redirect:./login";
	}
	
	@GetMapping("/findid")
	public void findidpage() {
		
	}
	@PostMapping("/findid")
	public String findid(Member member, Model model) {
		System.out.println(member.getName());
		System.out.println(member.getEmail());		
		boolean check = memberService.checkid(member);
		System.out.println(check);

		if(check) {
			Member id = memberService.findid(member);
			
			System.out.println(id);
			
			model.addAttribute("id", id);
			
		
			return "./member/findViewid";
		} else {
			
			
			return "./member/findid";
			
		}
		  
	}
	@GetMapping("/findViewid")
	public void findViewid() {
		
	}
	
	

	
	@GetMapping("/findpw")
	public void findpwview() {
		
	}
	
//	pw찾기 id,email확인해서 있는지		
	@PostMapping("/findpw")
	public void findpw() {
		
	}
	
//	pw찾기 id,email확인해서 있는지	
	@ResponseBody
	@GetMapping("/findIdEmail")
	public int checkIdEmail(Member member) {
		int result = memberService.checkIdEmail(member);
		
		if(result==1) {
			
			//비밀번호 난수생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}	
			System.out.println(pw);
			member.setPw(pw);
			
			
			//비밀번호 난수로 변경(update)
			memberService.temPw(member);
			System.out.println(member);

			
			//이메일 발송()
			memberService.mailSend(member);
			
			
			
			return result;
			
		} else {
			return result;	
		}
		
		
	}
	
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		logger.info("/logout");
		
		session.invalidate();
		
		return "redirect:/saveearth/main";
	}
	
//	   20230525추가 id 중복 
	
	@ResponseBody
	@GetMapping("/idCheck")
	public int overlappendID(Member member) {
		int result = memberService.overlappedID(member);
		System.out.println(result);
		return result;
	}
	
	
//  20230529추가 이메일 중복 	
	@ResponseBody
	@GetMapping("/emailCheck")
	public int emailCheck(Member member) {
		int result = memberService.overlappedEmail(member);
		System.out.println(result);
		
		return result;
	}
	
	
	@GetMapping("/kakao")
	public String kakaocode(@RequestParam("code") String code) {
		
			System.out.println("code : " + code);
			
			
			
			//CODE로 access 토큰 가져오기
			String access_token = memberService.getToken(code);
			
	
			System.out.println("받아온:accestoken:" +access_token);
				
			//-------------------------------------------------------------------------	
			
			//토큰으로 정보 가지고 오기
			
			Member member = memberService.getKaKaoinfo(access_token);
			
			System.out.println("가져온 유저 아이디" + member.getId());
			System.out.println("가져온 유저 이메일" + member.getEmail());
		//*************************2023-05-26 금요일 kakao정보가져오기까지 이정보로 로그인하기 다음 구현 *************************
			
			
			
			
			
	        return "/saveearth/main";
	    
		
	    
		
	}

    @RequestMapping("/kakaoToken")
    public void kakotoken() {
    	
    }
    
    @ResponseBody
    @GetMapping("/naver")
    public void naver(@RequestParam("code") String code, @RequestParam("state") String state )throws Exception {
    	System.out.println(code);
    	System.out.println(state);
    	
        String clientId = "GHbqes62pzw1QpLMxiNo";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "RmazoV_MRN";//애플리케이션 클라이언트 시크릿값";
        String redirectURI = URLEncoder.encode("http://localhost:8888/member/naver", "UTF-8");
        String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
            + "&client_id=" + clientId
            + "&client_secret=" + clientSecret
            + "&redirect_uri=" + redirectURI
            + "&code=" + code
            + "&state=" + state;
        String accessToken = "";
        String refresh_token = "";
        try {
          URL url = new URL(apiURL);
          HttpURLConnection con = (HttpURLConnection)url.openConnection();
          con.setRequestMethod("GET");
          int responseCode = con.getResponseCode();
          BufferedReader br;
          if (responseCode == 200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
          } else {  // 에러 발생
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
            System.out.println(res);
     
            
          }
        } catch (Exception e) {
          // Exception 로깅
        }
        
    }


    
	
	

	
	

}
