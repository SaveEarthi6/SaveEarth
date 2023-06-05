package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/main")
	public void goodsmainget(){
		
	}
	
	@RequestMapping("/purchase")
	public void purchase() {
		
		logger.info("/goods/purchase [GET]");
		
	}

}
