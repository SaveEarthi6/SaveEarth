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

import web.dto.Admin;
import web.dto.Free;
import web.dto.FreeFile;
import web.dto.Member;
import web.service.face.AdminService;
import web.service.face.MemberService;
import web.util.Paging;

@Controller
@RequestMapping("/admin")
public class AdminController {

   private final Logger logger = LoggerFactory.getLogger(this.getClass());

   @Autowired
   AdminService adminService;
   @Autowired
   MemberService memberService;

   // 자유 게시판
   @RequestMapping("/free")
   public void main(Model model, @RequestParam(defaultValue = "0") int curPage) {

      // 페이징
      Paging paging = adminService.getPaging(curPage);

      // 페이징을 적용한 리스트 보여주기(userno을 기준으로 join)
      List<Map<String, Object>> list = adminService.list(paging);
      logger.info("list {}", list);

      for (Map m : list) {
         logger.info(" list {} ", m);
      }

      // jsp에서 쓰기 위해서는 map의 컬럼명과 동일하게 해주어야 한다
      model.addAttribute("list", list);
      model.addAttribute("paging", paging);
   }

   
   @GetMapping("/freeView")
   public void detail(Model model, Free freeBoard, HttpSession session) {
      
      logger.info("/freeView [GET]");
      
      //게시글 조회
      Map<String, Object> view = adminService.getView(freeBoard);
      logger.info("free {}", view);
      
      //로그인한 회원과 작성자가 같은 회원인지 비교하기 위한 정보
      String loginId = (String) session.getAttribute("loginId");
      Member userInfo = memberService.getUserInfo(loginId);
      logger.info("userInfo {}", userInfo);
      
      model.addAttribute("view", view);
      model.addAttribute("userInfo", userInfo);
      
      //상세보기 페이지 파일 조회
//      FreeFile freeFile = freeService.getFreeFile(freeBoard);
      List<FreeFile> freeFile = adminService.getFreeFile(freeBoard);
      
      logger.info("freeFile {}", freeFile);
      model.addAttribute("freeFile", freeFile);
      
   }

   @GetMapping("/freeWrite")
   public void write(HttpSession session, Model model) {
	   logger.info("/freeWrite [GET]");
	   
		String loginId = (String) session.getAttribute("loginId");
		logger.info("id {}", loginId);
		
		Admin memberInfo = adminService.info(loginId);
		System.out.println("맴버정보"+memberInfo);
		model.addAttribute("id", loginId);
		model.addAttribute("nick", loginId);
		model.addAttribute("memberInfo", memberInfo);
	   
   }
   
 
   
   @PostMapping("/freeWrite")
   public String writepost(HttpSession session, Free free, @RequestParam(required = false) List<MultipartFile> files) {
      
      logger.info("/freeWrite [POST]");
      
      //로그인 정보를 가지고 회원번호랑 관리자 번호를 가져옴
      String loginId = (String) session.getAttribute("loginId");
//    Member memberInfo = null;      
      Admin memberInfo = adminService.info(loginId);
      //만약 회원번호가 있으면 회원번호를 가져오고
      //관리자번호가 있으면 관리자 번호를 가져오고
      
      logger.info("memberInfo {}", memberInfo);
      
      logger.info("free {}", free);
      logger.info("files {}", files);
      
      adminService.freeWrite(free, files, memberInfo);
      
      return "redirect:./free";
      
   }
   

   @GetMapping("/login")
   public void loginpage() {
      logger.info("admin/login[Get]");
   }

   @PostMapping("/login")
   public String login(HttpSession session, Admin admin) {
//		logger.info("/member/login");
//		logger.info("{}", admin);
		boolean isLogin = adminService.login(admin);
		
		admin = adminService.info(admin.getAdminId());
		System.out.println(admin);
		System.out.println("유저번호" +admin.getAdminNo());
		
		if( isLogin) {
			session.setAttribute("isLogin", isLogin);
			session.setAttribute("loginId", admin.getAdminId());
			session.setAttribute("loginNo", admin.getAdminNo());
			
		} else {
			session.invalidate();
		}
		
		return "redirect:/admin/free";		
	}

}
