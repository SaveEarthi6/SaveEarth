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
	 * @param member
	 */
	public void updateUser(Member member);
	
	/**
	 * 회원정보 삭제
	 * @param member
	 */
	public void delete(String loginid);

	
	
	/**
	 * 이름 이메일로 아이디 찾기
	 * @param member - name, email
	 * @return
	 */
	public int checkid(Member member);


	public Member selectIdByNameEmail(Member member);


	

	
	






}
