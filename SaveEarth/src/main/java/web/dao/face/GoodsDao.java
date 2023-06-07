package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Cart;
import web.dto.Order;
import web.dto.Product;
import web.util.Paging;

public interface GoodsDao {

	public int selectCntAll();
	
	public List<Product> selectProdList(Paging paging);

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

}
