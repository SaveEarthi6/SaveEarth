package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Member;
import web.service.face.MemberService;


@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired MemberService memberService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/update")
	public void mypageUpdate(HttpSession session, Model model) {
		logger.info("/mypage/update");
		
		String loginid = (String) session.getAttribute("loginid");
		logger.info("{}", loginid);
		
		Member info = memberService.info(loginid);
		logger.info("info: {}", info);
		
		model.addAttribute("info", info);
		
		
	}
	
	@RequestMapping("/delete")
	public void mypageDelete() {
		logger.info("/mypage/delete");
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
