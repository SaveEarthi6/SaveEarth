package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Cart;
import web.dto.Ordertb;
import web.dto.Order;
import web.dto.ProdOption;
import web.dto.Product;
import web.util.Paging;

public interface GoodsDao {

	public int selectCntAll();
	
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

	public List<Order> selectOrderList(int userNo);

	public Product getProdinfo(int prodNo);

	public ProdOption getProdopt(int prodOptNo);

	public void insertordertb(Ordertb ordertb);



	public void updateAmount(Map<String, Object> param);

}
