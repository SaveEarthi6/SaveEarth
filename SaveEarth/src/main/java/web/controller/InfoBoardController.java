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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.service.face.InfoService;
import web.util.Paging;


@RequestMapping("/info")
@Controller
public class InfoBoardController {
	
	@Autowired InfoService infoService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//메인 화면
	@GetMapping("/main")
	public void info(Model model, @RequestParam(defaultValue = "0") int curPage) {

		logger.info("/info/main [GET]");
<<<<<<< HEAD
		

//		// 페이징
//		Paging paging = infoService.getPaging(curPage);
//
//		// 페이징을 적용한 리스트 보여주기(userno을 기준으로 join)
//		List<Map<String, Object>> list = infoService.list(paging);
//		logger.info("정보게시판 list : {}", list);
//
//		for (Map m : list) {
//			logger.info(" list {} ", m);
//		}
//
//		model.addAttribute("list", list);
//		model.addAttribute("paging", paging);
=======
//		String loginId = (String) session.getAttribute("loginId");
//		boolean admin = (boolean) session.getAttribute("admin");
//		model.addAttribute("admin", admin);
	
>>>>>>> branch 'master' of https://github.com/SaveEarthi6/SaveEarth.git
	}
	
	//상세보기
	@GetMapping("/detail")
	public void detail() {
		
		logger.info("/info/detail [GET]");
		
	}

	//검색기능
//	@GetMapping("/search")
//	public String search(@RequestParam(value="keyword") String keyword, Model model) {
//		
//		List<Map<String,Object>>
//		
//		return "redirect:./main";
//		
//	}
	
	
	
}
