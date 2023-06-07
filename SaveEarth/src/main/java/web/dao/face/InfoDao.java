package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Free;
import web.dto.Info;
import web.util.Paging;

public interface InfoDao {


	public int selectCntAll();

	public List<Map<String, Object>> selectList(Paging paging);

	public List<Free> getTopFreeRecommend(int count);
	

}
