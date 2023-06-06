package web.controller;

import java.util.ArrayList;
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

import oracle.jdbc.proxy.annotation.Post;
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

		//전체글 페이징
		Paging paging = infoService.getPaging(curPage);
		
		//첫 로드시 info 불러오기
		List<Map<String, Object>> infoList = infoService.getInfoList(paging);
		
		for(Map<String, Object> i : infoList) {
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
	
	
	/// 정보 / 자유 TOP 선택에 따라 캠페인 리스트 가져오기!
	@RequestMapping("/preface")
	public String infoList(Model model, @RequestParam(defaultValue = "0")int curPage, String state) {
		logger.info("/info/preface [GET]");
		
		List <Map <String, Object>> infoList = new ArrayList<>();
		
		if("정보".equals(state)) {
			logger.info("정보 선택됨");
			
			Paging paging = infoService.getPaging(curPage);
			infoList = infoService.getInfoList(paging);
			
			model.addAttribute("infoList", infoList);
			model.addAttribute("paging", paging);
			
		} else {
			logger.info("자유가 선택됨");
			
			Paging paging = infoService.getPagingByState(curPage,state);
			
			infoList = infoService.getInfoListState(paging,state);
			
			model.addAttribute("infoList", infoList);
			model.addAttribute("paging", paging);
		}
		return "/info/detail";
		
	}
	
	//TOP 게시글 불러오기 (자유게시판)
	
	
}
