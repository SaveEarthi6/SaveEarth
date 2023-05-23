package web.service.face;

import web.dto.Member;

public interface MemberService {

	public void join(Member memberParam);

	public boolean login(Member member);

	
	/**
	 * 마이페이지 사용자 정보조회
	 * @param loginid
	 * @return
	 */
	public Member info(String loginid);

}
