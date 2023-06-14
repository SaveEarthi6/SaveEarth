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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	//메인 접속
	@GetMapping("/main")
	public void campMainGet(HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/campaign/main [GET]");
		logger.info("curPage : {}", curPage);
		
		//전체글 페이징
		Paging paging = campService.getPaging(curPage);
		logger.info("*******paging : {}", paging);
		
		
		//첫 로드시 캠페인 불러오기
//		List<Campaign> campList = campService.getCampList(paging);
		List<Map<String, Object>> campList = campService.getCampList(paging);
		
		
		
		logger.info("{}", campList);
		
		model.addAttribute("campList", campList);
		model.addAttribute("paging", paging);
		
		
		//로그인 상태에 따라 달력 불러오기
		if(session.getAttribute("isLogin") != null) {
			
			//로그인 상태면 일치하는 회원의 인증글 불러오기
			List<Certification> certList = campService.getcertList((int)session.getAttribute("loginNo"));
		
			for(Certification c : certList) {
//				logger.info("{}", c);
			}
			
			
			model.addAttribute("certList", certList);
			
			
			//모달용 진행중 캠페인 리스트 불러오기
			List<Campaign> ingList = campService.getIngList((int)session.getAttribute("loginNo"));
			
			model.addAttribute("ingList", ingList);
			
			
			
		} else {
			
			//기념일(공용 달력) 불러오기
			List<Calendar> calList = campService.getCalendar();
	
			for(Calendar c : calList) {
//				logger.info("{}", c);
		
			}
			
			model.addAttribute("calList", calList);
	
		}
		
		
	}
	
	//인증글 작성
	@PostMapping("/main")
	public String campMainPost(MultipartFile partFile, @RequestParam Map<String, String> certification ) {
		logger.info("/campaign/main [POST]");
		logger.info("{}", partFile);
		logger.info("********** {}", certification);
		
		campService.writePart(certification, partFile);
		
		//재밌는 코딩 놀이 ^~^
		
		return "redirect:/campaign/main";
	}
	
	//달력리스트 불러오기 -> 에이젝스 포기하고 메인에 합침
//	@ResponseBody
//	@PostMapping("/getCalendar")
//	public List<Calendar> gerCalendar(HttpSession session, Model model) {
//		
//		//달력 불러오기
//		if(session.getAttribute("isLogin") != null) {
////					List<Certification> certList = campService.getcertList(session.getAttribute("loginId"));
//		} else {
//			List<Calendar> calList = campService.getCalendar();
//			
//			for(Calendar c : calList) {
//				logger.info("{}", c);
//				
//			}
//			
//			return calList;
//		}
//		
//		return null;
//		
//	}
	
	//캠페인 상세보기
	@RequestMapping("/detail")
	public void campDetail(Model model, int campno) {
		logger.info("/campaign/detail [GET]");
		logger.info("campno : {}", campno);
		
		Map<String, Object> campDetail = campService.getCampDetail(campno);
		logger.info("{}", campDetail);
		
		//인증현황 조회해오기
		int campCount = campService.selectOne(campno );
		
		logger.info("campCount", campCount );
		
		model.addAttribute("campCount",campCount);
		model.addAttribute("campDetail", campDetail);
		
	}
	
	//전체 / 진행중 / 마감 선택에 따라 캠페인 리스트 가져오기
	@RequestMapping("/preface")
	public String campList(Model model, @RequestParam(defaultValue = "0") int curPage, String state) {
		logger.info("/campaign/preface [GET]");
		logger.info("{}", curPage);
		logger.info("{}", state);
		
		List<Map<String, Object>> campList = new ArrayList<>();
		
		
		if("전체".equals(state)) {
			logger.info("전체 선택됨");
			
			Paging paging = campService.getPaging(curPage);
			campList = campService.getCampList(paging);
			
			
			model.addAttribute("campList", campList);
			model.addAttribute("paging", paging);
			
		} else {
			logger.info("마감 혹은 진행중이 선택됨");
			
			Paging paging = campService.getPagingByState(curPage, state);
					
			campList = campService.getListByState(paging, state);
					
			
			model.addAttribute("campList", campList);
			model.addAttribute("paging", paging);
		}
		
		
		return "/campaign/campList";
		
	}
	
	//달력에서 Date 클릭시 해당 일자 인증글 불러오기
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
	
	//달력에서 이벤트 클릭시 해당 인증글 불러오기
	@RequestMapping("/viewCert")
	public Model viewCert(Model model, HttpSession session, int partNo) {
		logger.info("/campaign/viewCert [GET]");
		logger.info("{}", partNo);
		
		Map<String, Object> userCert = campService.getCert((int)session.getAttribute("loginNo"), partNo);
		
		logger.info("{}", userCert);
		
		model.addAttribute("userCert", userCert);
		
		return model;
		
	}
	
	//인증글 삭제하기
	@RequestMapping("/viewCertDelete")
	public String viewCertDelete(int partNo, int partFileNo) {
		logger.info("/campaign/viewCertDelete [GET]");
		logger.info("partNo : {}", partNo);
		logger.info("partFileNo : {}", partFileNo);
		
		campService.deleteCert(partNo, partFileNo);
		
		return "redirect:/campaign/main";
	}

	

}
