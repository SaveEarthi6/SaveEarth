package web.controller;

import java.security.MessageDigest;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import web.dto.Free;
import web.dto.FreeComment;
import web.dto.Member;
import web.dto.Order;
import web.service.face.AdminService;
import web.service.face.FreeService;
import web.service.face.GoodsService;
import web.service.face.MemberService;
import web.service.face.MypageService;
import web.util.Paging;

//test
@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired MemberService memberService;
	@Autowired FreeService freeService;
	@Autowired GoodsService goodsService;
	@Autowired MypageService mypageService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/update") // 마이페이지 - 개인정보 불러오기
	public void mypageUpdate(HttpSession session, Model model, Member member) {
		logger.info("/mypage/update[GET]");
		
		String loginId = (String) session.getAttribute("loginId");
		logger.info("{}", loginId);
		
		System.out.println("loginId에 들어있는거 : " + loginId); //세션정보
		
		Member info = mypageService.info(loginId);
		logger.info("info: {}", info);
		
		System.out.println("info 안에들어있는거 : " + info); //세선졍보
		
		model.addAttribute("info", info); 
	}
	
	
	
	@PostMapping("/update") // 마이페이지 - 개인정보 수정
	public String mypageUpdateProc(HttpSession session, Member member) {
		
		member.setUserId((String)session.getAttribute("loginId"));
		logger.info("{}", member);

		
		//암호화 테스트
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(member.getUserPw().getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			member.setUserPw(hexString.toString());
			System.out.println(member.getUserPw());
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}		

		System.out.println("Member 안에 들어있는거 : " + member);
		mypageService.update(member);
		
		return "redirect:/mypage/update";
	}
	
	
	@GetMapping("/delete") // 마이페이지 회원탈퇴 - 개인정보 불러오기 
	public void mypageDelete(HttpSession session, Model model) {
		logger.info("/mypage/delete[GET]");
		
		String loginId = (String) session.getAttribute("loginId");
		logger.info("{}", loginId);
		
		Member info = mypageService.info(loginId);
		
		logger.info("info: {}", info);
		
		model.addAttribute("info", info);
	}
	
	@PostMapping("/delete") // 마이페이지 회원탈퇴 - 회원탈퇴
	public String mypageDeleteProc(Member member, HttpSession session) {
		logger.info("/delete/delete[POST]");
		
		String loginId = (String) session.getAttribute("loginId");
		logger.info("controller{}", loginId);
		
		mypageService.delete(loginId);
		
		return "redirect:/member/logout";
	}
	
		
	@RequestMapping("/board") // 마이페이지 - 작성한글 조회
	public void mypageBoard(HttpSession session, Free free, Model model, @RequestParam(value = "curPage", defaultValue = "1") int curPage) {
		logger.info("/mypage/board[RequestMapping]");
		
		logger.info("curPage {}", curPage);
		
		int userNo = (int) session.getAttribute("loginNo");
		
		logger.info("userNo {}", userNo);
		
		Paging paging = mypageService.getPagingBoard(curPage, userNo);
		
		System.out.println("paging 페이징안에 들어있는거 :" + paging);
		
		List<Map<String,Object>> MypageBoardlist = mypageService.MypageBoardlist(paging);
		logger.info("페이징처리:list {}", MypageBoardlist);

		for(Map m : MypageBoardlist) {
			logger.info(" list {} ", m);
			
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("MypageBoardlist", MypageBoardlist);
		
		// 내 정보 불러오기 
		String loginId = (String) session.getAttribute("loginId");
		logger.info("{}", loginId);
		
		Member info = mypageService.info(loginId);
		logger.info("info: {}", info);

		// 게시글 리스트 
		free.setUserNo(info.getUserNo());
		List<Free> mypageList = mypageService.mypageList(info.getUserNo());
		System.out.println(mypageList);
		
		for(Free m : mypageList) {
			logger.info(" list {} ", m);
		}
		
		model.addAttribute("mypageList", mypageList);

	}
	
	
	//마이페이지 - 내가 쓴 댓글 확인
	@RequestMapping("/comment")
	public void mypagecomment(Model model, FreeComment freeComment, HttpSession session) {
		System.out.println("마이페이지 내가 쓴 댓글 보기");
		
		// 내 정보 불러오기 
		String loginId = (String) session.getAttribute("loginId");
		logger.info("{}", loginId);
				
		Member info = mypageService.info(loginId);
		logger.info("info: {}", info);
				
		freeComment.setUserNo(info.getUserNo());
				
				
		// 게시글 리스트
		List<FreeComment> list = mypageService.commitList(info.getUserNo());
		
		System.out.println("list안에 들어있는거 : " + list );
		System.out.println("freeComment 안에 들어있는거 : " + freeComment);
				
		for(FreeComment f : list) {
			logger.info(" list {} ", f);
		}
			model.addAttribute("comment", list);
	
	}
	
	//마이페이지 - 내가 쓴 댓글 삭제 
	@RequestMapping("/commentDelete")
	public String mypagecommentDelete(FreeComment cammNo) {
		System.out.println("마이페이지 내가 쓴 댓글 삭제");
		
		mypageService.deleteComment(cammNo);
		
		
		return "redirect: ./comment";
	}
	
	//주문목록 불러오기
	@RequestMapping("/order")
	public void orderList(HttpSession session, Model model,  @RequestParam(value = "curPage", defaultValue = "1") int curPage) {
		logger.info("/goods/orderList [GET]");
		
		Paging paging = mypageService.orderPaging(curPage);
		
		System.out.println("paging 안에 들어있는거 : " + paging);
		
		List<Map<String,Object>> orderList = mypageService.orderList((int)session.getAttribute("loginNo"), paging);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("paging", paging);
	}

}
