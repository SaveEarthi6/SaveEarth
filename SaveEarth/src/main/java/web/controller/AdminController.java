package web.controller;

import java.util.List;
import java.util.Map;

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

import web.dto.Admin;
import web.dto.Free;
import web.dto.FreeFile;
import web.dto.Member;
import web.service.face.AdminService;
import web.service.face.MemberService;
import web.util.Paging;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AdminService adminService;
	@Autowired
	MemberService memberService;

	// 자유 게시판
	@RequestMapping("/free")
	public void main(Model model, @RequestParam(defaultValue = "0") int curPage) {

		// 페이징
		Paging paging = adminService.getPaging(curPage);

		// 페이징을 적용한 리스트 보여주기(userno을 기준으로 join)
		List<Map<String, Object>> list = adminService.list(paging);
		logger.info("list {}", list);

		for (Map m : list) {
			logger.info(" list {} ", m);
		}

		// jsp에서 쓰기 위해서는 map의 컬럼명과 동일하게 해주어야 한다
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}

	
	@GetMapping("/freeView")
	public void detail(Model model, Free freeBoard, HttpSession session) {
		
		logger.info("/free/view [GET]");
		
		//게시글 조회
		Map<String, Object> view = adminService.getView(freeBoard);
		logger.info("free {}", view);
		
		//로그인한 회원과 작성자가 같은 회원인지 비교하기 위한 정보
		String loginId = (String) session.getAttribute("loginId");
		Member userInfo = memberService.getUserInfo(loginId);
		logger.info("userInfo {}", userInfo);
		
		model.addAttribute("view", view);
		model.addAttribute("userInfo", userInfo);
		
		//상세보기 페이지 파일 조회
//		FreeFile freeFile = freeService.getFreeFile(freeBoard);
		List<FreeFile> freeFile = adminService.getFreeFile(freeBoard);
		logger.info("freeFile {}", freeFile);
		model.addAttribute("freeFile", freeFile);
		
	}

	// 자유 글쓰기
	@GetMapping("/freeWrite")
	public void write(HttpSession session, Model model) {
		logger.info("/free/write [GET]");

		String loginId = (String) session.getAttribute("loginId");
		String loginNick = (String) adminService.getNick(loginId);
		logger.info("id {}", loginId);
		logger.info("nick {}", loginNick);

		model.addAttribute("id", loginId);
		model.addAttribute("nick", loginNick);
	}

	@GetMapping("/login")
	public void loginpage() {
		logger.info("admin/login[Get]");
	}

	@PostMapping("/login")
	public String login(HttpSession session, Admin adminParam) {
		logger.info("admin/login [POST]");
		logger.info("관리자 로그인 ;{}", adminParam);

		boolean isLogin = adminService.login(adminParam);
		logger.info("isLogin : {}", isLogin);

		if (isLogin) {
			logger.info("로그인 성공");
			session.setAttribute("isLogin", isLogin);
			session.setAttribute("admin", true);
			return "redirect: ./free";

		} else {
			logger.info("로그인 실패");
			session.invalidate();
			return "redirect: ./login";
		}

	}

}