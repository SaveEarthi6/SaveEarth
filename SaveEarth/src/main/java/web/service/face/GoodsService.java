package web.service.face;

import java.util.List;
import java.util.Map;


import web.dto.Product;
import web.util.Paging;

public interface GoodsService {

	Paging getPaging(int curPage);

	List<Product> getgoodsList(Paging paging);

	Map<String, Object> getProdDetail(int prodno);



}
