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
import web.dto.Campaign;
import web.service.face.AdminService;
import web.util.Paging;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	AdminService adminService;

	// 자유 게시판
	@GetMapping("/free")
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

	// 켐페인 게시판
	@GetMapping("/campaign")
	public void campMain(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/admin/campaign [GET]");
		logger.info("curPage : {}", curPage);

		Paging paging = adminService.getPaging2(curPage);

	}

	// 정보 게시판

	@GetMapping("/info")
	public void info() {

		logger.info("/info/main [GET]");
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
			return "redirect:./free";

		} else {
			logger.info("로그인 실패");
			session.invalidate();
			return "redirect:./login";
		}

	}

}
