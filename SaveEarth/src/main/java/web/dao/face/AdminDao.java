package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Admin;
import web.dto.Free;
import web.dto.FreeFile;
import web.util.Paging;

public interface AdminDao {

//   public int selectCntByIdPw(Admin adminParam);

   public int selectCntAll();

   public List<Map<String, Object>> selectList(Paging paging);

   public void updateHit(Free freeBoard);

	public Map<String, Object> selectFreeBoard(@Param("freeBoard") Free freeBoard);

	public List<FreeFile> selectFreeFile(Free freeBoard);

//	public String selectNickById(String adminId);


   public int selectCntAll2();

   public int selectCntByIdPw(Admin admin);

   public Admin selectById(String adminId);

//   public Admin adminlogin(Admin adminParam);


}