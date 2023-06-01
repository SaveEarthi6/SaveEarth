package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Info;
import web.util.Paging;

public interface InfoDao {

	int selectCntAll();

	List<Info> selectList(Paging paging);
	

}
