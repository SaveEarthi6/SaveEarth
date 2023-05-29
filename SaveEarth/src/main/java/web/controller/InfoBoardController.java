package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RequestMapping("/info")
@Controller
public class InfoBoardController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//메인 화면
	@GetMapping("/main")
	public void info() {

		logger.info("/info/main [GET]");
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
