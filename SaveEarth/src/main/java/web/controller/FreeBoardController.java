package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Free;
import web.dto.Member;
import web.service.face.FreeService;
import web.service.face.MemberService;
import web.util.Paging;

@Controller
public class FreeBoardController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	FreeService freeService;
	@Autowired
	MemberService memberService;

	@GetMapping("/free/main")
	public void free(Model model, @RequestParam(defaultValue = "0") int curPage) {
		
		logger.info("/free/main [GET]");
		
		Paging paging = freeService.getPaging(curPage);
		
		List<Free> list = freeService.list(paging);
		
		model.addAttribute("list", list);
		
		
	}
	
	@GetMapping("/free/view")
	public void detail(Model model, Free freeBoard, HttpSession session) {
		
		logger.info("/free/view [GET]");
		
		Free free = freeService.getView(freeBoard);
		logger.info("free {}", free);
		String loginid = (String) session.getAttribute("loginid");
		String loginnick = (String) freeService.getNick(loginid);
		
		model.addAttribute("view", free);
		model.addAttribute("nick", loginnick);
		
		//상세보기 페이지 파일
		
	}
	
	@GetMapping("/free/write")
	public void write(HttpSession session, Model model) {
		logger.info("/free/write [GET]");
		
		String loginid = (String) session.getAttribute("loginid");
		String loginnick = (String) freeService.getNick(loginid);
		logger.info("id {}", loginid);
		logger.info("nick {}", loginnick);
		
		model.addAttribute("id", loginid);
		model.addAttribute("nick", loginnick);
		
		
	}

	@PostMapping("/free/write")
	public String writepost(HttpSession session, Free free, MultipartFile file) {
		
		logger.info("/free/write [POST]");
		
		String loginid = (String) session.getAttribute("loginid");
//		String loginnick = (String) freeService.getNick(loginid);
		Member memberInfo = memberService.info(loginid);
		logger.info("memberInfo {}", memberInfo);
		logger.info("free {}", free);
		
		freeService.freeWrite(free, file, memberInfo);
		
//		Admin adminInfo = adminService.getAdmin()
		
		return "redirect:/free/main";
		
	}
}
