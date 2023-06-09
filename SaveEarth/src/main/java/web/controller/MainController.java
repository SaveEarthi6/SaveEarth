package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Calendar;
import web.dto.Quiz;
import web.service.face.MainService;

@Controller
@RequestMapping("/saveearth")

public class MainController {
	
	@Autowired MainService mainService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/main")
	public void main(Model model) {
		logger.info("/saveearth/main [GET]");
		
		List<Quiz> quiz = mainService.selectAllQuiz();
		
		logger.info("{}", quiz);
				
		model.addAttribute("quiz", quiz);
		
		List<Calendar> calList = mainService.getCalendar();
		
		for(Calendar c : calList) {
			
		}
		
		model.addAttribute("calList", calList);
	}
	
	
//	@GetMapping("/main")
//	public void calendarGet(Model model) {
//		logger.info("/saveearth/main [GET]");
//		
//	}
}
