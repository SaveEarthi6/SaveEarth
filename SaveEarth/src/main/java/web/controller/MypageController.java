package web.controller;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import web.dto.Free;
import web.dto.Member;
import web.service.face.FreeService;
import web.service.face.MemberService;
import web.util.Paging;


@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired MemberService memberService;
	@Autowired FreeService freeService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/update") // 마이페이지 - 개인정보 불러오기
	public void mypageUpdate(HttpSession session, Model model, Member member) {
		logger.info("/mypage/update[GET]");
		
		String loginId = (String) session.getAttribute("loginId");
		logger.info("{}", loginId);
		
		Member info = memberService.info(loginId);
		logger.info("info: {}", info);
		
		model.addAttribute("info", info);
	}
	
	
	@PostMapping("/update") // 마이페이지 - 개인정보 수정
	public String mypageUpdateProc(HttpSession session, Member member) {
		
		member.setUserId((String)session.getAttribute("loginId"));
		logger.info("{}", member);
		
		memberService.update(member);
		
		return "redirect:/mypage/update";
	}
	
	
	@GetMapping("/delete") // 마이페이지 - 개인정보 불러오기 
	public void mypageDelete(HttpSession session, Model model) {
		logger.info("/mypage/delete[GET]");
		
		String loginId = (String) session.getAttribute("loginId");
		logger.info("{}", loginId);
		
		Member info = memberService.info(loginId);
		
		logger.info("info: {}", info);
		
		model.addAttribute("info", info);
	}
	
	@PostMapping("/delete") // 마이페이지 - 회원탈퇴
	public String mypageDeleteProc(Member member, HttpSession session) {
		logger.info("/delete/delete[POST]");
		
		String loginId = (String) session.getAttribute("loginId");
		logger.info("controller{}", loginId);
		
		memberService.delete(loginId);
		
		return "redirect:/member/logout";
	}
	
		
	@RequestMapping("/board") // 마이페이지 - 작성한글 조회
	public void mypageBoard(Model model, @RequestParam(value = "curPage", defaultValue = "1") int curPage, String freeHead, HttpSession session, Free free) {
		logger.info("/mypage/board[RequestMapping]");
		logger.info("freeHead{}", freeHead);
		
		Paging paging = freeService.getPaging(curPage);
		
		List<Map<String,Object>> list = freeService.list(paging, freeHead);
		logger.info("페이징처리:list {}", list);

		for(Map m : list) {
			logger.info(" list {} ", m);
			
		}
		
		model.addAttribute("freeHead", freeHead);
		model.addAttribute("paging", paging);
		
		// 내 정보 불러오기 
		String loginId = (String) session.getAttribute("loginId");
		logger.info("{}", loginId);
		
		Member info = memberService.info(loginId);
		logger.info("info: {}", info);

		// 게시글 리스트 
		free.setUserNo(info.getUserNo());
		List<Free> mypageList = freeService.mypageList(info.getUserNo());
		System.out.println(mypageList);
		
		for(Free m : mypageList) {
			logger.info(" list {} ", m);
		}
		
		model.addAttribute("mypageList", mypageList);

	}
	
	@RequestMapping("/order")
	public void mypageOrder() {
		logger.info("/mypage/order");
	}

}
