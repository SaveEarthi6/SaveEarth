package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Admin;
import web.dto.Free;
import web.dto.FreeFile;
import web.util.Paging;

public interface AdminDao {

   public int selectCntByIdPw(Admin adminParam);

   public int selectCntAll();

   public List<Map<String, Object>> selectList(Paging paging);

   public void updateHit(Free freeBoard);

   public Free selectFreeBoard(Free freeBoard);

   public String selectNickById(String loginId);

   public FreeFile selectFreeFile(Free freeBoard);

   public int selectCntAll2();

}