package web.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.InfoThumbnail;
import web.service.face.InfoService;
import web.util.Paging;


@RequestMapping("/info")
@Controller
public class InfoBoardController {
	
	@Autowired InfoService infoService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//메인 화면
	@GetMapping("/main")
	public void info(Model model, @RequestParam(defaultValue = "1") int curPage) {
		logger.info("/info/main [GET]");

		logger.info("curPage : {}", curPage);

		
		Paging paging = infoService.getPaging(curPage);
		
		//정보게시판 게시글 조회
		List<Map<String, Object>> infoList = infoService.getInfoList(paging);
		
		for(Map i : infoList) {
			logger.info("infoList : {}", i);
		}

		model.addAttribute("infoList", infoList);
		model.addAttribute("paging", paging);
		

	

	}
	
	//상세보기
	@GetMapping("/detail")
	public void detail(Model model, @RequestParam(value="infoNo") int infoNo) {
		
		logger.info("/info/detail [GET]");

		//정보게시판 게시글 조회(게시글 번호와 일치하는 게시글 내용)
		List<Map<String, Object>> info = infoService.getInfo(infoNo);
		
		logger.info("info {}", info);
		
		model.addAttribute("info", info);
		
	}

	//검색기능
	@RequestMapping("/search")
	public void searchKeyword(Model model,@RequestParam(value = "curPage", defaultValue = "1") int curPage, String keyword) {
		
		logger.info("/info/search [GET]");
		
		logger.info("curPage {}", curPage);
		Paging paging = infoService.getPagingByKeyword(curPage, keyword);
		
		logger.info("keyword {}", keyword);
		
		logger.info("paging {}", paging);

		List<Map<String,Object>> list = infoService.search(paging, keyword);
		
		logger.info("list {}", list);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("keyword", keyword);
		
	}
	
	
	
}
