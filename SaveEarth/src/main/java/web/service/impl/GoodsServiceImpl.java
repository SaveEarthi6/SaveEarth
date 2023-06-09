package web.service.impl;



import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.GoodsDao;
import web.dto.Cart;
import web.dto.Ordertb;
import web.dto.Order;
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
	public void deleteCartBySelect(int userNo, String cartNo) {

		goodsDao.deleteCartBySelect(userNo, cartNo);
		
	}
	
	@Override
	public void deleteCart(int userNo) {
		
		goodsDao.deleteCartAll(userNo);
		
	}


	@Override
	public List<Map<String, Object>> getOptionList(int prodno) {
		
		return goodsDao.getOption(prodno);
	}

	@Override
	public void makeOrder(Order order) {

		goodsDao.insertOrder(order);
		
	}
	
	@Override
	public List<Order> orderList(int userNo) {
		
		return goodsDao.selectOrderList(userNo);
	}
	
	@Override
	public void updateAmount(Map<String, Object> param) {

		goodsDao.updateAmount(param);
	}
	
	@Override
	public void paymentTest(HttpServletRequest request) {

	      String orderId = request.getParameter("orderId");
	      String paymentKey = request.getParameter("paymentKey");
	      String amount = request.getParameter("amount");
	      String secretKey = "test_sk_JQbgMGZzorzPqjjEMJD3l5E1em4d:";

	      JSONObject jsonObject = null;
	      
	      Encoder encoder = Base64.getEncoder(); 
	      byte[] encodedBytes;
	      HttpURLConnection connection = null;
	      int code = 0;
	      try {
	         encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
	         String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);

	         paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);

	         URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");

	         connection = (HttpURLConnection) url.openConnection();
	         connection.setRequestProperty("Authorization", authorizations);
	         connection.setRequestProperty("Content-Type", "application/json");
	         connection.setRequestMethod("POST");
	         connection.setDoOutput(true);

	         JSONObject obj = new JSONObject();
	         obj.put("paymentKey", paymentKey);
	         obj.put("orderId", orderId);
	         obj.put("amount", amount);
	         
	         OutputStream outputStream = connection.getOutputStream();
	         outputStream.write(obj.toString().getBytes("UTF-8"));
	         
	         code = connection.getResponseCode();
	         boolean isSuccess = code == 200 ? true : false;
	         
	         InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();
	         
	         Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
	         JSONParser parser = new JSONParser();
	         jsonObject = (JSONObject) parser.parse(reader);
	         
	         responseStream.close();
	         
	            if (isSuccess) {
	                //결제 성공
	                     logger.info("결과 데이터 : {}", jsonObject.toJSONString()); 
	                     logger.info("orderName : {}", jsonObject.get("orderName")); 
	                     logger.info("method : {}", jsonObject.get("method")); 
	                        
	                     if(jsonObject.get("method").equals("카드")) {  logger.info("method : {}",(((JSONObject)jsonObject.get("card")).get("number")));}
	                     if(jsonObject.get("method").equals("가상계좌")) { logger.info("method : {}",(((JSONObject)jsonObject.get("virtualAccount")).get("accountNumber")));} 
	                     if(jsonObject.get("method").equals("계좌이체")) { logger.info("method : {}",(((JSONObject)jsonObject.get("transfer")).get("bank")));}
	                     if(jsonObject.get("method").equals("휴대폰")) { logger.info("method : {}",(((JSONObject)jsonObject.get("mobilePhone")).get("customerMobilePhone")));}     
	                           
	                    } else { 
	                   //결제 실패
	                        logger.info("method : {}", jsonObject.get("message")); 
	                        logger.info("에러코드 : {}", jsonObject.get("code") ); 
	                    }
	      } catch (UnsupportedEncodingException e) {
	         e.printStackTrace();
	      } catch (MalformedURLException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      } catch (ParseException e) {
	         e.printStackTrace();
	      }
	      
	      
		
		
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
