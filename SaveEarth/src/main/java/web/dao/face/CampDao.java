package web.dao.face;

import java.util.List;

import web.dto.Campaign;
import web.util.Paging;

public interface CampDao {

	public int selectCntAll();

	public List<Campaign> selectCamp(Paging paging);

}
