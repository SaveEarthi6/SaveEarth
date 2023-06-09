package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.GoodsDao;
import web.dto.Campaign;
import web.dto.Cart;
import web.dto.Ordertb;
import web.dto.ProdOption;
import web.dto.Product;
import web.service.face.GoodsService;
import web.util.Paging;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	GoodsDao goodsDao;

	@Override
	public Paging getPaging(int curPage) {
	logger.info("getPaging() - curPage : {}", curPage);
		
		//총 게시글 수 조회하기
		int totalCount = goodsDao.selectCntAll();
		logger.info("totalCount : {}", totalCount);
		
		//페이징 객체
		Paging paging = new Paging(totalCount, curPage, 6);
		
		return paging;
		
	}

	@Override
	public List<Map<String, Object>> getgoodsList(Paging paging) {
		logger.info("getList() - paging : {}", paging);
		
		return goodsDao.selectProdList(paging);
	}

	@Override
	public Map<String, Object> getProdDetail(int prodno) {
		
		logger.info("getCampDetail() - campno : {}", prodno);
		
		return goodsDao.selectProd(prodno);
	}

	@Override
	public void addCart(Cart cart) {
		
		int existCart = goodsDao.existCart(cart);
		
		System.out.println("cart확인"+cart);
		System.out.println("존재 유무 확인"+existCart);
		if(existCart<1) {
			
			//인서트
			goodsDao.addCart(cart);
			
		} else {
			
			//업데이트
			goodsDao.updateCart(cart);
			
		}
		
		
		
	}

	@Override
	public List<Map<String, Object>> getcartList(int userNo) {
		
		
		
		return goodsDao.selectCartListByuserno(userNo);
	}
	
	@Override
	public void deleteCart(int userNo, String cartNo) {

		goodsDao.deleteCart(userNo, cartNo);
		
	}

	@Override
	public List<Map<String, Object>> getOptionList(int prodno) {
		
		return goodsDao.getOption(prodno);
	}

	@Override
	public Product getProdinfo(int prodNo) {
		
		return goodsDao.getProdinfo(prodNo);
	}
	
	@Override
	public ProdOption getProdopt(int prodOptNo) {
		
		return goodsDao.getProdopt(prodOptNo);
	}

	@Override
	public void insertordertb(Ordertb ordertb) {
		goodsDao.insertordertb(ordertb);
		
	}



}
