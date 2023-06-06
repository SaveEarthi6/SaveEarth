package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Info;
import web.util.Paging;

public interface InfoDao {

	int selectCntAll();

	public List<Map<String, Object>> selectList(Paging paging);

	public int selctCntAllByState(String state);

	public List<Map<String, Object>> selectInfoListByState(@Param("paging")Paging paging, @Param("state")String state);
	

}
