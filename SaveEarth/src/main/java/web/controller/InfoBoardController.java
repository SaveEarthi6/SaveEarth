package web.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Info;
import web.dto.InfoFile;
import web.dto.InfoThumbnail;
import web.service.face.FreeService;
import web.service.face.InfoService;
import web.service.face.MemberService;
import web.util.Paging;


@Controller
public class InfoBoardController {
	
	@Autowired InfoService infoService;
	
	@Autowired FreeService freeService;
	
	@Autowired MemberService memberService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//메인 화면
	@GetMapping("/info/main")
	public void info(Model model, @RequestParam(defaultValue = "1") int curPage) {
		logger.info("/info/main [GET]");


		logger.info("curPage : {}", curPage);

		
		Paging paging = infoService.getPaging(curPage);
		
		//정보게시판 게시글 조회
		List<Map<String, Object>> infoList = infoService.getInfoList(paging);
		
		for(Map i : infoList) {
			logger.info("infoList : {}", i);
		}
		

		model.addAttribute("infoList", infoList);
		model.addAttribute("paging", paging);
		

	
	}
	
	
	//상세보기
	@GetMapping("/info/detail")
	public void detail(Model model, @RequestParam(value="infoNo") int infoNo) {
		
		logger.info("/info/detail [GET]");

		//정보게시판 게시글 조회(게시글 번호와 일치하는 게시글 내용)
//		List<Map<String, Object>> infoList = infoService.getInfo(infoNo);
		
		List<InfoFile> infoFile = infoService.getInfoFile(infoNo);
		
		Info info = infoService.getInfoDetail(infoNo);
		
		logger.info("infoFile {}", infoFile);
		
		logger.info("info {}", info);
		
		model.addAttribute("infoFile", infoFile);
		model.addAttribute("info", info);
		
	}

	//정보게시판 - 정보게시글 검색기능
	@RequestMapping("/info/searchInfo")
	public void searchInfoKeyword(Model model,@RequestParam(value = "curPage", defaultValue = "1") int curPage, String keyword) {
		
		logger.info("/info/searchInfo");
		
		logger.info("curPage {}", curPage);
		Paging paging = infoService.getPagingByKeyword(curPage, keyword);
		
		logger.info("keyword {}", keyword);
		
		logger.info("paging {}", paging);

		List<Map<String,Object>> list = infoService.search(paging, keyword);
		
		logger.info("InfoBoardController search list {}", list);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("keyword", keyword);
		
	}
	
	
	
	//자유게시판 TOP추천수 불러오기
	@RequestMapping("/info/top")
	public void FreeTop (Model model, @RequestParam(defaultValue = "10") int count) {
		
		List<Map<String, Object>> topRecommend = infoService.getTopRecommend(count);
		
		model.addAttribute("recommend", topRecommend);
		
		logger.info("/top [GET]");
	}
	
	//정보게시판 썸네일 삭제
	@RequestMapping("/info/deleteThumb")
	public void deleteThumb(@RequestParam("thumbNo") int thumbNo, @RequestParam("infoNo") int infoNo, Model model) {
		
		logger.info("thumbNo {}", thumbNo);
	
		//파일번호를 기준으로 파일 삭제
		infoService.deleteThumb(thumbNo);
		
		//삭제된 후 파일 리스트 조회
		List<InfoThumbnail> infoThumb = infoService.getInfoThumb(infoNo);
		logger.info("infoThumb {}", infoThumb);
		model.addAttribute("infoThumb", infoThumb);
	}

	//정보게시판 첨부파일 삭제
	@RequestMapping("/info/deleteFile")
	public void deleteFile(@RequestParam("infoFileNo") int infoFileNo, @RequestParam("infoNo") int infoNo, Model model) {
		
		logger.info("infoFileNo {}", infoFileNo);
		
		//파일번호를 기준으로 파일 삭제
		infoService.deleteFileByFileNo(infoFileNo);
		
		//삭제된 후 파일 리스트 조회
		List<InfoFile> infoFile = infoService.getInfoFile(infoNo);
		logger.info("infoFile {}", infoFile);
		model.addAttribute("infoFile", infoFile);
	
	}

	//자유게시판 TOP 추천수 상세보기 불러오기
	@RequestMapping ("/free/view")
	public void FreeTopDetail(Model model, @RequestParam(value="freeNo") int freeNo) {
		logger.info("/info/detail [GET]");
		
		//정보게시판 게시글 조회(게시글 번호와 일치하는 게시글 내용)
		List<Map<String, Object>> freeTopDetail = infoService.getfreeTopDetail(freeNo);
		
		logger.info("info {}", freeTopDetail);
		
		model.addAttribute("info", freeTopDetail);

		
	}
	
}
	
