package web.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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

import web.dto.Order;
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
//		List<Product> prodList = goodsService.getgoodsList(paging);
		
		// 파일 가져오기
		List<Map<String, Object>> prodList = goodsService.getgoodsList(paging);
		
		
		System.out.println(prodList.get(0));
		
//		for(List<Map<String, Object>> c : prodList) {
//			logger.info("{}", c);
//		}
		
		model.addAttribute("prodList", prodList);
		model.addAttribute("paging", paging);		
		
		
		
	}
	
	@RequestMapping("/detail")
	public void prodDetail(Model model, int prodno, HttpSession session) {
//		logger.info("/goods/detail [GET]");
//		logger.info("prodno : {}", prodno);
		

		
		Map<String, Object> goodsDetail = goodsService.getProdDetail(prodno);
//		logger.info("{}", goodsDetail);
		System.out.println(goodsDetail);
		
		//옵션 가져오기
		List<Map<String, Object>> prodOption = goodsService.getOptionList(prodno);
		for(Map<String, Object> o : prodOption) {
//			logger.info("{}", o);
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
				goodsService.deleteCartBySelect((int)session.getAttribute("loginNo"), cartNo);
			}
			
			return 1;
			
		} else {
			return 0;
		}
		
	}
	
	//주문하기 페이지
	@GetMapping("/order")
	public void orderAll(HttpSession session, Model model, String cartArr) {
		logger.info("/goods/order [GET]");
		logger.info("{}", cartArr);
		
		//선택 주문 장바구니 불러오기
		if(cartArr != null) {
			
			String[] cartNo = cartArr.split(",");
			
			List<Map<String, Object>> cartList = new ArrayList<>();
			
			for(int i = 0; i<cartNo.length; i++) {
				logger.info("{}", cartNo[i]);
				
				cartList.add(goodsService.getCartListBySelect((int)session.getAttribute("loginNo"), cartNo[i]));
				
			}
			
			model.addAttribute("cartList",cartList);
			logger.info("{}", cartList);
			
		  //전체 주문 장바구니 불러오기	
		} else if(cartArr == null) {
			
			//회원정보와 일치하는 카트List 전체 출력
			List<Map<String, Object>> cartList = goodsService.getcartList((int)session.getAttribute("loginNo"));
			logger.info("{}", cartList);
			
			model.addAttribute("cartList",cartList);
		}
		
	}
	
	//주문 배송지 폼 DB 삽입
	@PostMapping("/order")
	public void orderinsert(HttpSession session, Order order) {
		logger.info("/goods/order [POST]");
		
		//주문번호
		Calendar cal = Calendar.getInstance();
		String date = cal.get(Calendar.YEAR) + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1) + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String orderNo = cal.get(Calendar.YEAR) + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1) + new DecimalFormat("00").format(cal.get(Calendar.DATE)) + "_" + UUID.randomUUID().toString().split("-")[0];
		
		logger.info("{}", orderNo);		
		
		order.setOrderNo(orderNo);
		order.setUserNo((int)session.getAttribute("loginNo"));
		
		logger.info("{}", order);
		
		goodsService.makeOrder(order);
		
		goodsService.deleteCart((int)session.getAttribute("loginNo"));
		
	}
	
	//주문목록 불러오기
	@RequestMapping("/orderList")
	public void orderList(HttpSession session, Model model) {
		logger.info("/goods/orderList [GET]");
		
		List<Order> orderList = goodsService.orderList((int)session.getAttribute("loginNo"));
		
		model.addAttribute("orderList", orderList);
	}
	
	//선택 주문
	@RequestMapping("/orderSelect")
	public Model orderSelect(HttpSession session, @RequestParam("chbox[]") List<String> chArr, Model model) {
		logger.info("/goods/orderSelect [GET]");
		logger.info("{}", chArr);
		logger.info("{}", session.getAttribute("loginNo"));
		
		// order.jsp로 model값 넘겨주기
		
		List<Map<String, Object>> cartList = new ArrayList<>();
		
		//로그인 된 상태이면
		if(session.getAttribute("isLogin") != null) {
			for(String cartNo : chArr) {
//				goodsService.getCartListBySelect((int)session.getAttribute("loginNo"), cartNo);
				cartList.add(goodsService.getCartListBySelect((int)session.getAttribute("loginNo"), cartNo));
			}
			
			model.addAttribute("cartList",cartList);
			logger.info("{}", cartList);
			return model;
			
		} else {
			return model;
		}
		
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
	
	@RequestMapping("/payment")
	public void payment(HttpServletRequest request, HttpSession session, Order order) {
		logger.info("/goods/payment [GET]");
		
		
		
		goodsService.paymentTest(request);
		
		
		
		
		
		
	}
	
	@RequestMapping("/cartAmount")
	public String cartAmount(@RequestParam Map<String, Object> param, Model model, HttpSession session) {
		logger.info("/cartAmount [POST]");
		logger.info("{}", param);
		
		goodsService.updateAmount(param);
		
		List<Map<String, Object>> cartList = goodsService.getcartList((int)session.getAttribute("loginNo"));
		logger.info("asdsaadsd{}", cartList);
		model.addAttribute("cartList", cartList);
		
		return "/goods/cartList";
		
	}
	

	  

	
	

//	  @PostMapping("/complete")
	  @RequestMapping("/complete")
//	  public String complete( String userName,String userPostcode, String userAddr, String userDetailaddr, String userPhone, String totalPrice, String prodNo, HttpSession session ) {
		  public String complete(  ) {		  

//		  Ordertb ordertb = new Ordertb();
//		  ordertb.setOrderRec(userName);
//		  ordertb.setOrderAddrPostcode(userPostcode);
//		  ordertb.setOrderAddr(userAddr);
//		  ordertb.setOrderAddrDetail(userDetailaddr);
//		  ordertb.setOrderPhone(userPhone);
//		  ordertb.setOrderPrice(totalPrice);
//		  //주문번호
//		 System.out.println(session.getAttribute("loginNo"));
//			
//		 int userNo=(int)session.getAttribute("loginNo");
//		 ordertb.setOrderNo(1);	
//		 ordertb.setUserNo(userNo);
//		 goodsService.insertordertb(ordertb);
		  
		  
		  
		    
	
          
	       
	  
	       
        

	       

	       
		  
	

		  
	    return "goods/paycomplete"; // 결제 완료 페이지로 이동
	  }
	  
	  @ResponseBody
	  //주문자 배송정보 불러오기
	  @RequestMapping("/getShipInfo")
	  public Member getShipInfo(HttpSession session, Member member) {
		  logger.info("/goods/getShipInfo [GET]");
		  
		  Member memberinfo = goodsService.getUserShipInfo((int)session.getAttribute("loginNo"));
		  
		  return memberinfo;
	  }
	

}
