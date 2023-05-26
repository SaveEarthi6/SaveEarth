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
	public void free(Model model, @RequestParam(value = "curPage", defaultValue = "1") int curPage, String freeHead) {
		
		logger.info("/free/main [GET]");
		logger.info("freeHead{}", freeHead);
		
		//페이징
		Paging paging = freeService.getPaging(curPage);
		
		//페이징을 적용한 리스트 보여주기(userno을 기준으로 join)
		List<Map<String,Object>> list = freeService.list(paging, freeHead);
		logger.info("list {}", list);

		for(Map m : list) {
			logger.info(" list {} ", m);
		}
		
		//jsp에서 쓰기 위해서는 map의 컬럼명과 동일하게 해주어야 한다
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("freeHead", freeHead);
		
	}
	
	
	@GetMapping("/free/view")
	public void detail(Model model, Free freeBoard, HttpSession session) {
		
		logger.info("/free/view [GET]");
		
		Free free = freeService.getView(freeBoard);
		logger.info("free {}", free);
		String loginid = (String) session.getAttribute("loginid");
		String loginnick = (String) freeService.getNick(loginid);
		//입력한 아이디랑 로그인 했을 때 아이디가 일치하는지 -> 근데 자유게시판에는 회원번호가 있으니까
		//로그인할 때 세션에 저장한 아이디를 가지고 회원번호를 가져온다
		//free에 있는 회원번호랑 지금 로그인한 아이디랑 일치하는 회원번호
		Member userInfo = memberService.getUserInfo(loginid);
		logger.info("userInfo {}", userInfo);
		
		model.addAttribute("view", free);
		model.addAttribute("nick", loginnick);
		model.addAttribute("loginid", loginid);
		model.addAttribute("userInfo", userInfo);
		//상세보기 페이지 파일
		FreeFile freeFile = freeService.getFreeFile(freeBoard);
		logger.info("freeFile {}", freeFile);
		
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
	public String writepost(HttpSession session, Free free, MultipartFile file) {
		
		logger.info("/free/write [POST]");
		
		String loginid = (String) session.getAttribute("loginid");
//		String loginnick = (String) freeService.getNick(loginid);
		Member memberInfo = memberService.info(loginid);
		logger.info("memberInfo {}", memberInfo);
		logger.info("free {}", free);
		
		freeService.freeWrite(free, file, memberInfo);
		
//		Admin adminInfo = adminService.getAdmin()
		
		return "redirect:/free/main";
		
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/free/delete")
	public String delete (Free free, FreeFile freeFile) {
		freeService.delete(free ,freeFile);
		
		return "redirect:./main";
	}
	
	
	@GetMapping("/free/update")
	public void update(Model model, Free freeBoard, HttpSession session) {

		Free free = freeService.getView(freeBoard);
		logger.info("free {}", free);
		String loginid = (String) session.getAttribute("loginid");
		String loginnick = (String) freeService.getNick(loginid);
		//입력한 아이디랑 로그인 했을 때 아이디가 일치하는지 -> 근데 자유게시판에는 회원번호가 있으니까
		//로그인할 때 세션에 저장한 아이디를 가지고 회원번호를 가져온다
		//free에 있는 회원번호랑 지금 로그인한 아이디랑 일치하는 회원번호
		Member userInfo = memberService.getUserInfo(loginid);
		logger.info("userInfo {}", userInfo);
		
		FreeFile freeFile = freeService.getFreeFile(freeBoard);
		logger.info("freeFile {} ", freeFile);
		
		model.addAttribute("view", free);
		model.addAttribute("nick", loginnick);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("freeFile", freeFile);
		
	}
	
	@PostMapping("/free/update")
	public String updatePost(Model model, Free freeBoard, HttpSession session, int freeNo) {
		
		logger.info("/free/update [POST]");
		
		logger.info("freeBoard {}", freeBoard);
		
		//자유게시판 수정
		freeService.update(freeBoard);
		
		return "redirect:/free/main";
		
	}

	
}
