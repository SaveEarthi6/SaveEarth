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
		String loginid = (String) session.getAttribute("loginid");
		Member userInfo = memberService.getUserInfo(loginid);
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
		
		String loginid = (String) session.getAttribute("loginid");
		String loginnick = (String) freeService.getNick(loginid);
		logger.info("id {}", loginid);
		logger.info("nick {}", loginnick);
		
		model.addAttribute("id", loginid);
		model.addAttribute("nick", loginnick);
		
		
	}

	@PostMapping("/free/write")
	public String writepost(HttpSession session, Free free, List<MultipartFile> files) {
		
		logger.info("/free/write [POST]");
		
		String loginid = (String) session.getAttribute("loginid");
		//로그인한 회원의 정보를 조회해 작성자 정보로 넣어준다
		Member memberInfo = memberService.info(loginid);
		
		logger.info("memberInfo {}", memberInfo);
		logger.info("free {}", free);
		logger.info("files {}", files);
		
		freeService.freeWrite(free, files, memberInfo);
		
		return "redirect:/free/main";
		
	}
	
	
	@RequestMapping("/free/delete")
	public String delete (Free free) {
		freeService.delete(free);
		
		return "redirect:./main";
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
	public String updatePost(Model model, Free freeBoard, List<MultipartFile> files) {
		
		logger.info("/free/update [POST]");
		
		logger.info("freeBoard {}", freeBoard);
		
		//자유게시판 내용 수정 + 파일
		freeService.updateFree(freeBoard, files);
		
		
		return "redirect:/free/main";
		
	}
	
	//검색기능
	@RequestMapping("/free/search")
	public String searchKeyword(Model model,@RequestParam(value = "curPage", defaultValue = "1") int curPage, String keyword, String freeHead) {
		
		logger.info("/free/search [GET]");
		
		Paging paging = freeService.getPaging(curPage);
		
		List<Map<String,Object>> list = freeService.search(paging, keyword);
		
		logger.info("list {}", list);
		logger.info("freeHead {}", freeHead);
		logger.info("keyword {}", keyword);
		
		model.addAttribute("list", list);
		model.addAttribute("freeHead", freeHead);
		
		if(keyword == null) {
			return "redirect:/free/main";
		} else {
			return "redirect:/free/search";
		}
		
		
	}

	
}
