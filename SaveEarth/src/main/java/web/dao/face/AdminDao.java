package web.dao.face;

import web.dto.Admin;

public interface AdminDao {

   public int selectCntByIdPw(Admin adminParam);

}