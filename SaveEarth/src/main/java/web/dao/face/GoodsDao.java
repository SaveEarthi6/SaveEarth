package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Cart;
import web.dto.ProdOption;
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


}
