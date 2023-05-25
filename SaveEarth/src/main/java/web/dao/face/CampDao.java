package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Campaign;
import web.util.Paging;

public interface CampDao {

	public int selectCntAll();

	public List<Campaign> selectCampList(Paging paging);

	public Map<String, Object> selectCamp(int campno);

}
