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

import web.dto.Calendar;
import web.dto.Campaign;
import web.dto.CampaignFile;
import web.dto.Certification;
import web.service.face.CampService;
import web.util.Paging;

@Controller
@RequestMapping("/saveearth")

public class MainController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CampService campService;
	
	@GetMapping("/main") 
	public void main(HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage ) {
	logger.info("/saveearth/main [GET]");
	
	
	
	}
	
	

}
