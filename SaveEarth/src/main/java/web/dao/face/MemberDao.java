package web.dao.face;

import web.dto.Member;

public interface MemberDao {

	public void insert(Member memberParam);

	public int selectCntByIdPw(Member member);

	/**
	 * 회원정보 조회
	 * @param loginid
	 * @return
	 */
	public Member selectById(String loginid);

	/**
	 * 회원정보 수정
	 * @param loginid
	 * @return
	 */
	public Member updateUser(String loginid);




}
