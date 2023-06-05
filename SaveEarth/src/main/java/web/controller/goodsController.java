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
		
		
		for(Product c : prodList) {
			logger.info("{}", c);
		}
		
		model.addAttribute("prodList", prodList);
		model.addAttribute("paging", paging);		
		
		
	}
	
	@RequestMapping("/detail")
	public void prodDetail(Model model, int prodno) {
		logger.info("/campaign/detail [GET]");
		logger.info("campno : {}", prodno);
		
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

		//Cart cart에 값 넣기
		//20230604 장바구니 시퀀스 추가해서 Mapper까지 수정해야함(아직 시퀀스 x 제약조건x) 일단 이건 장바구니 들어가나 테스트!!!!!!!!!!!!!!!!!!!! 확인(o)
		cart.setCartNo(1);
		//유저번호
		cart.setUserNo(userNo);
		//수량
		cart.setProdCount(prodCount);
		//상품번호
		cart.setProdNo(prodno);
		
		System.out.println(cart);
		
		goodsService.addCart(cart);
		
		//장바구니에 유저넘버랑 상품넘버랑 값줘서 있나 없나 비교 먼저하고 없으면 insert 하고 이미 장바구니에 있으면  갯수만 변경해주는 걸로 코드 짜면 될듯?!
		

		
		//장바구니 담고 다시 상세페이지 창으로 돌아가
		return "redirect:/goods/detail?prodno=" + prodno; 
		
	}

}
