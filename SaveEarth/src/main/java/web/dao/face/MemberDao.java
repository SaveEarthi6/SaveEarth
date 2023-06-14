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
	public Member selectById(String loginId);

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
	public Member selectInfoById(String loginId);

	/**
	 * 회원가입 아이디 중복확인
	 * @param member
	 * @return
	 */
	public int overlappedID(Member member);

	
	/**
	 * 회원가입 이메일 중복확인
	 * @param member
	 * @return
	 */
	public int overlappedEmail(Member member);

	/**
	 * 회원정보 삭제
	 * @param member
	 */
	public void delete(String loginId);

	/**
	 * 회원정보 수정
	 * @param member
	 */
	public void updateUser(Member member);

	
	/**
	 * id email 있는 거 확인
	 * @param member
	 * @return 1 존재 0 없음
	 */
	public int existIdEmail(Member member);

	
	/**
	 *  임시비밀번호 업데이트
	 * @param member
	 * @return id와 임시비밀번호
	 */
	public void updateTemPwSha(Member member);

	public int kakaoExist(Member member);

	public String getType(Member member);



	






}
