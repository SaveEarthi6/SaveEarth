package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/update")
	public void mypageUpdate() {
		logger.info("/mypage/update");
	}
	
	@RequestMapping("/delete")
	public void mypageDelete() {
		logger.info("/mypage/delete");
	}
	
	@RequestMapping("/board")
	public void mypageBoard() {
		logger.info("/mypage/board");
	}
	
	@RequestMapping("/order")
	public void mypageOrder() {
		logger.info("/mypage/order");
	}

}
