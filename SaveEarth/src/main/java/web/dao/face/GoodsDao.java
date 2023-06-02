package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Product;
import web.util.Paging;

public interface GoodsDao {

	public int selectCntAll();
	
	public List<Product> selectProdList(Paging paging);

	public Map<String, Object> selectProd(int prodno);


}
