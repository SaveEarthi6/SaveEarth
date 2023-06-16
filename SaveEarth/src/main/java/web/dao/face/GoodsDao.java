package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Cart;
import web.dto.Member;
import web.dto.Ordertb;
import web.dto.ProdInq;
import web.dto.Order;
import web.dto.OrderInfo;
import web.dto.ProdOption;
import web.dto.ProdReView;
import web.dto.Product;
import web.util.Paging;

public interface GoodsDao {

	public int selectCntAll();
	
	public int selectCntAllOrderList(int userNo);
	
	public List<Map<String, Object>> selectProdList(Paging paging);

	public Map<String, Object> selectProd(int prodno);

	public void addCart(Cart cart);

	public List<Map<String, Object>> selectCartListByuserno(int userNo);

	public int existCart(Cart cart);

	public void updateCart(Cart cart);
 
	public List<Map<String, Object>> getOption(int prodno);

	public void deleteCartBySelect(@Param("userNo") int userNo, @Param("cartNo") String cartNo);

	public void insertOrder(Order order);

	public void deleteCartAll(int userNo);

	public List<Order> selectOrderList(@Param("userNo") int userNo, @Param("paging") Paging paging);

	public Product getProdinfo(int prodNo);

	public ProdOption getProdopt(int prodOptNo);

	public void insertordertb(Ordertb ordertb);

	public void updateAmount(Map<String, Object> param);

	public Map<String, Object> selectCartListBySelect(@Param("userNo") int userNo, @Param("cartNo") String cartNo);

	public Member selectUserShipInfo(int userNo);

	public List<OrderInfo> selectOrderInfo(@Param("userNo") int userNo, @Param("orderNo") String orderNo);

	public List<Map<String, Object>> getdetailfiles(int prodno);

	public void insertInqByprodNouserNo(ProdInq prodInq);

	public List<Map<String, Object>> getInqListByprodno(int prodno);

	public Member selectUserInfo(int userNo);
	
	public List<Map<String, Object>> getreviewList(ProdReView prodreView);

	public void addreview(ProdReView prodreView);

	public int existreview(ProdReView prodreView);

	public void deletereview(int reviewNo);	
	
	public Map<String, Object> getnowreview(ProdReView prodreView);

	public int ordercheck(ProdReView prodreView);



}
