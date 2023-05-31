package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Calendar;
import web.dto.Campaign;
import web.dto.Certification;
import web.dto.CertificationFile;
import web.util.Paging;

public interface CampDao {

	public int selectCntAll();

	public List<Campaign> selectCampList(Paging paging);

	public Map<String, Object> selectCamp(int campno);

	public int selectCntAllByState(String state);

//	public List<Campaign> selectCampListByState(Map<String, Object> param);
	public List<Campaign> selectCampListByState(@Param("paging") Paging paging, @Param("state") String state);

	public int selectPartNo();

	public void insertCert(Certification certification);

	public void insertFile(CertificationFile certFile);

	public List<Calendar> selectCalList();

	public List<Campaign> selectIngList();

	public List<Certification> selectCertByUserNo(int userNo);

	public List<Map<String, Object>> selectCertByDate(@Param("userNo") int userNo, @Param("calDate") String calDate);

}
