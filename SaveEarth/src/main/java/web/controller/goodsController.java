package web.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Campaign;
import web.dto.Cart;
import web.dto.Product;
import web.service.face.GoodsService;
import web.util.Paging;

@Controller
@RequestMapping("/goods")
public class goodsController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired GoodsService goodsService;
	
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
		
		
		
		model.addAttribute("goodsDetail", goodsDetail);
		
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
		logger.info("{}", cartList);
		
		model.addAttribute("cartList",cartList);
		
		return "goods/cart";

		
	}
	
	@GetMapping("/addCart")
	public String  addCart(HttpSession session,@RequestParam("prodno") int prodno,@RequestParam("prodCount") int prodCount, Cart cart) {
		
		//가져온 값들로 장바구니로 Insert 시켜봄
		System.out.println(session.getAttribute("loginNo"));
		
		int userNo=(int)session.getAttribute("loginNo");


		//유저번호
		cart.setUserNo(userNo);
		//수량
		cart.setProdCount(prodCount);
		//상품번호
		cart.setProdNo(prodno);
		
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
	
	//전체 주문하기
	@RequestMapping("/order")
	public void orderAll(HttpSession session, Model model) {
		logger.info("/goods/order [GET]");
		
		//회원정보와 일치하는 카트List 전체 출력
		List<Map<String, Object>> cartList = goodsService.getcartList((int)session.getAttribute("loginNo"));
		logger.info("{}", cartList);
		
		model.addAttribute("cartList",cartList);
		
		//회원 정보 불러오기
		
		
		
	}

}
