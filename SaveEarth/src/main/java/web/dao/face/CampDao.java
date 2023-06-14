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

//	public List<Campaign> selectCampList(Paging paging);
	public List<Map<String, Object>> selectCampList(Paging paging);

	public Map<String, Object> selectCamp(int campno);

	public int selectCntAllByState(String state);

//	public List<Campaign> selectCampListByState(Map<String, Object> param);
	public List<Map<String, Object>> selectCampListByState(@Param("paging") Paging paging, @Param("state") String state);

	public int selectPartNo();

	public void insertCert(Map<String, String> certification);

	public void insertFile(CertificationFile certFile);

	public List<Calendar> selectCalList();

	public List<Campaign> selectIngList(int userNo);

	public List<Certification> selectCertByUserNo(int userNo);

	public List<Map<String, Object>> selectCertByDate(@Param("userNo") int userNo, @Param("calDate") String calDate);

	public void deleteCert(@Param("partNo")int partNo, @Param("partFileNo")int partFileNo);

	public Map<String, Object> selectCert(@Param("userNo") int userNo, @Param("partNo") int partNo);

	public int campParticipate(int campno);

}
