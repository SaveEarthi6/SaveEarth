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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Free;
import web.dto.FreeFile;
import web.dto.Member;
import web.service.face.FreeService;
import web.service.face.MemberService;
import web.util.Paging;

@Controller
public class FreeBoardController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	FreeService freeService;
	@Autowired
	MemberService memberService;

	@GetMapping("/free/main")
	public void free(Model model, @RequestParam(value = "curPage", defaultValue = "1") int curPage, String freeHead, String keyword) {
		
		logger.info("/free/main [GET]");
		logger.info("freeHead{}", freeHead);
		
		//페이징
		Paging paging = freeService.getPaging(curPage);
		model.addAttribute("paging", paging);
		
		//페이징을 적용한 리스트 보여주기(userno을 기준으로 join)
		List<Map<String,Object>> list = freeService.list(paging, freeHead);
		model.addAttribute("list", list);
		model.addAttribute("freeHead", freeHead);
		logger.info("list {}", list);
		
		for(Map m : list) {
			logger.info(" list {} ", m);
		}
		
		//jsp에서 쓰기 위해서는 map의 컬럼명과 동일하게 해주어야 한다
		
		
	}
	
	
	@GetMapping("/free/view")
	public void detail(Model model, Free freeBoard, HttpSession session) {
		
		logger.info("/free/view [GET]");
		
		//게시글 조회
		Map<String, Object> view = freeService.getView(freeBoard);
		logger.info("free {}", view);
		
		//로그인한 회원과 작성자가 같은 회원인지 비교하기 위한 정보
		String loginId = (String) session.getAttribute("loginId");
		Member userInfo = memberService.info(loginId);
		logger.info("userInfo {}", userInfo);
		
		model.addAttribute("view", view);
		model.addAttribute("userInfo", userInfo);
		
		//상세보기 페이지 파일 조회
//		FreeFile freeFile = freeService.getFreeFile(freeBoard);
		List<FreeFile> freeFile = freeService.getFreeFile(freeBoard);
		logger.info("freeFile {}", freeFile);
		model.addAttribute("freeFile", freeFile);
		
	}
	
	@GetMapping("/free/write")
	public void write(HttpSession session, Model model) {
		logger.info("/free/write [GET]");
		
		String loginId = (String) session.getAttribute("loginId");
		logger.info("id {}", loginId);
		
		Member memberInfo = memberService.info(loginId);
		model.addAttribute("id", loginId);
		model.addAttribute("memberInfo", memberInfo);
		
		
	}

	@PostMapping("/free/write")
	public String writepost(HttpSession session, Free free, @RequestParam(required = false) List<MultipartFile> files) {
		
		logger.info("/free/write [POST]");
		
		//로그인 정보를 가지고 회원번호랑 관리자 번호를 가져옴
		String loginId = (String) session.getAttribute("loginId");
		Member memberInfo = null;
		memberInfo = memberService.info(loginId);
		//만약 회원번호가 있으면 회원번호를 가져오고
		//관리자번호가 있으면 관리자 번호를 가져오고
		
		logger.info("memberInfo {}", memberInfo);
		logger.info("free {}", free);
		logger.info("files {}", files);
		
		freeService.freeWrite(free, files, memberInfo);
		
		return "redirect:/free/main";
		
	}
	
	
	@RequestMapping("/free/delete")
	public String delete (Free free) {
		freeService.delete(free);
		
		return "redirect:/mypage/board";
	}
	
	
	@GetMapping("/free/update")
	public void update(Model model, Free freeBoard, HttpSession session) {

		//수정 할 게시글 정보 조회
		Map<String, Object> view = freeService.getView(freeBoard);
		logger.info("view {}", view);
		
		//수정할 파일 정보 조회
		List<FreeFile> freeFile = freeService.getFreeFile(freeBoard);
		logger.info("freeFile {} ", freeFile);
		
		model.addAttribute("view", view);
		model.addAttribute("freeFile", freeFile);
		
	}
	
	@PostMapping("/free/update")
	public String updatePost(Model model, Free freeBoard, @RequestParam(required = false) List<MultipartFile> files) {
		
		logger.info("/free/update [POST]");
		
		logger.info("freeBoard {}", freeBoard);
		
		//자유게시판 내용 수정 + 파일
		freeService.updateFree(freeBoard, files);
		
		
		return "redirect:/free/main";
		
	}
	
	//검색기능
	@RequestMapping("/free/search")
	public void searchKeyword(Model model,@RequestParam(value = "curPage", defaultValue = "1") int curPage, String keyword, String freeHead) {
		
		logger.info("/free/search [GET]");
		
		Paging paging = freeService.getPaging(curPage);
		
		logger.info("freeHead {}", freeHead);
		logger.info("keyword {}", keyword);

		List<Map<String,Object>> list = freeService.search(paging, keyword,freeHead);
		
		logger.info("list {}", list);
		
		model.addAttribute("list", list);
		model.addAttribute("freeHead", freeHead);
		
	}

	
}
