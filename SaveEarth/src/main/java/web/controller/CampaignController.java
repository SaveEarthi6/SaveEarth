package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/campaign")
public class CampaignController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/main")
	public void campMain() {
		logger.info("/campaign/main [GET]");
		
		//캠페인 불러오기
		
	}
	
	@RequestMapping("/detail")
	public void campDetail() {
		logger.info("/campaign/detail [GET]");
	}

}
