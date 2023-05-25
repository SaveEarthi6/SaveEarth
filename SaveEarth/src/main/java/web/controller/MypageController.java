package web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import web.dto.Free;
import web.dto.Member;
import web.service.face.FreeService;
import web.service.face.MemberService;


@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired MemberService memberService;
	@Autowired FreeService freeService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/update") // 마이페이지 - 개인정보 불러오기
	public void mypageUpdate(HttpSession session, Model model, Member member) {
		logger.info("/mypage/update[GET]");
		
		String loginid = (String) session.getAttribute("loginid");
		logger.info("{}", loginid);
		
		Member info = memberService.info(loginid);
		logger.info("info: {}", info);
		
		model.addAttribute("info", info);
	}
	
	@PostMapping("/update") // 마이페이지 - 개인정보 수정
	public String mypageUpdateProc(HttpSession session, Member member) {
		
		member.setId((String)session.getAttribute("loginid"));
		logger.info("{}", member);
		
		memberService.update(member);
		
		return "redirect:/mypage/update";
	}
	
	
	@GetMapping("/delete") // 마이페이지 - 개인정보 불러오기 
	public void mypageDelete(HttpSession session, Model model) {
		logger.info("/mypage/delete[GET]");
		
		String loginid = (String) session.getAttribute("loginid");
		logger.info("{}", loginid);
		
		Member info = memberService.info(loginid);
		
		logger.info("info: {}", info);
		
		model.addAttribute("info", info);
	}
	
	@PostMapping("/delete") // 마이페이지 - 회원탈퇴
	public String mypageDeleteProc(Member member, HttpSession session) {
		logger.info("/delete/delete[POST]");
		
		String loginid = (String) session.getAttribute("loginid");
		logger.info("controller{}", loginid);
		
		
		memberService.delete(loginid);
		
		
		return "redirect:/member/logout";
	}
	
	@RequestMapping("/board")
	public void mypageBoard(Free free, Model model) {
		logger.info("/mypage/board");
//		
//		free = freeService.view(free);
//		logger.info("{}", free);
//		
//		model.addAttribute("viewFree", free);
		
	}
	
	@RequestMapping("/order")
	public void mypageOrder() {
		logger.info("/mypage/order");
	}

}
