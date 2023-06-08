package web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;


import web.dto.Cart;
import web.dto.Member;
import web.dto.ProdOption;
import web.dto.Product;
import web.service.face.GoodsService;
import web.service.face.MemberService;
import web.util.Paging;

@Controller
@RequestMapping("/goods")
public class goodsController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired GoodsService goodsService;
	@Autowired MemberService memberService;
	
	@GetMapping("/main")
	public void goodsmainget(HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage){
	
	//상품을 불러온다

		//전체글 페이징
		Paging paging = goodsService.getPaging(curPage);
		
		//첫 로드시 상품 불러오기
		List<Product> prodList = goodsService.getgoodsList(paging);
		
		// 파일 가져오기
		
		

		
		for(Product c : prodList) {
			logger.info("{}", c);
		}
		
		model.addAttribute("prodList", prodList);
		model.addAttribute("paging", paging);		
		
		
		
	}
	
	@RequestMapping("/detail")
	public void prodDetail(Model model, int prodno) {
		logger.info("/goods/detail [GET]");
		logger.info("prodno : {}", prodno);
		
		Map<String, Object> goodsDetail = goodsService.getProdDetail(prodno);
		logger.info("{}", goodsDetail);
		
		//옵션 가져오기
		List<Map<String, Object>> prodOption = goodsService.getOptionList(prodno);
		for(Map<String, Object> o : prodOption) {
			logger.info("{}", o);
		}		
		
		
		model.addAttribute("goodsDetail", goodsDetail);
		model.addAttribute("prodOption", prodOption);
	}
	
	@ResponseBody
	@GetMapping("/gettotal")
	public int gettotal(int num, int price) {
		System.out.println(num);
		System.out.println(price);
		
		int result = num*price;
		System.out.println(result);
		return result;
	}
	//장바구니 리스트 보여주기(2023-06-04일단 리스트 가져오기까지)
	//( 카트랑 상품,상품파일 3개 조인 where 유저넘버=세션유저넘버) 이용해서 가져와야함
	@GetMapping("/cart")
	public String getCart(HttpSession session, Model model) {
		int userNo=(int)session.getAttribute("loginNo");
		
		List<Map<String, Object>> cartList = goodsService.getcartList(userNo);
		logger.info("카드리스트{}", cartList);
		
		model.addAttribute("cartList",cartList);
		
		return "goods/cart";

		
	}
	
	@GetMapping("/addCart")
	public String  addCart(HttpSession session,@RequestParam("prodOptNo") int prodOptNo,@RequestParam("prodno") int prodno,@RequestParam("prodCount") int prodCount, Cart cart) {
		
		//가져온 값들로 장바구니로 Insert 시켜봄
		System.out.println(session.getAttribute("loginNo"));
		
		int userNo=(int)session.getAttribute("loginNo");
		System.out.println("옵션번호"+ prodOptNo);

		//유저번호
		cart.setUserNo(userNo);
		//수량
		cart.setProdCount(prodCount);
		//상품번호
		cart.setProdNo(prodno);
		//옵션번호
		cart.setProdOptNo(prodOptNo);
		
		
		System.out.println(cart);
		
		goodsService.addCart(cart);
		
		
		//장바구니 담고 다시 상세페이지 창으로 돌아가
		return "redirect:/goods/detail?prodno=" + prodno; 
		
	}
	
	@ResponseBody
	@PostMapping("/deleteCart")
	public int deleteCart(HttpSession session, @RequestParam("chbox[]") List<String> chArr) {
		logger.info("/goods/deleteCart [POST]");
		logger.info("{}", chArr);
		logger.info("{}", session.getAttribute("loginNo"));
		
		//로그인 된 상태이면
		if(session.getAttribute("isLogin") != null) {
			for(String cartNo : chArr) {
				goodsService.deleteCart((int)session.getAttribute("loginNo"), cartNo);
			}
			
			return 1;
			
		} else {
			return 0;
		}
		
	}
	
	@RequestMapping("/orderAll")
	public void orderAll(HttpSession session, @RequestParam("chbox[]") List<String> chArr, Model model) {
		//주문페이지로 이동
		logger.info("/goods/orderAll [POST]");
		
//		List<Map<String, Object>> cartList = new ArrayList<>();
//		
//		for(String cartNo : chArr) {
//			cartList.add(goodsService.getcartList((int)session.getAttribute("loginNo"), cartNo));
//		}
//		logger.info("{}", cartList);
//		
//		model.addAttribute("cartList",cartList);
		
		
	}
	

	
	


	@PostMapping("/detailbuy")
	public void detailbuy(HttpSession session,@RequestParam("prodNo") int prodNo, @RequestParam("prodCount") int prodCount, @RequestParam("prodOptNo") int prodOptNo,Model model) {
		System.out.println("상품넘버확인"+prodNo);
		System.out.println("상품갯수확인"+prodCount);
		System.out.println("상품옵션확인"+prodOptNo);
		//로그인 정보
		String loginId = (String) session.getAttribute("loginId");
		logger.info("{}", loginId);
		Member info = memberService.info(loginId);
		logger.info("info: {}", info);

		//상품정보
		Product product = goodsService.getProdinfo(prodNo);
		logger.info("상품정보 :{}", product);
		
		//상품옵션
		ProdOption option = goodsService.getProdopt(prodOptNo);
		logger.info("상품옵션 :{}", option);
		
		model.addAttribute("info", info);
		model.addAttribute("product", product );
		model.addAttribute("option", option );
		model.addAttribute("prodCount",prodCount);
	}
	

	  


	  @PostMapping("/complete")
	  public String completePayment(HttpServletRequest request) {
	    // 아임포트 결제 정보를 가져옵니다.
	    String merchantUid = request.getParameter("merchant_uid");
	    String status = request.getParameter("status");
	    String impUid = request.getParameter("imp_uid");
	    
	    System.out.println(merchantUid);
	    System.out.println(status);
	    System.out.println(impUid);
	    
	    // 원하는 값으로 SQL INSERT 작업 수행
//	    Payment payment = new Payment();
//	    payment.setMerchantUid(merchantUid);
//	    payment.setStatus(status);
//	    payment.setImpUid(impUid);
//	    paymentService.insertPayment(payment); 
	    
	    return "goods/paycomplete"; // 결제 완료 페이지로 이동
	  }
	

}
