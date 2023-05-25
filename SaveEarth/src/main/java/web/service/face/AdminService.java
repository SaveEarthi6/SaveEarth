package web.service.face;

import web.dto.Admin;

public interface AdminService {

	/**
	 * 관리자 로그인
	 * @param admin
	 * @return
	 */
	boolean login(Admin admin);

}
