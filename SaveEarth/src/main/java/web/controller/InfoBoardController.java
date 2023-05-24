package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class InfoBoardController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/info/main")
	public void info() {

		logger.info("/info/main [GET]");
	}
	
	@GetMapping("/info/detail")
	public void detail() {
		
		logger.info("/info/detail [GET]");
		
	}


}
