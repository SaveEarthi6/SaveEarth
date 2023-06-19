package web.service.face;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import web.dto.Cart;
import web.dto.Member;
import web.dto.Order;
import web.dto.OrderDetail;
import web.dto.OrderInfo;
import web.dto.ProdInq;
import web.dto.ProdOption;
import web.dto.ProdReView;
import web.dto.Product;
import web.util.Paging;

public interface GoodsService {

	public Paging getPaging(int curPage);
	
	public Paging getPagingOrder(int userNo, int curPage);

	/**
	 * 상품 목록 불러오기
	 * @param paging
	 * @return
	 */
	List<Map<String, Object>> getgoodsList(Paging paging);

	
	/**
	 * 상품 디테일 정보 불러오기
	 * @param prodno
	 * @return
	 */
	public Map<String, Object> getProdDetail(int prodno);

	/**
	 * 장바구니에 넣기
	 * @param cart
	 */
	public void addCart(Cart cart);

	
	
	/**
	 * 유저넘버에 해당하는 장바구니 리스트 불러오기
	 * @param userNo
	 * @return
	 */
	public List<Map<String, Object>> getcartList(int userNo);

	/**
	 * 회원번호, 장바구니 번호와 일치하는 데이터 cart DTO에서 삭제하기
	 * 
	 * @param userNo - 로그인한 회원의 번호
	 * @param carttNo - 삭제하려는 장바구니의 번호
	 */
	public void deleteCartBySelect(int userNo, String cartNo);



	
	/**
	 *  상품 번호에 맞는 옵션 가져오기
	 * @param prodno
	 * @return
	 */
	public List<Map<String, Object>> getOptionList(int prodno);

	/**
	 * 주문정보 DB에 삽입하기
	 * 
	 * @param order - 주문정보가 담긴 DTO
	 */
	public void makeOrder(Order order);

	/**
	 * 전체주문 후 해당 회원번호의 장바구니 비우기
	 * 
	 * @param userNo
	 */
	public void deleteCart(int userNo);

	/**
	 * 회원번호와 일치하는 주문목록 리스트 불러오기
	 * 
	 * @param userNo - 로그인한 회원의 번호
	 * @return 회원의 주문목록 리스트
	 */
	public List<Order> orderList(int userNo, Paging paging);

	/**
	 * 일치하는 cartNo의 수량 변경
	 * 
	 * @param param - cartNo과 변경할 수량
	 */
	public void updateAmount(Map<String, Object> param);

	/**
	 * 결제 테스트
	 * 
	 * @param request
	 */
	public void paymentTest(HttpServletRequest request, Order order, String cartArr);

	/**
	 * 바로구매 상품정보 가져오기
	 * @param prodNo
	 * @return
	 */
	public Product getProdinfo(int prodNo);

	/**
	 * 바로구매 상품옵션 가져오기
	 * @param prodOptNo
	 * @return
	 */
	public ProdOption getProdopt(int prodOptNo);

	/**
	 * 회원번호와 일치하는 cart 목록 가져오기
	 * 
	 * @param userNo - 로그인한 회원의 번호
	 * @param cartNo - 주문하려는 cart의 번호
	 * @return
	 */
	public Map<String, Object> getCartListBySelect(int userNo, String cartNo);

	/**
	 * 회원번호와 일치하는 회원의 배송정보 가져오기
	 * 
	 * @param userNo - 로그인한 회원의 번호
	 * @return 회원의 배송정보
	 */
	public Member getUserShipInfo(int userNo);

	/**
	 * 회원번호와 일치하는 회원의 주문번호 상세정보 가져오기
	 * 
	 * @param userNo - 로그인한 회원의 번호
	 * @param orderNo - 주문번호
	 */
	public List<OrderInfo> getOrderInfo(int userNo, String orderNo);

	/**
	 * 파일들 가져오기
	 * 상세정보에서 밑에 설명사진들가져오기
	 * @param prodno
	 * @return
	 */
	public List<Map<String, Object>> getdetailfiles(int prodno);

	
	/**
	 * 상품문의하기
	 * @param prodInq
	 */
	public void insertInq(ProdInq prodInq);

	
	
	/**
	 * 상품문의 목록 불러오기
	 * @param prodno
	 * @return
	 */
	public List<Map<String, Object>> getInqList(int prodno);

	/**
	 * 회원번호와 일치하는 회원의 정보 불러오기
	 * 
	 * @param userNo - 로그인한 회원의 번호
	 * @return 일치하는 회원의 정보
	 */
	public Member getUserInfo(int userNo);

	/**
	 * 선택결제 장바구니 지우기
	 * 
	 * @param userNo
	 * @param cartNo
	 */
	public void deleteCart(int attribute, String cartNo);
	
	public List<Map<String, Object>> reviewList(ProdReView prodreView);

	public void addreview(ProdReView prodreView);	

	/**
	 * 전에 썻던 리뷰가 있나확인
	 * @param prodreView
	 * @return
	 */
	public boolean checkreview(ProdReView prodreView);

	public void deletereview(int reviewNo);


	/**
	 * ajax를 위해 방금 쓴 리뷰 아이디랑 같이 가져오기
	 * @param prodreView
	 * @return
	 */
	public Map<String, Object> getnowreview(ProdReView prodreView);

	/**
	 * 주문했나 안헀나 체크
	 * @param prodreView
	 * @return
	 */
	public int ordercheck(ProdReView prodreView);

	public void directpaymentTest(HttpServletRequest request, Order order);

	public void directorderdetail(OrderDetail orderdetail);

	
}
