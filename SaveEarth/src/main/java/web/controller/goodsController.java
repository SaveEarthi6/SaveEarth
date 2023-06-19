package web.controller;


import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Cart;
import web.dto.Member;

import web.dto.Order;
import web.dto.OrderDetail;
import web.dto.OrderInfo;
import web.dto.ProdInq;
import web.dto.ProdOption;
import web.dto.ProdReView;
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
		
		// 파일 가져오기
		List<Map<String, Object>> prodList = goodsService.getgoodsList(paging);
		
		model.addAttribute("prodList", prodList);
		model.addAttribute("paging", paging);		
		
	}
	
	@RequestMapping("/detail")
	public void prodDetail(Model model, int prodno, HttpSession session) {
		
		Map<String, Object> goodsDetail = goodsService.getProdDetail(prodno);

		System.out.println(goodsDetail);
		System.out.println();
		
		//파일들 가져오기
		List<Map<String, Object>> detailfiles = goodsService.getdetailfiles(prodno);
		logger.info("상품번호에 맞는 파일들{}",detailfiles);
		
		//옵션 가져오기
		List<Map<String, Object>> prodOption = goodsService.getOptionList(prodno);

		//상품 문의 목록 가져오기
		List<Map<String, Object>> prodInq = goodsService.getInqList(prodno);
		logger.info("상품질문과 답변{}",prodInq);

		//리뷰 가져오기
		ProdReView prodreView = new ProdReView();
		prodreView.setProdNo(prodno);
		List<Map<String, Object>> reviewList = goodsService.reviewList(prodreView);
		logger.info("상품리뷰{}",reviewList);
		
//		로그인 확인하기( 로그인 안되면 로그인하라고하기)		
		session.getAttribute("isLogin");
		System.out.println("현재 로그인 세션 "+session.getAttribute("isLogin"));
		
	
		Object isLoginState = session.getAttribute("isLogin");
		if (isLoginState != null && (boolean) isLoginState) {
		    System.out.println("로그인 상태 테스트");
		    boolean login = true;
		    model.addAttribute("login", login);
		    model.addAttribute("userNo",(int)session.getAttribute("loginNo"));
		} else {
		    System.out.println("비로그인 상태 테스트");
		    
		    boolean login = false;
		    System.out.println(login);
		    model.addAttribute("login", login);
		    model.addAttribute("userNo",0);
		}
		
			model.addAttribute("goodsDetail", goodsDetail);
			model.addAttribute("prodOption", prodOption);
			model.addAttribute("detailfiles",detailfiles);	
			model.addAttribute("prodInq",prodInq);
			model.addAttribute("reviewList",reviewList);
		
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
		logger.info("카트리스트{}", cartList);
		
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
	
	//선택삭제
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
		
		 Member member = goodsService.getUserInfo((int)session.getAttribute("loginNo"));
		
		//선택 주문 장바구니 불러오기
		if(cartArr != null) {
			
			String[] cartNo = cartArr.split(",");
			
			List<Map<String, Object>> cartList = new ArrayList<>();
			
			for(int i = 0; i<cartNo.length; i++) {
				logger.info("{}", cartNo[i]);
				
				cartList.add(goodsService.getCartListBySelect((int)session.getAttribute("loginNo"), cartNo[i]));
				
			}
			
			model.addAttribute("cartList",cartList);
			model.addAttribute("member", member);
			logger.info("{}", cartList);
			
		  //전체 주문 장바구니 불러오기	
		} else if(cartArr == null) {
			
			//회원정보와 일치하는 카트List 전체 출력
			List<Map<String, Object>> cartList = goodsService.getcartList((int)session.getAttribute("loginNo"));
			logger.info("{}", cartList);
			
			model.addAttribute("cartList",cartList);
			model.addAttribute("member", member);
		}
		
	}
	
	//주문목록 불러오기
	@RequestMapping("/orderList")
	public void orderList(HttpSession session, Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/goods/orderList [GET]");
		
		Paging paging = goodsService.getPagingOrder((int)session.getAttribute("loginNo"), curPage);
		
		List<Order> orderList = goodsService.orderList((int)session.getAttribute("loginNo"), paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("orderList", orderList);
	}

	@PostMapping("/detailbuy")
	public void detailbuy(HttpSession session,@RequestParam("prodNo") int prodNo, @RequestParam("prodCount") int prodCount, @RequestParam("prodOptNo") int prodOptNo,Model model,
			 @RequestParam("prodStoredName") String prodStoredName
			) {
		System.out.println("상품넘버확인"+prodNo);
		System.out.println("상품갯수확인"+prodCount);
		System.out.println("상품옵션확인"+prodOptNo);
		System.out.println("상품사진"+prodStoredName);
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
		model.addAttribute("prodStoredName",prodStoredName);
	}
	
	//장바구니 결제하기
	@RequestMapping("/payment")
	public String payment(HttpServletRequest request, HttpSession session, Order order, String cartArr, Model model) {
		logger.info("/goods/payment GET]");
		logger.info("값 대입 전 order {}", order);
		logger.info("***************** 카트넘{}", cartArr);


		
		//주문번호
		Calendar cal = Calendar.getInstance();
		String date = cal.get(Calendar.YEAR) + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1) + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String orderNo = cal.get(Calendar.YEAR) + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1) + new DecimalFormat("00").format(cal.get(Calendar.DATE)) + "_" + UUID.randomUUID().toString().split("-")[0];
		
		logger.info("{}", orderNo);		
		
		order.setOrderNo(orderNo);
		order.setUserNo((int)session.getAttribute("loginNo"));
		
		logger.info("값 대입 후 order {}", order);
		
		goodsService.paymentTest(request, order, cartArr);
		
		//선택결제라면
		if(cartArr != null) {
			
			logger.info("*********************주문 후 선택삭제 실행됨");
			
			String[] cartNo = cartArr.split(",");
		
			for(int i = 0; i<cartNo.length; i++) {
				
				goodsService.deleteCart((int)session.getAttribute("loginNo"), cartNo[i]);
				
			}

		//전체 결제라면
		} else {
			logger.info("***************주문 후 전체 삭제 실행됨");
			goodsService.deleteCart((int)session.getAttribute("loginNo"));
		}
		

		return "redirect:./orderView?orderNo=" + orderNo;
		
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
	  
	  //주문자 배송정보 불러오기
	  @ResponseBody
	  @RequestMapping("/getShipInfo")
	  public Member getShipInfo(HttpSession session, Member member) {
		  logger.info("/goods/getShipInfo [GET]");
		  
		  Member memberinfo = goodsService.getUserShipInfo((int)session.getAttribute("loginNo"));
		  
		  return memberinfo;
	  }
	  
	  //주문번호 상세보기
	  @RequestMapping("/orderView")
	  public void orderView(HttpSession session, String orderNo, Model model) {
		  logger.info("/goods/orderView [GET]");
		  logger.info("{}", orderNo);
		  
		  List<OrderInfo> orderInfo = goodsService.getOrderInfo((int)session.getAttribute("loginNo"), orderNo);
		  
		  logger.info("{}", orderInfo);
		  
		  model.addAttribute("orderInfo", orderInfo);
		  
	  }
	  
	  // 모달로 값받아와서 문의내용 DB저장하기
	  @PostMapping("/writeInq")
	  public String writeInq(int prodNo, ProdInq prodInq, HttpSession session) {
		  
		  prodInq.setUserNo((int)session.getAttribute("loginNo"));
		  logger.info("{}",prodInq);
		  
		  goodsService.insertInq(prodInq);
		  
		  return "redirect:/goods/detail?prodno=" + prodNo; 
	  }
	  
	  @RequestMapping("orderFail")
	  public void orderFail() {
		  
	  }
	  
	  @ResponseBody
	  @PostMapping("review")
	  public Map<String, Object> review(@RequestBody ProdReView prodreView,HttpSession session) {
	      logger.info("{}",prodreView);
	      
	      System.out.println((int)session.getAttribute("loginNo"));
	      prodreView.setUserNo((int)session.getAttribute("loginNo"));
	      
	      //상품 구매했나 체크
	      int ordercheck = goodsService.ordercheck(prodreView);
	      Map<String, Object> response = new HashMap<>();
	      
	      if(ordercheck>0) {
	    	  
		      boolean checkreview = goodsService.checkreview(prodreView);
		      System.out.println(checkreview);
		      
		      if(checkreview) {
		    	  
		    	  response.put("message", "이미 해당상품에 리뷰를 작성하셧습니다");
		    	  return response;
		      } else {
		    	  goodsService.addreview(prodreView);
		    	  logger.info("{}",prodreView);
		    	  //방금 쓴글 가져오기(id랑합쳐서)
		    	  Map<String, Object> getreview = goodsService.getnowreview(prodreView);
		    	  
		    	  response.put("review", getreview);
		    	  logger.info("{}response",response);
		    	  return response;
		      }
	    	  
	      } else {
		      response.put("message", "상품을 구매하셔야 합니다");
		      return response;
	    	  
	      }

	  }
	  
	  @RequestMapping("/deleteReview")
	  public String deleteReview(@RequestParam("reviewNo") int reviewNo,int prodNo) {

		  goodsService.deletereview(reviewNo);


		  return "redirect:/goods/detail?prodno=" + prodNo;
	  }	
	  
	  @RequestMapping("/directpayment")
	  public String directpayment(HttpServletRequest request, HttpSession session, Order order, Model model,
			   String userNo, String prodNo, String prodCount, String prodOptNo,OrderDetail orderdetail) {
		  
			logger.info("/goods/payment GET]");
			logger.info("값 대입 전 order {}", order);  
			
			//주문번호
			Calendar cal = Calendar.getInstance();
			String date = cal.get(Calendar.YEAR) + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1) + new DecimalFormat("00").format(cal.get(Calendar.DATE));
			String orderNo = cal.get(Calendar.YEAR) + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1) + new DecimalFormat("00").format(cal.get(Calendar.DATE)) + "_" + UUID.randomUUID().toString().split("-")[0];
			
			logger.info("{}", orderNo);		
			
			order.setOrderNo(orderNo);
			order.setUserNo((int)session.getAttribute("loginNo"));	
			
			goodsService.directpaymentTest(request, order);
			
			orderdetail.setOrderNo(orderNo);
			orderdetail.setProdNo(Integer.parseInt(prodNo));
			orderdetail.setProdAmount(Integer.parseInt(prodCount));
			orderdetail.setProdOptNo(Integer.parseInt(prodOptNo));
			
			goodsService.directorderdetail(orderdetail);
	
			
			
		  
		  return "redirect:./orderView?orderNo=" + orderNo;
	  }
	  
	  
	  //	  

}
