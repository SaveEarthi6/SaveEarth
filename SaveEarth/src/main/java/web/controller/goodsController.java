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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Campaign;
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
	public void campDetail(Model model, int prodno) {
		logger.info("/campaign/detail [GET]");
		logger.info("campno : {}", prodno);
		
		Map<String, Object> goodsDetail = goodsService.getProdDetail(prodno);
		logger.info("{}", goodsDetail);
		
		//인증현황 조회해오기
		
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
	
	@GetMapping("/cart")
	public void getcart() {
		
	}

}
