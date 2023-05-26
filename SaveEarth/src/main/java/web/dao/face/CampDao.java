package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Campaign;
import web.util.Paging;

public interface CampDao {

	public int selectCntAll();

	public List<Campaign> selectCampList(Paging paging);

	public Map<String, Object> selectCamp(int campno);

	public int selectCntAllByState(String state);

//	public List<Campaign> selectCampListByState(Map<String, Object> param);
	public List<Campaign> selectCampListByState(@Param("paging") Paging paging, @Param("state") String state);

}
