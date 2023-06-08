package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Cart;
import web.dto.ProdOption;
import web.dto.Product;
import web.util.Paging;

public interface GoodsService {

	public Paging getPaging(int curPage);

	/**
	 * 상품 목록 불러오기
	 * @param paging
	 * @return
	 */
	public List<Product> getgoodsList(Paging paging);

	
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
	public void deleteCart(int userNo, String cartNo);



	
	/**
	 *  상품 번호에 맞는 옵션 가져오기
	 * @param prodno
	 * @return
	 */
	public List<Map<String, Object>> getOptionList(int prodno);

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

	
	
}
