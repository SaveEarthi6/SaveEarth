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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Calendar;
import web.dto.Campaign;
import web.dto.Certification;
import web.service.face.CampService;
import web.util.Paging;

@Controller
@RequestMapping("/campaign")
public class CampaignController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CampService campService;
	
	@GetMapping("/main")
	public void campMainGet(HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/campaign/main [GET]");
		logger.info("curPage : {}", curPage);
		
		//전체글 페이징
		Paging paging = campService.getPaging(curPage);
		
		//첫 로드시 캠페인 불러오기
		List<Campaign> campList = campService.getCampList(paging);
		
		
		for(Campaign c : campList) {
			logger.info("{}", c);
		}
		
		model.addAttribute("campList", campList);
		model.addAttribute("paging", paging);
		
		
		//모달용 진행중 캠페인 리스트 불러오기
		List<Campaign> ingList = campService.getIngList();
		
		model.addAttribute("ingList", ingList);
		
				
		//로그인 상태에 따라 기념일 혹은 유저 인증글 불러오기
		if(session.getAttribute("isLogin") != null) {
			
			List<Certification> certList = campService.getcertList((int)session.getAttribute("loginNo"));
		
			for(Certification c : certList) {
				logger.info("{}", c);
			}
			
			model.addAttribute("certList", certList);
			
		} else {
			List<Calendar> calList = campService.getCalendar();
	
			for(Calendar c : calList) {
				logger.info("{}", c);
		
			}
			
			model.addAttribute("calList", calList);
	
		}
		
		
	}
	
	@PostMapping("/main")
	public String campMainPost(MultipartFile partFile, Certification certification ) {
		logger.info("/campaign/main [POST]");
		logger.info("{}", partFile);
		logger.info("********** {}", certification);
		
		campService.writePart(certification, partFile);
		
		//재밌는 코딩 놀이 ^~^
		
		return "redirect:/campaign/main";
	}
	
	@ResponseBody
	@PostMapping("/getCalendar")
	public List<Calendar> gerCalendar(HttpSession session, Model model) {
		
		//달력 불러오기
		if(session.getAttribute("isLogin") != null) {
//					List<Certification> certList = campService.getcertList(session.getAttribute("loginId"));
		} else {
			List<Calendar> calList = campService.getCalendar();
			
			for(Calendar c : calList) {
				logger.info("{}", c);
				
			}
			
			return calList;
		}
		
		return null;
		
	}
	
	@RequestMapping("/detail")
	public void campDetail(Model model, int campno) {
		logger.info("/campaign/detail [GET]");
		logger.info("campno : {}", campno);
		
		Map<String, Object> campDetail = campService.getCampDetail(campno);
		logger.info("{}", campDetail);
		
		//인증현황 조회해오기
		
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
			campList = campService.getCampList(paging);
			
			for(Campaign c : campList) {
				logger.info("{}", c);
			}
			
			model.addAttribute("campList", campList);
			model.addAttribute("paging", paging);
			
		} else {
			logger.info("마감 혹은 진행중이 선택됨");
			
			Paging paging = campService.getPagingByState(curPage, state);
					
			campList = campService.getListByState(paging, state);
			
			for(Campaign c : campList) {
				logger.info("{}", c);
			}
			
			
			model.addAttribute("campList", campList);
			model.addAttribute("paging", paging);
		}
		
		
		return "/campaign/campList";
		
	}
	
	@RequestMapping("/viewCertList")
	public Model viewCertList(Model model, HttpSession session, String calDate) {
		logger.info("/campaign/viewCertList [GET]");
		logger.info("{}", calDate);
		
		List<Map<String, Object>> userCertList = new ArrayList<Map<String,Object>>();
		userCertList = campService.getcertList((int)session.getAttribute("loginNo"), calDate);
		
		logger.info("{}", userCertList);
		
		
		model.addAttribute("userCertList", userCertList);
		
		return model;
	}
	
	@RequestMapping("/viewCertDelete")
	public String viewCertDelete(int partNo, int partFileNo) {
		logger.info("/campaign/viewCertDelete [GET]");
		logger.info("partNo : {}", partNo);
		logger.info("partFileNo : {}", partFileNo);
		
		campService.deleteCert(partNo, partFileNo);
		
		return "redirect:/campaign/main";
	}

	

}
