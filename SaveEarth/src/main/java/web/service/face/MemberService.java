package web.service.face;

import web.dto.Member;

public interface MemberService {

	public void join(Member memberParam);

	public boolean login(Member member);

}
