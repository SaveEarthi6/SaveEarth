package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Free;
import web.service.face.FreeService;
import web.service.face.InfoService;
import web.service.face.MemberService;


@RequestMapping("/info")
@Controller
public class InfoBoardController {
	
	@Autowired InfoService infoService;
	
	@Autowired FreeService freeService;
	
	@Autowired MemberService memberService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//메인 화면
	@GetMapping("/main")
	public void info(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/info/main [GET]");
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//자유게시판 TOP추천수 불러오기
	@RequestMapping("/top")
	public void FreeTop (Model model, @RequestParam(defaultValue = "10") int count) {
		
		List<Free> topRecommend = infoService.getTopRecommend(count);
		
		model.addAttribute("recommend", topRecommend);
		
		logger.info("/top [GET]");
	}
	
}
