package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")

public class AdminController {

	private final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	@RequestMapping("/main")
	public void main() {
		
		logger.info("/admin/main");
		
	}
	
	@GetMapping("/login")
	public void admin() {
		
		logger.info("/admin/login");
		
	}

}
