package web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Campaign;
import web.service.face.CampService;
import web.util.Paging;

@Controller
@RequestMapping("/campaign")
public class CampaignController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CampService campService;
	
	@RequestMapping("/main")
	public void campMain(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/campaign/main [GET]");
		logger.info("curPage : {}", curPage);
		
		Paging paging = campService.getPaging(curPage);
		
		//캠페인 불러오기
		List<Campaign> campList = campService.getList(paging);
		
		for(Campaign c : campList) {
			logger.info("{}", c);
		}
		
		model.addAttribute("campList", campList);
		
	}
	
	@RequestMapping("/detail")
	public void campDetail(Model model, int campno) {
		logger.info("/campaign/detail [GET]");
		logger.info("campno : {}", campno);
		
		Map<String, Object> campDetail = campService.getCampDetail(campno);
		logger.info("{}", campDetail);
		
		model.addAttribute("campDetail", campDetail);
		
	}
	
	@RequestMapping("/preface")
	public String campList(Model model, @RequestParam(defaultValue = "0") int curPage, String state) {
		logger.info("/campaign/preface [GET]");
		logger.info("{}", curPage);
		logger.info("{}", state);
		
		List<Campaign> campList = new ArrayList<>();
		
		
		if("전체".equals(state)) {
			logger.info("전체 선택됨");
			
			Paging paging = campService.getPaging(curPage);
			campList = campService.getList(paging);
			
			for(Campaign c : campList) {
				logger.info("{}", c);
			}
			
			model.addAttribute("campList", campList);
			
		} else {
			logger.info("마감 혹은 진행중이 선택됨");
			
			Paging paging = campService.getPagingByState(curPage, state);
					
			campList = campService.getListByState(paging, state);
			
			for(Campaign c : campList) {
				logger.info("{}", c);
			}
			
			
			model.addAttribute("campList", campList);
		}
		
		
		return "/campaign/campList";
		
	}
	
	@RequestMapping("/test")
	public void test() {
		
	}
	

}
