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

import web.dto.Info;
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
		logger.info("curPage : {}", curPage);
		
		Paging paging = infoService.getPaging(curPage);
		
		List<Info> infoList = infoService.getInfoList(paging);
		
		for(Info i : infoList) {
			logger.info("info list : {}", i);
		}




		
		model.addAttribute("infoList", infoList);
		model.addAttribute("paging", paging);
		
	
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
