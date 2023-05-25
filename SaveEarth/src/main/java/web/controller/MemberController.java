package web.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Mail;
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
		
		if( isLogin) {
			session.setAttribute("isLogin", isLogin);
			session.setAttribute("loginid", member.getId());
			
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
	public void findpw() {
		
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
	
	@GetMapping("/mail/send")
	public String mailsendpage() {
		
		return "/member/sendemail";
	}	
	
	@PostMapping("/mail/send")
	public String sendMail(Mail mail) {
		System.out.println(mail);
//		memberService.sendSimpleMessage(mail);
		return "/member/aftermail";
	}
	
	

	
	

}
