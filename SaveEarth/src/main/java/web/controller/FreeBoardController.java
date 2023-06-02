package web.controller;

import java.io.IOException;
import java.io.Writer;
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
import web.dto.Recommend;
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
		
		//말머리글 있을 때
//		Paging paging1 = freeService.getPagingByFreeHead(curPage,freeHead);
		
		//전체나 말머리글 없을 때
//		Paging paging2 = freeService.getPaging(curPage);
		
		Paging paging = freeService.getPaging(curPage);
		
		//페이징
			
		//페이징을 적용한 리스트 보여주기(userno을 기준으로 join)
		List<Map<String,Object>> list = freeService.list(paging, freeHead);
		model.addAttribute("list", list);
		model.addAttribute("freeHead", freeHead);
		logger.info("list {}", list);
		logger.info("freeController paging1 {}", paging);
			
		for(Map m : list) {
			logger.info(" list {} ", m);
		}
			
		model.addAttribute("paging", paging);
		
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
		model.addAttribute("loginId", loginId);
		
		//상세보기 페이지 파일 조회
//		FreeFile freeFile = freeService.getFreeFile(freeBoard);
		List<FreeFile> freeFile = freeService.getFreeFile(freeBoard);
		logger.info("freeFile {}", freeFile);
		model.addAttribute("freeFile", freeFile);
		
		//등록된 댓글 조회하기
		List<Map<String, Object>> commContent = freeService.getComment(freeBoard);
		
		logger.info("commContent {}", commContent);
		
		model.addAttribute("commContent", commContent);
		
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
	public String deleteBoard (Free free) {
		
		freeService.deleteFreeFile(free);
		freeService.deleteFree(free);
		
		
		return "redirect:/mypage/board"; 
	}
	
//	@RequestMapping("/free/deleteFile")
//	public void deleteFile (Free free, Model model) {
//		
//		logger.info("/free/deleteFile");
//		logger.info("free {}", free);
//		
//		freeService.deleteFreeFile(free);
//		
//		model.addAttribute("free", free);
//		
//	}
	
	
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
		
		List<FreeFile> freeFile = freeService.getFreeFile(freeBoard);
		logger.info("freeFile {}", freeFile);
		
		//자유게시판 내용 수정 + 파일
		freeService.updateFree(freeBoard, files,freeFile);
		
		return "redirect:/free/main";
		
	}
	
	//검색기능
	@RequestMapping("/free/search")
	public void searchKeyword(Model model,@RequestParam(value = "curPage", defaultValue = "1") int curPage, String keyword, String freeHead) {
		
		logger.info("/free/search [GET]");
		
		logger.info("curPage {}", curPage);
		Paging paging = freeService.getPagingByKeyword(curPage, keyword, freeHead);
		
		logger.info("freeHead {}", freeHead);
		logger.info("keyword {}", keyword);
		
		logger.info("paging {}", paging);

		List<Map<String,Object>> list = freeService.search(paging, keyword,freeHead);
		
		logger.info("list {}", list);
		
		model.addAttribute("list", list);
		model.addAttribute("freeHead", freeHead);
		model.addAttribute("paging", paging);
		model.addAttribute("keyword", keyword);
		
	}

//	@ResponseBody
	@GetMapping("/free/comment")
//	public List<Map<String,Object>> commentCheck(@RequestParam("commContent") String commContent, @RequestParam("freeNo") int freeNo, @RequestParam("userNo") int userNo) {
	public void viewList(@RequestParam("commContent") String commContent, @RequestParam("freeNo") int freeNo, @RequestParam("userNo") int userNo, Model model) {
//	public int commentCheck(@RequestParam("commContent") String commContent, @RequestParam("freeNo") int freeNo, @RequestParam("userNo") int userNo) {
//	public String commentCheck(@RequestParam("freeNo") int freeNo) {
		
		logger.info("commContent {}", commContent);
		logger.info("freeNo {}", freeNo);
		logger.info("userNo {}", userNo);
		
		//댓글 작성
		freeService.writeComment(commContent, freeNo, userNo);
		
		//등록된 댓글 조회하기
		List<Map<String, Object>> commList = freeService.getCommentByFreeNo(freeNo);
		
		logger.info("commList {}", commList);
		
		model.addAttribute("commList", commList);
		
//		return "/free/viewList";
		
	}
			
	@GetMapping("/free/commdelete")
	public void commdelete(@RequestParam("commNo") int commNo) {
		
		logger.info("commNo {}", commNo);
		
		//댓글 삭제
		freeService.deleteComm(commNo);
		
		//삭제한 댓글 리스트를 다시 조회
		
		
	}

	//추천기능
	@GetMapping("/free/recommend")
	public void recommend (Model model, Free free, Recommend recommend, HttpSession session, Writer out ) {
		
		
		logger.info("/free/recommend [GET]");
		
		//loginNo가 setUserNo에 넣음
		free.setUserNo((int)session.getAttribute("loginNo"));
		recommend.setUserNo((int)session.getAttribute("loginNo"));
		
		System.out.println(free);
		int res = freeService.selectRecommend(recommend);
		freeService.updateRecommend(free);
		boolean chk = freeService.checkRecommend(free);
		
		logger.info("{}",res);
		
		model.addAttribute("res", res);
		model.addAttribute("free", free);
		
		
//		 개인 추천조회
		if (chk == true) {
			try {
				//여기에 값을 두 개 넣을 수 있는 것을 알아보쟈아("{\"result\": false, \"recommend\": " + res + "}")
				out.write("{\"result\": true, \"recommend\": " + res + "}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else if ( chk == false ) {
			try {
				out.write("{\"result\":false,  \"recommend\":" + res + "}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@GetMapping("/free/deleteFile")
	public void updateFile(@RequestParam("fileNo") int fileNo, @RequestParam("freeNo") int freeNo, Model model) {
//		public void updateFile(@RequestParam("fileNo") int fileNo) {
		
		logger.info("fileNo {}", fileNo);
	
		//파일번호를 기준으로 파일 삭제
		freeService.deleteFile(fileNo);
		
		//삭제된 후 파일 리스트 조회
		List<FreeFile> freeFile = freeService.getFreeFile(freeNo);
		logger.info("freeFile {}", freeFile);
		model.addAttribute("freeFile", freeFile);
		
	}
	
	
}
