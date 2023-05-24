package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Member;
import web.service.face.MemberService;


@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired MemberService memberService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/update")
	public void mypageUpdate(HttpSession session, Model model) {
		logger.info("/mypage/update[GET]");
		
		String loginid = (String) session.getAttribute("loginid");
		logger.info("{}", loginid);
		
		Member info = memberService.info(loginid);
		logger.info("info: {}", info);
		
		model.addAttribute("info", info);
	}
	
	@PostMapping("/update")
	public void mypageUpdateProc(HttpSession session, Model model) {
		logger.info("/mypage/updateProc");
		
		String loginid = (String) session.getAttribute("loginid");
		logger.info("{}", loginid);
		
		Member update = memberService.update(loginid);
		logger.info("info:{}", update);
		
	}
	
	
	@GetMapping("/delete")
	public void mypageDelete(HttpSession session, Model model) {
		logger.info("/mypage/delete[GET]");
		
		String loginid = (String) session.getAttribute("loginid");
		logger.info("{}", loginid);
		
		Member info = memberService.info(loginid);
		
		logger.info("info: {}", info);
		
		model.addAttribute("info", info);
	}
	
	@PostMapping("/delete")
	public String mypageDeleteProc(HttpSession session, Model model) {
		logger.info("/delete/delete[POST]");
		
		String loginid = (String) session.getAttribute("loginid");
		logger.info("{}", loginid);
		
		memberService.delete(loginid);
		
		return "redirect:/saveearth/main";
		
		
		
	}
	
	@RequestMapping("/board")
	public void mypageBoard() {
		logger.info("/mypage/board");
		
	}
	
	@RequestMapping("/order")
	public void mypageOrder() {
		logger.info("/mypage/order");
	}

}
