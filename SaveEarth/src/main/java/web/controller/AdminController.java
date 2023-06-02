   package web.controller;

import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Admin;
import web.dto.Calendar;
import web.dto.Campaign;
import web.dto.CampaignFile;
import web.dto.Certification;
import web.dto.Free;
import web.dto.FreeFile;
import web.dto.Info;
import web.dto.Member;
import web.service.face.AdminService;
import web.service.face.CampService;
import web.service.face.MemberService;
import web.util.Paging;

@Controller
@RequestMapping("/admin")
public class AdminController {

   
      @Autowired AdminService adminService;
      @Autowired MemberService memberService;
      @Autowired CampService campService;
      
      private final Logger logger = LoggerFactory.getLogger(this.getClass());
   
      @GetMapping("/login")
      public void loginpage() {logger.info("/admin/login[Get]");}

   @PostMapping("/login")
   public String login(HttpSession session, Admin admin, Model model) {
      logger.info("/admin/login");
      logger.info("어드민 로그인 정보 : {}", admin);
      boolean isLogin = adminService.login(admin);

      admin = adminService.info(admin.getAdminId());
      logger.info("어드민 접속 정보:{}", admin);
      logger.info("어드민 번호:{}", admin.getAdminNo());


      if (isLogin) {
         session.setAttribute("isLogin", isLogin);
         session.setAttribute("loginId", admin.getAdminId());
         session.setAttribute("loginNo", admin.getAdminNo());
        
         return "redirect:/admin/free";
      } else {
         session.invalidate();
         return "redirect:/admin/login";
      }

     
   }
   
   
   
   
   
   

   // 자유 게시판, 페이징
   @RequestMapping("/free")
   public void main(Model model, @RequestParam(defaultValue = "0") int curPage) {

      // 페이징
      Paging paging = adminService.getPaging(curPage);

      // 페이징을 적용한 리스트 보여주기(userno을 기준으로 join)
      List<Map<String, Object>> list = adminService.list(paging);
      logger.info("자유게시판 list : {}", list);

      for (Map m : list) {
         logger.info(" list {} ", m);
      }

      model.addAttribute("list", list);
      model.addAttribute("paging", paging);
   }

   @GetMapping("/freeView") // 관리자 페이지 (자유게시판 상세보기)
   public void detail(Model model, Free freeBoard, HttpSession session) {

      logger.info("/admin/freeView [GET]");

      // 게시글 조회
      Map<String, Object> view = adminService.getView(freeBoard);
      logger.info("free {}", view);

      // 로그인한 회원과 작성자가 같은 회원인지 비교하기 위한 정보
      String loginId = (String) session.getAttribute("loginId");
      Member userInfo = memberService.getUserInfo(loginId);
      logger.info("userInfo {}", userInfo);

      model.addAttribute("view", view);
      model.addAttribute("userInfo", userInfo);

      // 상세보기 페이지 파일 조회
//    FreeFile freeFile = freeService.getFreeFile(freeBoard);
      List<FreeFile> freeFile = adminService.getFreeFile(freeBoard);

      logger.info("freeFile {}", freeFile);
      model.addAttribute("freeFile", freeFile);

   }

   // 관리자 페이지(자유게시판 글쓰기)
   @GetMapping("/freeWrite")
   public void write(HttpSession session, Model model) {
      logger.info("/freeWrite [GET]");

      String loginId = (String) session.getAttribute("loginId");
      logger.info("관리자 id : {}", loginId);

      Admin memberInfo = adminService.info(loginId);

      logger.info("관리자 정보 : {}", memberInfo);

      model.addAttribute("id", loginId);
      model.addAttribute("memberInfo", memberInfo);

   }

   @PostMapping("/freeWrite")
   public String writepost(HttpSession session, Free free, @RequestParam(required = false) List<MultipartFile> files,
         Member member) {

      logger.info("/freeWrite [POST]");

      // 로그인 정보를 가지고 회원번호랑 관리자 번호를 가져옴
      String loginId = (String) session.getAttribute("loginId");
//    Member memberInfo = null;      

      Admin memberInfo = adminService.info(loginId);
      // 만약 회원번호가 있으면 회원번호를 가져오고
      // 관리자번호가 있으면 관리자 번호를 가져오고

      logger.info("memberInfo {}", memberInfo);
      
      logger.info("free {}", free);
      logger.info("files {}", files);
      
      adminService.freeWrite(free, files, memberInfo, member);
      
      return "redirect:./free";
      
   }
   

   @RequestMapping("/freeDelete")
   public String freeDelete(Free free) {
      adminService.delete(free);

      return "redirect:./free";
   }

   // 캠페인 게시판
   @GetMapping("/campaign")
   public void campMainGet(HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage) {
      logger.info("/campaign/main [GET]");
      logger.info("curPage : {}", curPage);

      Paging paging = adminService.getPaging(curPage);

      // 캠페인 불러오기
      List<Campaign> campList = adminService.getCampList(paging);

      for (Campaign c : campList) {
         logger.info("{}", c);
      }

      model.addAttribute("campList", campList);
      model.addAttribute("paging", paging);

   
   }
   

   @PostMapping("/main")
   public String campMainPost(MultipartFile partFile, Certification certification ) {
      logger.info("/campaign/main [POST]");
      logger.info("{}", partFile);
      
      adminService.writePart(certification, partFile);
      
      
      return "redirect:./campaign";
   }
   
   
   
   // 관리자 페이지(캠페인 게시판 글쓰기 GET)
   @GetMapping("/campaignWrite")
   public void campaignWrite(HttpSession session, Model model) {
      logger.info("/campaignWrite [GET]");



      String loginId = (String) session.getAttribute("loginId");
      logger.info("관리자 id : {}", loginId);


      Admin memberInfo = adminService.info(loginId);

      logger.info("관리자 정보 : {}", memberInfo);

      model.addAttribute("id", loginId);
      model.addAttribute("memberInfo", memberInfo);

   }

   //관리자 페이지 (캠페인 게시판 글쓰기 POST)
   @PostMapping("/campaignWrite")
   public String campaignWritePost(HttpSession session, Campaign campaign, @RequestParam(required = false) List<MultipartFile> files,
         Member member) {

      logger.info("/campaignWrite [POST]");

      // 로그인 정보를 가지고 회원번호랑 관리자 번호를 가져옴
     String loginId = (String) session.getAttribute("loginId");
//      Member memberInfo = null;      

     Admin memberInfo = adminService.info(loginId);
      // 만약 회원번호가 있으면 회원번호를 가져오고
      // 관리자번호가 있으면 관리자 번호를 가져오고

      logger.info("memberInfo {}", memberInfo);
      
      logger.info("campaign {}", campaign);
      logger.info("files {}", files);
      
      campaign.setAdminNo(memberInfo.getAdminNo());
      
      adminService.campaignWrite(campaign, files, memberInfo);
      
      return "redirect:./campaign";
      
   }
   
   
   @RequestMapping("/campaign")
	public void campaign(Model model, @RequestParam(defaultValue = "0") int curPage) {

		// 페이징
		Paging paging = adminService.getPaging(curPage);

		List<Map<String, Object>> camlist = adminService.Camlist(paging);
		logger.info("자유게시판 Camlist : {}", camlist);

		for (Map m : camlist) {
			logger.info(" Camlist {} ", m);
		}

		model.addAttribute("camlist", camlist);
		model.addAttribute("paging", paging);
	}
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   @RequestMapping("info")
   public void adminInfo() {
      logger.info("Admin/info[Mapping]");
      
      
   }
   

   
   
   
   
   
   
   
   
   
   
   
   

}