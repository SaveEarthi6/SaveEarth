package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Admin;
import web.dto.Campaign;
import web.util.Paging;

public interface AdminDao {

	public int selectCntByIdPw(Admin adminParam);

	public int selectCntAll();

	public List<Map<String, Object>> selectList(Paging paging);

	public int selectCntAll2();

	


}
