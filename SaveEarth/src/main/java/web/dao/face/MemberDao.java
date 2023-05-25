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
	 * 이름 이메일로 아이디 찾기
	 * @param member - name, email
	 * @return
	 */
	public int checkid(Member member);



	public Member selectIdByNameEmail(Member member);


	/**
	 * 로그인한 아이디로 회원정보를 가져온다
	 * @param loginid - 로그인한 아이디
	 * @return - 회원 정보
	 */
	public Member selectInfoById(String loginid);

	public int overlappedID(Member member);

	


	/**
	 * 회원정보 삭제
	 * @param member
	 */
	public void delete(String loginid);

	/**
	 * 회원정보 수정
	 * @param member
	 */
	public void updateUser(Member member);






}
