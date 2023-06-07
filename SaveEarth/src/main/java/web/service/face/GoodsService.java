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
	 *  상품 번호에 맞는 옵션 가져오기
	 * @param prodno
	 * @return
	 */
	public List<Map<String, Object>> getOptionList(int prodno);

	
	
}
