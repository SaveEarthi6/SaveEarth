package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Info;
import web.util.Paging;

public interface InfoService {

	/**
	 * 
	 * @param curPage
	 * @return
	 */
	Paging getPaging(int curPage);

	/**
	 * 
	 * @param paging
	 * @return
	 */
	List<Info> getInfoList(Paging paging);


}
